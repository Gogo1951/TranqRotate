if (GetLocale() ~= "esES" and GetLocale() ~= "esMX") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate cargado, escribe /tranq para las opciones",
    ["TRANQ_WINDOW_HIDDEN"] = "Ventana de Tranqrotate oculta. Usa /tranq toggle para mostrarla",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "Ocultar ventana",
    ["BUTTON_SETTINGS"] = "Ajustes",
    ["BUTTON_RESET_ROTATION"] = "Reiniciar Rotación",
    ["BUTTON_PRINT_ROTATION"] = "Imprimir Rotación",

    -- Settings
    ["SETTING_GENERAL"] = "General",
    ["SETTING_GENERAL_REPORT"] = "Por favor, informa de cualquier problema en",
    ["SETTING_GENERAL_DESC"] = "Nuevo: ¡TranqRotate ahora reproducirá un sonido cuando necesites usar tu disparo tranquilizante! También hay más opciones de visualización para que el addon sea menos intrusivo.",

    ["LOCK_WINDOW"] = "Bloquear ventana",
    ["LOCK_WINDOW_DESC"] = "Bloquear ventana",
    ["RESET_WINDOW_POSITION"] = "Reiniciar posición",
    ["RESET_WINDOW_POSITION_DESC"] = "Reinicia la posición de la ventana principal",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "Ocultar la ventana cuando no estés en banda",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "Ocultar la ventana cuando no estés en banda",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "No mostrar la ventana al unirse a una banda",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "Marca esto si no quieres que la ventana aparezca cada vez que te unas a una banda",
    ["SHOW_WHEN_TARGETING_BOSS"] = "Mostrar ventana al seleccionar un jefe que requiera disparo tranquilizante",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "Mostrar ventana al seleccionar un jefe que requiera disparo tranquilizante",
    ["WINDOW_LOCKED"] = "TranqRotate: Ventana bloqueada",
    ["WINDOW_UNLOCKED"] = "TranqRotate: Ventana desbloqueada",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "Formato de nombres de jugadores",
    ["PLAYER_NAME_FORMAT_DESC"] = "En reinos conectados, los jugadores de otros servidores tendrán el sufijo del servidor oculto por defecto. Si alguna vez tienes dos cazadores con el mismo nombre exacto, ajusta esta configuración",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "NombreJugador",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "NombreJugador-Ser",
    ["FULL_NAME_OPTION_LABEL"] = "NombreJugador-Servidor",

    ["TEST_MODE_HEADER"] = "Modo de prueba",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "Alternar modo de prueba",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "Mientras el modo de prueba esté habilitado, el Disparo Arcano se registrará como un Disparo Tranquilizante\n" ..
        "El modo de prueba durará 10 minutos a menos que lo desactives",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "Modo de prueba de Disparo Arcano habilitado por 10 minutos",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "Modo de prueba de Disparo Arcano deshabilitado",

    ["FEATURES_HEADER"] = "Funciones opcionales",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "Mostrar barra de progreso del enfriamiento de frenesí",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "Una barra de progreso delgada justo debajo de la barra de título mostrará el progreso",
    ["DISPLAY_BLIND_ICON"] = "Mostrar un icono para cazadores sin TranqRotate",
    ["DISPLAY_BLIND_ICON_DESC"] = "Añade un icono de ceguera en el marco del cazador para indicar que no está usando el addon. Esto significa que no será consciente de la rotación a menos que te comuniques con él y su disparo tranquilizante no se sincronizará si está lejos de otros usuarios de TranqRotate.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "Mostrar el tooltip del icono de ceguera",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "Puedes desactivar esta opción para ocultar el tooltip y seguir teniendo el icono",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "Habilitar alerta de reserva automática al estar incapacitado",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "TranqRotate comprobará tus perjuicios cuando deberías usar el disparo tranquilizante y llamará a la reserva si estás incapacitado por más tiempo que el retraso definido",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "Umbral de alerta de incapacitación",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "Si estás incapacitado por más tiempo que el retraso configurado, TranqRotate llamará automáticamente a la reserva",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "Habilitar alerta de reserva automática programada",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "TranqRotate llamará a la reserva si el jefe está en frenesí por un tiempo definido y deberías haber usado tu disparo tranquilizante",
    ["TIMED_DELAY_THRESHOLD"] = "Umbral de alerta programada",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "TranqRotate llamará automáticamente a la reserva si no usas tu disparo tranquilizante dentro del umbral configurado",

    --- Announces
    ["SETTING_ANNOUNCES"] = "Anuncios",
    ["ENABLE_ANNOUNCES"] = "Habilitar anuncios",
    ["ENABLE_ANNOUNCES_DESC"] = "Habilitar / deshabilitar el anuncio.",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(Los canales Gritar y Decir no funcionan en el mundo abierto, pero sí dentro de tus bandas)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "Canal de anuncios",
    ["MESSAGE_CHANNEL_TYPE"] = "Enviar mensajes a",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "Canal al que quieres enviar mensajes",
    ["MESSAGE_CHANNEL_NAME"] = "Nombre del canal",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "Establece el nombre del canal objetivo",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "Canal",
    ["CHANNEL_RAID_WARNING"] = "Advertencia de la banda",
    ["CHANNEL_SAY"] = "Decir",
    ["CHANNEL_YELL"] = "Gritar",
    ["CHANNEL_PARTY"] = "Grupo",
    ["CHANNEL_RAID"] = "Banda",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "Mensajes de anuncio",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "Mensaje de éxito de anuncio en jefe (%s será reemplazado por el nombre del siguiente cazador)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "Mensaje de éxito de anuncio en basura (%s será reemplazado por el nombre del objetivo)",
    ["FAIL_MESSAGE_LABEL"] = "Mensaje de anuncio de fallo",
    ["FAIL_WHISPER_LABEL"] = "Mensaje de susurro de fallo",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "Mensaje susurrado cuando no puedes usar tu disparo o llamas a la reserva",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "¡Disparo tranquilizante listo, %s es el siguiente!",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "Disparo tranquilizante en %s",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! DISPARO TRANQUILIZANTE FALLIDO EN %s !!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "¡DISPARO TRANQUILIZANTE FALLADO! ¡DISPARA AHORA!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "¡NO PUEDO DISPARAR! ¡DISPARA AHORA!",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "¡USA EL DISPARO TRANQUILIZANTE AHORA!",

    ["BROADCAST_MESSAGE_HEADER"] = "Difusión de configuración de rotación",
    ["USE_MULTILINE_ROTATION_REPORT"] = "Usar varias líneas para la rotación principal al informar",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "Marca esta opción si quieres una visualización del orden más comprensible",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "Configuración de cazadores para disparo tranquilizante",
    ["BROADCAST_ROTATION_PREFIX"] = "Rotación",
    ["BROADCAST_BACKUP_PREFIX"] = "Reserva",

    --- Sounds
    ["SETTING_SOUNDS"] = "Sonidos",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "Reproducir un sonido cuando seas el siguiente en disparar",
    ["ENABLE_TRANQ_NOW_SOUND"] = "Reproducir un sonido cuando tengas que disparar tu disparo tranquilizante",
    ["TRANQ_NOW_SOUND_CHOICE"] = "Selecciona el sonido que quieres usar para la alerta 'dispara ahora'",
    ["DBM_SOUND_WARNING"] = "DBM reproduce el sonido de 'bandera tomada' en cada frenesí, lo que puede impedir que escuches los sonidos suaves de TranqRotate. Sugiero elegir un sonido fuerte o desactivar el sonido de frenesí de DBM.",

    --- Debug
    ["SETTING_DEBUG"] = "Depuración",
    ["ENABLE_DEBUG_OUTPUT"] = "Habilitar la salida de depuración en la ventana de chat",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate imprimirá información de depuración en tu ventana de chat principal",

    --- Profiles
    ["SETTING_PROFILES"] = "Perfiles",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "Este jugador no usa TranqRotate",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "O ejecuta una versión obsoleta anterior a la %s",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(Puedes desactivar este icono y/o este tooltip en los ajustes)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "Hay una nueva versión de TranqRotate disponible, actualiza para obtener las últimas funciones",
    ["BREAKING_UPDATE_AVAILABLE"] = "¡Hay una actualización IMPORTANTE de TranqRotate disponible, DEBES actualizar LO ANTES posible! TranqRotate podría no funcionar correctamente con usuarios de la versión actual.",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "Debes ser ayudante de banda para reiniciar la rotación",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "Enviando solicitud de reserva a %s",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "Se recibió nueva configuración de rotación de %s",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "¡%s pidió reserva!",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s ha reiniciado la rotación.",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "¡%s falló su disparo tranquilizante!",
    ["PRINT_FAILED_TRANQ_RESIST"] = "¡El disparo tranquilizante de %s fue resistido!",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "¡El disparo tranquilizante de %s falló o fue resistido!",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "Se ha solicitado una reserva automáticamente porque estabas incapacitado",
    ["PRINT_TIMED_BACKUP_CALL"] = "Se ha solicitado una reserva automáticamente porque fuiste demasiado lento",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "Comprobación de versión",
    ["VERSION_CHECK_YOU"] = "Tú",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "Ninguna o inferior a %s",
}

TranqRotate.L = L