if (GetLocale() ~= "ruRU") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate загружен, введите /tranq для настройки",
    ["TRANQ_WINDOW_HIDDEN"] = "Окно TranqRotate скрыто. Введите /tranq toggle для отображения",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "Скрыть окно",
    ["BUTTON_SETTINGS"] = "Настройки",
    ["BUTTON_RESET_ROTATION"] = "Сбросить ротацию",
    ["BUTTON_PRINT_ROTATION"] = "Показать ротацию",

    -- Settings
    ["SETTING_GENERAL"] = "Общие",
    ["SETTING_GENERAL_REPORT"] = "Пожалуйста о всех ошибках сообщайте на",
    ["SETTING_GENERAL_DESC"] = "Новое: Теперь TranqRotate проигрывает звук когда подходит ваша очередь! Добавлено несколько настроек отображения, чтобы сделать аддон менее навязчивым.",

    ["LOCK_WINDOW"] = "Закрепить окно",
    ["LOCK_WINDOW_DESC"] = "Препятствует перемещению окна с помощью мыши",
    ["RESET_WINDOW_POSITION"] = "Сбросить позицию",
    ["RESET_WINDOW_POSITION_DESC"] = "Сбросить позицию главного окна",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "Показывать окно только в рейде",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "Окно будет отображаться только в рейдовой группе",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "Не показывать окно во время присоединения к рейду",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "Выберите если вы не хотите видеть окно каждый раз когда присоединяетесь к рейду",
    ["SHOW_WHEN_TARGETING_BOSS"] = "Показывать окно только если ваша цель может быть усмирена",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "Показывать окно только если ваша цель может быть усмирена",
    ["WINDOW_LOCKED"] = "TranqRotate: Окно закреплено",
    ["WINDOW_UNLOCKED"] = "TranqRotate: Окно откреплено",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "Формат имени игрока",
    ["PLAYER_NAME_FORMAT_DESC"] = "На объединенных игровых мирах суффикс сервера по умолчанию скрыт. Если у вас в рейде два охотника с одинаковыми именами, измените эту настройку",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "Имя игрока",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "Имя-Серв(сокращ.)",
    ["FULL_NAME_OPTION_LABEL"] = "Имя-Сервер",

    ["TEST_MODE_HEADER"] = "Тестовый режим",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "Тестовый режим",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "В режиме тестирования, Чародейский выстрел будет использоваться вместо Усмиряющего выстрела\n" ..
        "Режим тестирования работает 10 минут или до отключения",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "Тестовый режим включен на 10 минут",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "Тестовый режим выключен",

    ["FEATURES_HEADER"] = "Дополнительные возможности",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "Показывть полоску перезарядки бешенства",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "Тонкая полоса прямо под строкой заголовка будет показывать прогресс перезарядки",
    ["DISPLAY_BLIND_ICON"] = "Показывать иконку для охотника без TranqRotate",
    ["DISPLAY_BLIND_ICON_DESC"] = "Добавляет значок в рамку охотника, показывабщий, что он не использует аддон. Это означает, что он не будет знать о ротации, если вы не сообщите ему, и его Усмеряющий выстрел не будет синхронизирован, если он находится далеко от всех остальных пользователей TranqRotate.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "Показать всплывающую подсказку для значка",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "При отключить этого параметра, отключается всплывающая потказка для значка, при этом зам значок все еще отображается",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "Включить автоматическое оповещение запасным при неспособности",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "TranqRotate проверит ваши дебаффы, и когда вы должны будите использовать Усмиряющий выстрел, а вы не сможете его применить в отведенную очередность, он оповестит запасных",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "Порог оповещения о неспособности",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "Если вы потеряете способность выполнить действие дольше установленной задержки, TranqRotate автоматически оповестит запасных",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "Включить время автоматического оповещения запасных",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "TranqRotate оповестит запасных, если босс находится в бешенсте в течение оппределенного времени, а вы должны были усмирять его",
    ["TIMED_DELAY_THRESHOLD"] = "Время порого для оповещения",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "TranqRotate автоматически оповестит запасных, если вы не произвели успирение в установленный порог",

    --- Announces
    ["SETTING_ANNOUNCES"] = "Оповещения",
    ["ENABLE_ANNOUNCES"] = "Включить оповещения",
    ["ENABLE_ANNOUNCES_DESC"] = "Включить / отключить оповещения",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(Каналы Крикнуть и Сказать работают внутри ваших рейдов, но не в открытом мире)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "Канал оповещений",
    ["MESSAGE_CHANNEL_TYPE"] = "Канал чата",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "Канал для отправки оповещений",
    ["MESSAGE_CHANNEL_NAME"] = "Имя канала",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "Установить имя канала для оповещений",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "Канал",
    ["CHANNEL_RAID_WARNING"] = "Объявления рейду",
    ["CHANNEL_SAY"] = "Сказать",
    ["CHANNEL_YELL"] = "Крик",
    ["CHANNEL_PARTY"] = "Группа",
    ["CHANNEL_RAID"] = "Рейд",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "Сообщения оповещений",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "Сообщение об успешном выстреле по боссу (%s - следующий охотник)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "Сообщение об успешном выстреле по трешу (%s - цель)",
    ["FAIL_MESSAGE_LABEL"] = "При промахе сообщить",
    ["FAIL_WHISPER_LABEL"] = "При промахе шепнуть запасным",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "Сообщение шепота, когда вы не можете произвести усирение или оповестить запасных",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "Усмиряющий выстрел успешен, %s следующий!",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "Усмиряющий выстрел по %s",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! Усмиряющий выстрел промахнулся в %s !!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "!!! Усмиряющий выстрел промахнулся !!! ! УСМИРЯЙ СЕЙЧАС !",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "Я НЕ МОГУ УСМИРИТЬ ! УСМИРЯЙ СЕЙЧАС !",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "УСМИРЯЙ СЕЙЧАС !",

    ["BROADCAST_MESSAGE_HEADER"] = "Объявление очередности",
    ["USE_MULTILINE_ROTATION_REPORT"] = "Использовать многострочный вывод при объявлении очередности",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "Выберите для более понятного порядка отображения очередности",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "Очередность Усмиряющего выстрела",
    ["BROADCAST_ROTATION_PREFIX"] = "Очередность",
    ["BROADCAST_BACKUP_PREFIX"] = "Запасные",

    --- Sounds
    ["SETTING_SOUNDS"] = "Звуки",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "Проигрывать звук когда подходит ваша очередь",
    ["ENABLE_TRANQ_NOW_SOUND"] = "Проигрывать звук когда пора использовать Усмиряющий выстрел",
    ["TRANQ_NOW_SOUND_CHOICE"] = "Выберите звук для Усмиряющего выстрела",
    ["DBM_SOUND_WARNING"] = "DBM проигрывает звук для каждого Бешенства, из-за этого вы можете не устышать оповещение от TranqRotate. Рекомендуется выбрать хорошо различимый звук для TranqRotate или отключить оповещение от DBM",

    --- Debug
    ["SETTING_DEBUG"] = "Debug",
    ["ENABLE_DEBUG_OUTPUT"] = "Включить вывод отладки в чат",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate будет выводить отладочную информацию в главное окно чата",

    --- Profiles
    ["SETTING_PROFILES"] = "Профили",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "Этот игрок не использует TranqRotate",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "Или используется версия ниже %s",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(Вы можете отключить этот значок и/или эту подсказку в настройках)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "Доступна новая версия TranqRotate, обновитесь для получения новых функций",
    ["BREAKING_UPDATE_AVAILABLE"] = "Доступно КРИТИЧЕСКОЕ обновление TranqRotate, вы ДОЛЖНЫ обновиться КАК МОЖНО СКОРЕЕ! Текущая версия может конфликтовать с новыми.",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "Вы должны быть помощником рейда, чтобы сбросить ротацию",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "Отправка запроса запасному %s",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "Получена новая конфигурация ротации от %s",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s просит помощи запасного!",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s сбросил ротацию.",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "%s промахнулся Усмиряющим выстрелом!",
    ["PRINT_FAILED_TRANQ_RESIST"] = "Усмиряющий выстрел %s сопротивление!",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "Усмиряющий выстрел %s промах или сопротивление!",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "Запасной охотник вызван автоматически, так как вы были недееспособны",
    ["PRINT_TIMED_BACKUP_CALL"] = "Запасной охотник вызван автоматически, так как вы были слишком медлительны",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "Проверка версии",
    ["VERSION_CHECK_YOU"] = "Вы",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "Нет или ниже %s",
}

TranqRotate.L = L