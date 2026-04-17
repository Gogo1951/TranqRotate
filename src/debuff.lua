-- Get a debuff on the player by spellId, using C_UnitAuras on 1.15.x with a fallback to UnitDebuff for TBC 2.5.5.
local function getPlayerDebuffBySpellId(spellId)
    if (C_UnitAuras and C_UnitAuras.GetAuraDataByIndex) then
        for i = 1, 40 do
            local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HARMFUL")
            if (not aura) then
                break
            end
            if (aura.spellId == spellId) then
                return aura.name, aura.expirationTime
            end
        end
    elseif (UnitDebuff) then
        for i = 1, 40 do
            local name, _, _, _, _, expirationTime, _, _, _, auraSpellId = UnitDebuff("player", i)
            if (not name) then
                break
            end
            if (auraSpellId == spellId) then
                return name, expirationTime
            end
        end
    end

    return nil
end

-- Checks if player is incapacitated by a debuff for too long
function TranqRotate:isPlayedIncapacitatedByDebuff()
    for _, debuffId in ipairs(TranqRotate.constants.incapacitatingDebuffs) do
        local name, expirationTime = getPlayerDebuffBySpellId(debuffId)
        if (name and expirationTime - GetTime() > TranqRotate.db.profile.incapacitatedDelay) then
            return true
        end
    end

    return false
end

-- Kept for backward compatibility with anything external that may have called this method
function TranqRotate:getPlayerDebuff(debuffId)
    return getPlayerDebuffBySpellId(debuffId)
end
