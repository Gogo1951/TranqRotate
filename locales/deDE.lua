if (GetLocale() ~= "deDE") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate geladen, tippe /tranq für Optionen",
    ["TRANQ_WINDOW_HIDDEN"] = "TranqRotate-Fenster verborgen. Nutze /tranq toggle, um es wiederherzustellen",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "Fenster verbergen",
    ["BUTTON_SETTINGS"] = "Einstellungen",
    ["BUTTON_RESET_ROTATION"] = "Rotation zurücksetzen",
    ["BUTTON_PRINT_ROTATION"] = "Rotation posten",

    -- Settings
    ["SETTING_GENERAL"] = "Allgemein",
    ["SETTING_GENERAL_REPORT"] = "Bitte melde Probleme unter",
    ["SETTING_GENERAL_DESC"] = "Neu: TranqRotate spielt nun einen Ton ab, wenn du deinen Einlullenden Schuss abfeuern musst! Es gibt auch einige neue Anzeigeoptionen, um das Addon unauffälliger zu machen.",

    ["LOCK_WINDOW"] = "Fenster sperren",
    ["LOCK_WINDOW_DESC"] = "Fenster sperren",
    ["RESET_WINDOW_POSITION"] = "Position zurücksetzen",
    ["RESET_WINDOW_POSITION_DESC"] = "Setzt die Position des Hauptfensters zurück",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "Fenster außerhalb des Schlachtzugs verbergen",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "Fenster außerhalb des Schlachtzugs verbergen",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "Fenster beim Beitritt zu einem Schlachtzug nicht anzeigen",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "Aktiviere dies, wenn das Fenster nicht jedes Mal erscheinen soll, wenn du einem Schlachtzug beitrittst",
    ["SHOW_WHEN_TARGETING_BOSS"] = "Fenster anzeigen, wenn ein Boss für Einlullenden Schuss anvisiert ist",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "Fenster anzeigen, wenn ein Boss für Einlullenden Schuss anvisiert ist",
    ["WINDOW_LOCKED"] = "TranqRotate: Fenster gesperrt",
    ["WINDOW_UNLOCKED"] = "TranqRotate: Fenster entsperrt",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "Format für Spielernamen",
    ["PLAYER_NAME_FORMAT_DESC"] = "Auf verknüpften Realms wird das Server-Suffix von Spielern anderer Server standardmäßig verborgen. Falls du jemals zwei Jäger mit dem exakt selben Namen hast, passe diese Einstellung an",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "Spielername",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "Spielername-Ser",
    ["FULL_NAME_OPTION_LABEL"] = "Spielername-Server",

    ["TEST_MODE_HEADER"] = "Testmodus",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "Testmodus umschalten",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "Während der Testmodus aktiv ist, wird Arkaner Schuss als Einlullender Schuss gewertet\n" ..
        "Der Testmodus hält 10 Minuten an, es sei denn, du deaktivierst ihn",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "Testmodus für Arkanen Schuss für 10 Minuten aktiviert",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "Testmodus für Arkanen Schuss deaktiviert",

    ["FEATURES_HEADER"] = "Optionale Funktionen",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "Abklingzeit-Leiste für Wutanfall anzeigen",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "Ein dünner Fortschrittsbalken direkt unter der Titelleiste zeigt den Fortschritt an",
    ["DISPLAY_BLIND_ICON"] = "Symbol für Jäger ohne TranqRotate anzeigen",
    ["DISPLAY_BLIND_ICON_DESC"] = "Fügt dem Jägerfenster ein Blind-Symbol hinzu, um anzuzeigen, dass er das Addon nicht nutzt. Das bedeutet, dass er die Rotation nicht kennt, es sei denn, du kommunizierst mit ihm. Sein Einlullender Schuss wird auch nicht synchronisiert, wenn er weit entfernt ist.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "Tooltip für das Blind-Symbol anzeigen",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "Du kannst diese Option deaktivieren, um den Tooltip zu verbergen und das Symbol beizubehalten",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "Automatischen Backup-Alarm aktivieren, wenn handlungsunfähig",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "TranqRotate prüft deine Debuffs, wenn du eigentlich schießen müsstest, und ruft um Hilfe, wenn du länger als die definierte Verzögerung handlungsunfähig bist",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "Grenzwert für Handlungsunfähigkeit",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "Wenn du länger als die konfigurierte Verzögerung handlungsunfähig bist, ruft TranqRotate automatisch nach einem Ersatz",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "Zeitgesteuerten Backup-Alarm aktivieren",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "TranqRotate fordert automatisch Ersatz an, wenn der Boss für eine bestimmte Zeit im Wutanfall ist und du ihn hättest einlullen sollen",
    ["TIMED_DELAY_THRESHOLD"] = "Grenzwert für zeitgesteuerten Alarm",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "TranqRotate fordert automatisch Ersatz an, wenn du nicht innerhalb des konfigurierten Grenzwertes schießt",

    --- Announces
    ["SETTING_ANNOUNCES"] = "Ankündigungen",
    ["ENABLE_ANNOUNCES"] = "Ankündigungen aktivieren",
    ["ENABLE_ANNOUNCES_DESC"] = "Ankündigungen aktivieren / deaktivieren.",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(Sagen- und Schreien-Kanäle funktionieren nicht in der offenen Welt, aber in Schlachtzügen)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "Ankündigungskanal",
    ["MESSAGE_CHANNEL_TYPE"] = "Nachrichten senden an",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "Kanal, an den Nachrichten gesendet werden sollen",
    ["MESSAGE_CHANNEL_NAME"] = "Kanalname",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "Lege den Namen des Zielkanals fest",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "Kanal",
    ["CHANNEL_RAID_WARNING"] = "Schlachtzugswarnung",
    ["CHANNEL_SAY"] = "Sagen",
    ["CHANNEL_YELL"] = "Schreien",
    ["CHANNEL_PARTY"] = "Gruppe",
    ["CHANNEL_RAID"] = "Schlachtzug",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "Nachrichten ankündigen",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "Erfolgsmeldung beim Boss (%s wird durch den Namen des nächsten Jägers ersetzt)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "Erfolgsmeldung bei Trash (%s wird durch den Zielnamen ersetzt)",
    ["FAIL_MESSAGE_LABEL"] = "Fehlschlag-Meldung",
    ["FAIL_WHISPER_LABEL"] = "Fehlschlag-Flüstern",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "Flüsternachricht, wenn du nicht schießen kannst oder Ersatz anforderst",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "Einlullender Schuss erfolgreich, %s ist dran!",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "Einlullender Schuss auf %s",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! EINLULLENDER SCHUSS FEHLGESCHLAGEN AUF %s !!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "EINLULLENDER SCHUSS VERFEHLT! JETZT SCHIESSEN!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "ICH KANN NICHT SCHIESSEN! JETZT SCHIESSEN!",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "JETZT EINLULLENDEN SCHUSS NUTZEN!",

    ["BROADCAST_MESSAGE_HEADER"] = "Rotations-Setup posten",
    ["USE_MULTILINE_ROTATION_REPORT"] = "Mehrere Zeilen für die Hauptrotation beim Posten nutzen",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "Aktiviere diese Option, wenn du eine übersichtlichere Darstellung der Reihenfolge möchtest",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "Jäger Einlull-Rotation",
    ["BROADCAST_ROTATION_PREFIX"] = "Rotation",
    ["BROADCAST_BACKUP_PREFIX"] = "Ersatz",

    --- Sounds
    ["SETTING_SOUNDS"] = "Töne",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "Ton abspielen, wenn du als Nächster an der Reihe bist",
    ["ENABLE_TRANQ_NOW_SOUND"] = "Ton abspielen, wenn du schießen musst",
    ["TRANQ_NOW_SOUND_CHOICE"] = "Wähle den Ton, den du für den 'Jetzt schießen'-Alarm nutzen möchtest",
    ["DBM_SOUND_WARNING"] = "DBM spielt bei jedem Wutanfall den 'Flagge genommen'-Ton ab. Dies kann verhindern, dass du leisere Töne von TranqRotate hörst. Ich empfehle entweder einen lauten Ton zu wählen oder den DBM-Wutanfall-Ton zu deaktivieren.",

    --- Debug
    ["SETTING_DEBUG"] = "Debug",
    ["ENABLE_DEBUG_OUTPUT"] = "Debug-Ausgabe im Chatfenster aktivieren",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate gibt Debug-Informationen in deinem Haupt-Chatfenster aus",

    --- Profiles
    ["SETTING_PROFILES"] = "Profile",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "Dieser Spieler nutzt kein TranqRotate",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "Oder hat eine veraltete Version unter %s",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(Du kannst dieses Symbol und/oder diesen Tooltip in den Einstellungen deaktivieren)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "Eine neue Version von TranqRotate ist verfügbar. Aktualisiere, um die neuesten Funktionen zu erhalten",
    ["BREAKING_UPDATE_AVAILABLE"] = "Ein neues WICHTIGES Update für TranqRotate ist verfügbar. Du MUSST so schnell wie möglich aktualisieren! TranqRotate funktioniert möglicherweise nicht richtig mit Nutzern der aktuellen Version.",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "Du musst Schlachtzugsassistent sein, um die Rotation zurückzusetzen",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "Sende Backup-Anfrage an %s",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "Neue Rotationskonfiguration von %s erhalten",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s bittet um Ersatz!",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s hat die Rotation zurückgesetzt.",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "%s hat mit dem Einlullenden Schuss verfehlt!",
    ["PRINT_FAILED_TRANQ_RESIST"] = "%ss Einlullendem Schuss wurde widerstanden!",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "%ss Einlullender Schuss hat verfehlt oder wurde widerstanden!",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "Ersatz wurde automatisch angefordert, da du handlungsunfähig warst",
    ["PRINT_TIMED_BACKUP_CALL"] = "Ersatz wurde automatisch angefordert, da du zu langsam warst",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "Versionsprüfung",
    ["VERSION_CHECK_YOU"] = "Du",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "Keine oder unter %s",
}

TranqRotate.L = L