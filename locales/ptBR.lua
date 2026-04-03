if (GetLocale() ~= "ptBR") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate carregado, digite /tranq para opções",
    ["TRANQ_WINDOW_HIDDEN"] = "Janela do TranqRotate oculta. Use /tranq toggle para trazê-la de volta",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "Ocultar janela",
    ["BUTTON_SETTINGS"] = "Configurações",
    ["BUTTON_RESET_ROTATION"] = "Redefinir Rotação",
    ["BUTTON_PRINT_ROTATION"] = "Imprimir Rotação",

    -- Settings
    ["SETTING_GENERAL"] = "Geral",
    ["SETTING_GENERAL_REPORT"] = "Por favor, relate qualquer problema em",
    ["SETTING_GENERAL_DESC"] = "Novo: TranqRotate agora tocará um som quando você precisar atirar o seu tiro tranquilizante! Há também mais algumas opções de exibição para tornar o addon menos intrusivo.",

    ["LOCK_WINDOW"] = "Travar janela",
    ["LOCK_WINDOW_DESC"] = "Travar janela",
    ["RESET_WINDOW_POSITION"] = "Redefinir posição",
    ["RESET_WINDOW_POSITION_DESC"] = "Redefine a posição da janela principal",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "Ocultar a janela quando não estiver em uma raide",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "Ocultar a janela quando não estiver em uma raide",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "Não mostrar a janela ao entrar em uma raide",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "Marque isso se você não quiser que a janela apareça toda vez que você entrar em uma raide",
    ["SHOW_WHEN_TARGETING_BOSS"] = "Mostrar janela ao alvejar um chefe que precisa de tranquilizante",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "Mostrar janela ao alvejar um chefe que precisa de tranquilizante",
    ["WINDOW_LOCKED"] = "TranqRotate: Janela travada",
    ["WINDOW_UNLOCKED"] = "TranqRotate: Janela destravada",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "Formato do nome dos jogadores",
    ["PLAYER_NAME_FORMAT_DESC"] = "Em reinos conectados, os jogadores de outros servidores terão o sufixo do servidor oculto por padrão. Se você tiver dois caçadores com exatamente o mesmo nome, ajuste esta configuração",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "NomeJogador",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "NomeJogador-Ser",
    ["FULL_NAME_OPTION_LABEL"] = "NomeJogador-Servidor",

    ["TEST_MODE_HEADER"] = "Modo de teste",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "Alternar modo de teste",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "Enquanto o modo de teste estiver ativado, o tiro arcano será registrado como um tiro tranquilizante\n" ..
        "O modo de teste durará 10 minutos a menos que você o desative",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "Modo de teste do tiro arcano ativado por 10 minutos",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "Modo de teste do tiro arcano desativado",

    ["FEATURES_HEADER"] = "Recursos opcionais",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "Mostrar barra de progresso da recarga de frenesi",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "Uma barra de progresso fina logo abaixo da barra de título mostrará o progresso",
    ["DISPLAY_BLIND_ICON"] = "Mostrar um ícone para caçador sem o TranqRotate",
    ["DISPLAY_BLIND_ICON_DESC"] = "Adiciona um ícone cego no quadro do caçador para indicar que ele não está usando o addon. Isso significa que ele não estará ciente da rotação a menos que você se comunique com ele e seu tiro tranquilizante não será sincronizado se ele estiver longe de qualquer outro usuário do TranqRotate.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "Mostrar a dica de ferramenta do ícone cego",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "Você pode desativar esta opção para remover a dica de ferramenta e ainda manter o ícone",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "Ativar alerta de reserva automático ao estar incapacitado",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "O TranqRotate verificará suas penalidades quando você deveria usar o tranquilizante e chamará o reserva se você estiver incapacitado por um tempo maior do que o atraso definido",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "Limite de alerta de incapacitação",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "Se você ficar incapacitado por mais tempo que o atraso configurado, o TranqRotate chamará o reserva automaticamente",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "Ativar alerta de reserva automático cronometrado",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "O TranqRotate chamará o reserva se o chefe estiver com frenesi por um atraso definido e você deveria tê-lo tranquilizado",
    ["TIMED_DELAY_THRESHOLD"] = "Limite de alerta cronometrado",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "O TranqRotate chamará automaticamente o reserva se você não usar o tranquilizante dentro do limite configurado",

    --- Announces
    ["SETTING_ANNOUNCES"] = "Anúncios",
    ["ENABLE_ANNOUNCES"] = "Ativar anúncios",
    ["ENABLE_ANNOUNCES_DESC"] = "Ativar / desativar o anúncio.",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(Os canais Gritar e Dizer não funcionam no mundo aberto, mas funcionarão dentro de suas raides)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "Canal de anúncio",
    ["MESSAGE_CHANNEL_TYPE"] = "Enviar mensagens para",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "Canal para onde você quer enviar mensagens",
    ["MESSAGE_CHANNEL_NAME"] = "Nome do canal",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "Defina o nome do canal de destino",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "Canal",
    ["CHANNEL_RAID_WARNING"] = "Aviso de Raide",
    ["CHANNEL_SAY"] = "Dizer",
    ["CHANNEL_YELL"] = "Gritar",
    ["CHANNEL_PARTY"] = "Grupo",
    ["CHANNEL_RAID"] = "Raide",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "Mensagens de anúncio",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "Mensagem de anúncio de sucesso no chefe (%s será substituído pelo nome do próximo caçador)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "Mensagem de anúncio de sucesso no lixo (%s será substituído pelo nome do alvo)",
    ["FAIL_MESSAGE_LABEL"] = "Mensagem de anúncio de falha",
    ["FAIL_WHISPER_LABEL"] = "Mensagem de sussurro de falha",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "Mensagem sussurrada quando você não pode atirar ou chama pelo reserva",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "Tiro tranquilizante feito, %s é o próximo!",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "Tiro tranquilizante no %s",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! TIRO TRANQUILIZANTE FALHOU EM %s !!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "TIRO TRANQUILIZANTE ERROU! ATIRE AGORA!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "NÃO POSSO ATIRAR! ATIRE AGORA!",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "USE O TIRO TRANQUILIZANTE AGORA!",

    ["BROADCAST_MESSAGE_HEADER"] = "Transmissão da configuração de rotação",
    ["USE_MULTILINE_ROTATION_REPORT"] = "Usar múltiplas linhas para a rotação principal ao relatar",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "Marque esta opção se você quiser uma exibição de ordem mais compreensível",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "Configuração do tiro tranquilizante",
    ["BROADCAST_ROTATION_PREFIX"] = "Rotação",
    ["BROADCAST_BACKUP_PREFIX"] = "Reserva",

    --- Sounds
    ["SETTING_SOUNDS"] = "Sons",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "Tocar um som quando você for o próximo a atirar",
    ["ENABLE_TRANQ_NOW_SOUND"] = "Tocar um som quando você tiver que atirar",
    ["TRANQ_NOW_SOUND_CHOICE"] = "Selecione o som que deseja usar para o alerta 'atire agora'",
    ["DBM_SOUND_WARNING"] = "O DBM toca o som de 'bandeira pega' a cada frenesi, isso pode impedir que você ouça sons mais suaves do TranqRotate. Sugiro escolher um som mais forte ou desativar o som de frenesi do DBM.",

    --- Debug
    ["SETTING_DEBUG"] = "Depuração",
    ["ENABLE_DEBUG_OUTPUT"] = "Ativar saída de depuração na janela de bate-papo",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "O TranqRotate imprimirá informações de depuração na sua janela de bate-papo principal",

    --- Profiles
    ["SETTING_PROFILES"] = "Perfis",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "Este jogador não usa o TranqRotate",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "Ou executa uma versão desatualizada abaixo de %s",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(Você pode desativar este ícone e/ou esta dica nas configurações)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "Uma nova versão do TranqRotate está disponível, atualize para obter os recursos mais recentes",
    ["BREAKING_UPDATE_AVAILABLE"] = "Uma nova atualização CRÍTICA do TranqRotate está disponível, você DEVE atualizar o MAIS RÁPIDO possível! O TranqRotate pode não funcionar corretamente com usuários de versões atualizadas.",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "Você deve ser assistente da raide para redefinir a rotação",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "Enviando solicitação de reserva para %s",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "Recebida nova configuração de rotação de %s",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s pediu reserva!",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s redefiniu a rotação.",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "O tiro tranquilizante de %s errou!",
    ["PRINT_FAILED_TRANQ_RESIST"] = "O tiro tranquilizante de %s foi resistido!",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "O tiro tranquilizante de %s errou ou foi resistido!",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "O reserva foi solicitado automaticamente porque você estava incapacitado",
    ["PRINT_TIMED_BACKUP_CALL"] = "O reserva foi solicitado automaticamente porque você foi muito lento",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "Verificação de versão",
    ["VERSION_CHECK_YOU"] = "Você",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "Nenhuma ou abaixo de %s",
}

TranqRotate.L = L