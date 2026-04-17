local L = TranqRotate.L

-- GetSpellInfo compat: prefer C_Spell on 1.15.x, fall back to the global on TBC 2.5.5.
local function getSpellName(spellId)
    if (C_Spell and C_Spell.GetSpellInfo) then
        local info = C_Spell.GetSpellInfo(spellId)
        return info and info.name or nil
    elseif (GetSpellInfo) then
        return (GetSpellInfo(spellId))
    end
    return nil
end

-- Cache the arcane shot name so we're not calling GetSpellInfo on every combat log event in test mode
local arcaneShotName

TranqRotate.eventFrame = CreateFrame("Frame")
TranqRotate.eventFrame:RegisterEvent("PLAYER_LOGIN")
TranqRotate.eventFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
TranqRotate.eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
TranqRotate.eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
TranqRotate.eventFrame:RegisterEvent("ENCOUNTER_END")

TranqRotate.eventFrame:SetScript(
    "OnEvent",
    function(self, event, ...)
        if (event == "PLAYER_LOGIN") then
            TranqRotate:init()
            self:UnregisterEvent("PLAYER_LOGIN")

            -- Delayed raid update because raid data is unreliable at PLAYER_LOGIN
            C_Timer.After(
                5,
                function()
                    TranqRotate:updateRaidStatus()
                end
            )

            return
        end

        TranqRotate[event](TranqRotate, ...)
    end
)

function TranqRotate:COMBAT_LOG_EVENT_UNFILTERED()
    -- @todo : Improve this with register / unregister event to save resources
    -- Avoid parsing combat log when not able to use it
    if (not TranqRotate.raidInitialized) then
        return
    end
    -- Avoid parsing combat log when outside instance if test mode isn't enabled
    if (not TranqRotate.testMode and not IsInInstance()) then
        return
    end

    local timestamp,
        event,
        _,
        sourceGUID,
        sourceName,
        sourceFlags,
        sourceRaidFlags,
        destinationGUID,
        destinationName,
        destinationFlags,
        destinationRaidFlags = CombatLogGetCurrentEventInfo()
    local spellIdentifier,
        spellName,
        spellSchool,
        amount,
        overkill,
        school,
        resisted,
        blocked,
        absorbed,
        critical,
        glancing,
        crushing,
        isOffHand = select(12, CombatLogGetCurrentEventInfo())

    local isTranqShot = spellIdentifier == TranqRotate.constants.tranqShotSpellId

    -- Test mode: treat any rank of arcane shot as a tranq
    if (not isTranqShot and TranqRotate.testMode) then
        if (not arcaneShotName) then
            arcaneShotName = getSpellName(TranqRotate.constants.arcaneShotSpellId)
        end
        if (arcaneShotName and spellName == arcaneShotName) then
            isTranqShot = true
        end
    end

    if (isTranqShot) then
        local hunter = TranqRotate:getHunter(sourceGUID)
        if (hunter) then
            if (event == "SPELL_CAST_SUCCESS") then
                TranqRotate:sendSyncTranq(hunter, false, timestamp)
                TranqRotate:rotate(hunter)
                if (sourceGUID == UnitGUID("player")) then
                    TranqRotate:sendAnnounceMessage(
                        TranqRotate:getTranqSuccessMessage(
                            TranqRotate:isTranqableBoss(destinationGUID),
                            destinationName,
                            destinationRaidFlags
                        )
                    )
                end
            elseif (event == "SPELL_MISSED" or event == "SPELL_DISPEL_FAILED") then
                TranqRotate:sendSyncTranq(hunter, true, timestamp, event)
                TranqRotate:handleFailTranq(hunter, event)
                if (sourceGUID == UnitGUID("player")) then
                    TranqRotate:sendAnnounceMessage(
                        TranqRotate:getTranqFailMessage(destinationName, destinationRaidFlags)
                    )
                end
            end
        end

        return
    end

    if (event == "SPELL_AURA_APPLIED" and TranqRotate:isBossFrenzy(spellIdentifier, sourceGUID)) then
        TranqRotate.frenzy = true

        if (TranqRotate:isPlayerNextTranq()) then
            TranqRotate:handleTimedAlert()
            TranqRotate:throwTranqAlert()

            if (TranqRotate.db.profile.enableIncapacitatedBackupAlert and TranqRotate:isPlayedIncapacitatedByDebuff()) then
                TranqRotate:alertBackup(TranqRotate.db.profile.unableToTranqMessage)
                TranqRotate:printPrefixedMessage(string.format(L["PRINT_INCAPACITATED_BACKUP_CALL"]))
            end
        end

        if (TranqRotate.db.profile.showFrenzyCooldownProgress) then
            local identifier = TranqRotate:getIdFromGuid(sourceGUID)
            TranqRotate:startBossFrenzyCooldown(TranqRotate.constants.bosses[identifier].cooldown)
        end

        return
    end

    if (event == "SPELL_AURA_REMOVED" and TranqRotate:isBossFrenzy(spellIdentifier, sourceGUID)) then
        TranqRotate.frenzy = false

        return
    end

    if (event == "UNIT_DIED" and TranqRotate:isTranqableBoss(destinationGUID)) then
        if (TranqRotate:isPlayerAllowedToManageRotation()) then
            TranqRotate:endEncounter()
        end
        TranqRotate.mainFrame.frenzyFrame:Hide()

        return
    end
