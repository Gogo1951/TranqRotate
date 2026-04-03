if (GetLocale() ~= "itIT") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate caricato, digita /tranq per le opzioni",
    ["TRANQ_WINDOW_HIDDEN"] = "Finestra di TranqRotate nascosta. Usa /tranq toggle per visualizzarla",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "Nascondi finestra",
    ["BUTTON_SETTINGS"] = "Impostazioni",
    ["BUTTON_RESET_ROTATION"] = "Reimposta Rotazione",
    ["BUTTON_PRINT_ROTATION"] = "Stampa Rotazione",

    -- Settings
    ["SETTING_GENERAL"] = "Generale",
    ["SETTING_GENERAL_REPORT"] = "Per favore segnala qualsiasi problema su",
    ["SETTING_GENERAL_DESC"] = "Nuovo: TranqRotate ora riprodurrà un suono quando devi usare il tuo tiro tranquillante! Ci sono anche altre opzioni di visualizzazione per rendere l'addon meno invasivo.",

    ["LOCK_WINDOW"] = "Blocca finestra",
    ["LOCK_WINDOW_DESC"] = "Blocca finestra",
    ["RESET_WINDOW_POSITION"] = "Reimposta posizione",
    ["RESET_WINDOW_POSITION_DESC"] = "Reimposta la posizione della finestra principale",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "Nascondi la finestra quando non sei in incursione",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "Nascondi la finestra quando non sei in incursione",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "Non mostrare la finestra quando ti unisci a un'incursione",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "Seleziona questa opzione se non vuoi che la finestra appaia ogni volta che ti unisci a un'incursione",
    ["SHOW_WHEN_TARGETING_BOSS"] = "Mostra la finestra quando bersagli un boss tranquillizzabile",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "Mostra la finestra quando bersagli un boss tranquillizzabile",
    ["WINDOW_LOCKED"] = "TranqRotate: Finestra bloccata",
    ["WINDOW_UNLOCKED"] = "TranqRotate: Finestra sbloccata",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "Formato nomi giocatori",
    ["PLAYER_NAME_FORMAT_DESC"] = "Sui reami connessi, i giocatori di altri server avranno il suffisso del server nascosto di default. Se ti capita di avere due cacciatori con l'esatto stesso nome, regola questa impostazione",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "NomeGiocatore",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "NomeGiocatore-Ser",
    ["FULL_NAME_OPTION_LABEL"] = "NomeGiocatore-Server",

    ["TEST_MODE_HEADER"] = "Modalità test",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "Attiva/Disattiva modalità test",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "Mentre la modalità test è abilitata, il Tiro Arcano sarà registrato come un Tiro Tranquillante\n" ..
        "La modalità test durerà 10 minuti a meno che non la disabiliti",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "Modalità test del Tiro Arcano abilitata per 10 minuti",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "Modalità test del Tiro Arcano disabilitata",

    ["FEATURES_HEADER"] = "Funzionalità opzionali",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "Mostra barra del tempo di recupero della frenesia",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "Una sottile barra di avanzamento appena sotto la barra del titolo mostrerà l'avanzamento",
    ["DISPLAY_BLIND_ICON"] = "Mostra un'icona per i cacciatori senza TranqRotate",
    ["DISPLAY_BLIND_ICON_DESC"] = "Aggiunge un'icona cieca sul riquadro del cacciatore per indicare che non sta usando l'addon. Ciò significa che non sarà a conoscenza della rotazione a meno che tu non comunichi con lui e il suo tiro tranquillante non sarà sincronizzato se è lontano da ogni altro utente di TranqRotate.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "Mostra il tooltip dell'icona cieca",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "Puoi disabilitare questa opzione per rimuovere il tooltip pur mantenendo l'icona",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "Abilita l'avviso automatico alla riserva quando inabilitato",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "TranqRotate controllerà i tuoi debuff quando dovresti usare il tiro tranquillante e chiamerà la riserva se sei inabilitato per più del ritardo definito",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "Soglia avviso di inabilitazione",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "Se sei inabilitato per più del ritardo configurato, TranqRotate chiamerà automaticamente la riserva",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "Abilita avviso automatico temporizzato alla riserva",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "TranqRotate chiamerà la riserva se il boss è in frenesia per un ritardo definito e tu avresti dovuto usare il tiro tranquillante",
    ["TIMED_DELAY_THRESHOLD"] = "Soglia avviso temporizzato",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "TranqRotate chiamerà automaticamente la riserva se non usi il tiro tranquillante entro la soglia configurata",

    --- Announces
    ["SETTING_ANNOUNCES"] = "Annunci",
    ["ENABLE_ANNOUNCES"] = "Abilita annunci",
    ["ENABLE_ANNOUNCES_DESC"] = "Abilita / disabilita gli annunci.",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(I canali Urla e Dici non funzionano nel mondo aperto, ma funzioneranno nelle tue incursioni)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "Canale annunci",
    ["MESSAGE_CHANNEL_TYPE"] = "Invia messaggi a",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "Canale al quale vuoi inviare i messaggi",
    ["MESSAGE_CHANNEL_NAME"] = "Nome canale",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "Imposta il nome del canale di destinazione",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "Canale",
    ["CHANNEL_RAID_WARNING"] = "Avviso Incursione",
    ["CHANNEL_SAY"] = "Dici",
    ["CHANNEL_YELL"] = "Urla",
    ["CHANNEL_PARTY"] = "Gruppo",
    ["CHANNEL_RAID"] = "Incursione",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "Messaggi di annuncio",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "Messaggio di annuncio di successo sul boss (%s sarà sostituito dal nome del prossimo cacciatore)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "Messaggio di annuncio di successo sui trash (%s sarà sostituito dal nome del bersaglio)",
    ["FAIL_MESSAGE_LABEL"] = "Messaggio annuncio di fallimento",
    ["FAIL_WHISPER_LABEL"] = "Messaggio sussurro di fallimento",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "Messaggio sussurrato quando non puoi usare il tiro o chiami la riserva",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "Tiro tranquillante eseguito, %s è il prossimo!",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "Tiro tranquillante eseguito su %s",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! TIRO TRANQUILLANTE FALLITO SU %s !!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "TIRO TRANQUILLANTE MANCATO! SPARA ORA!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "NON POSSO USARE IL TIRO! SPARA ORA!",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "USA IL TIRO TRANQUILLANTE ORA!",

    ["BROADCAST_MESSAGE_HEADER"] = "Trasmissione testo setup rotazione",
    ["USE_MULTILINE_ROTATION_REPORT"] = "Usa riga multipla per la rotazione principale durante il resoconto",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "Seleziona questa opzione se desideri una visualizzazione dell'ordine più comprensibile",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "Setup Tiro Tranquillante Cacciatori",
    ["BROADCAST_ROTATION_PREFIX"] = "Rotazione",
    ["BROADCAST_BACKUP_PREFIX"] = "Riserva",

    --- Sounds
    ["SETTING_SOUNDS"] = "Suoni",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "Riproduci un suono quando sei il prossimo a dover sparare",
    ["ENABLE_TRANQ_NOW_SOUND"] = "Riproduci un suono quando devi usare il tiro tranquillante",
    ["TRANQ_NOW_SOUND_CHOICE"] = "Seleziona il suono che vuoi usare per l'avviso 'spara ora'",
    ["DBM_SOUND_WARNING"] = "DBM riproduce il suono 'bandiera presa' ad ogni frenesia, potrebbe impedirti di sentire i suoni leggeri di TranqRotate. Suggerisco di scegliere un suono forte o disabilitare il suono di frenesia di DBM.",

    --- Debug
    ["SETTING_DEBUG"] = "Debug",
    ["ENABLE_DEBUG_OUTPUT"] = "Abilita l'output di debug nella finestra della chat",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate stamperà informazioni di debug nella tua finestra principale della chat",

    --- Profiles
    ["SETTING_PROFILES"] = "Profili",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "Questo giocatore non usa TranqRotate",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "O esegue una versione obsoleta precedente alla %s",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(Puoi disabilitare questa icona e/o questo tooltip nelle impostazioni)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "Una nuova versione di TranqRotate è disponibile, aggiorna per avere le ultime funzioni",
    ["BREAKING_UPDATE_AVAILABLE"] = "Un nuovo IMPORTANTE aggiornamento di TranqRotate è disponibile, DEVI aggiornare IL PRIMA possibile! TranqRotate potrebbe non funzionare correttamente con gli utenti che usano la versione aggiornata.",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "Devi essere assistente incursione per reimpostare la rotazione",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "Inviando richiesta di riserva a %s",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "Ricevuta nuova configurazione di rotazione da %s",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s ha chiesto la riserva!",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s ha reimpostato la rotazione.",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "%s ha mancato il suo tiro tranquillante!",
    ["PRINT_FAILED_TRANQ_RESIST"] = "Il tiro tranquillante di %s è stato resistito!",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "Il tiro tranquillante di %s è stato mancato o resistito!",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "La riserva è stata richiesta automaticamente perché eri inabilitato",
    ["PRINT_TIMED_BACKUP_CALL"] = "La riserva è stata richiesta automaticamente perché eri troppo lento",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "Controllo versione",
    ["VERSION_CHECK_YOU"] = "Tu",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "Nessuna o inferiore a %s",
}

TranqRotate.L = L