end

-- Raid group has changed
function TranqRotate:GROUP_ROSTER_UPDATE()
    TranqRotate:updateRaidStatus()
end

-- Player left combat
function TranqRotate:PLAYER_REGEN_ENABLED()
    TranqRotate:updateRaidStatus()
end

-- Encounter has ended (fired for supported encounters)
function TranqRotate:ENCOUNTER_END()
    TranqRotate:endEncounter()
end

function TranqRotate:PLAYER_TARGET_CHANGED()
    if (TranqRotate.db.profile.showWindowWhenTargetingBoss) then
        if (TranqRotate:isTranqableBoss(UnitGUID("target")) and not UnitIsDead("target")) then
            TranqRotate.mainFrame:Show()
        end
    end
end

-- Register single unit events for a given hunter
function TranqRotate:registerUnitEvents(hunter)
    hunter.frame:RegisterUnitEvent("PARTY_MEMBER_DISABLE", hunter.name)
    hunter.frame:RegisterUnitEvent("PARTY_MEMBER_ENABLE", hunter.name)
    hunter.frame:RegisterUnitEvent("UNIT_HEALTH", hunter.name)
    hunter.frame:RegisterUnitEvent("UNIT_CONNECTION", hunter.name)
    hunter.frame:RegisterUnitEvent("UNIT_FLAGS", hunter.name)

    hunter.frame:SetScript(
        "OnEvent",
        function(self, event, ...)
            TranqRotate:updateHunterStatus(hunter)
        end
    )
end

-- Unregister single unit events for a given hunter
function TranqRotate:unregisterUnitEvents(hunter)
    hunter.frame:UnregisterEvent("PARTY_MEMBER_DISABLE")
    hunter.frame:UnregisterEvent("PARTY_MEMBER_ENABLE")
    hunter.frame:UnregisterEvent("UNIT_HEALTH")
    hunter.frame:UnregisterEvent("UNIT_CONNECTION")
    hunter.frame:UnregisterEvent("UNIT_FLAGS")
end

-- Handle timed alert for non tranqed frenzy
function TranqRotate:handleTimedAlert()
    if (TranqRotate.db.profile.enableTimedBackupAlert) then
        C_Timer.After(
            TranqRotate.db.profile.timedBackupAlertDelay,
            function()
                if (TranqRotate.frenzy and TranqRotate:isPlayerNextTranq()) then
                    TranqRotate:alertBackup(TranqRotate.db.profile.unableToTranqMessage)
                    TranqRotate:printPrefixedMessage(string.format(L["PRINT_TIMED_BACKUP_CALL"]))
                end
            end
        )
    end
end
