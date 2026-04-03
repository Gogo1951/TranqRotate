if (GetLocale() ~= "zhTW") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate 已加載, 輸入 /tranq 進入設定",
    ["TRANQ_WINDOW_HIDDEN"] = "Tranqrotate 窗口隱藏. 輸入 /tranq toggle 顯示窗口",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "隱藏窗口",
    ["BUTTON_SETTINGS"] = "設定",
    ["BUTTON_RESET_ROTATION"] = "重置循環",
    ["BUTTON_PRINT_ROTATION"] = "發送循環",

    -- Settings
    ["SETTING_GENERAL"] = "General",
    ["SETTING_GENERAL_REPORT"] = "請報告問題: ",
    ["SETTING_GENERAL_DESC"] = "New : TranqRotate will now play a sound when you need to shoot your tranqshot ! There are also few more display options to make the addon less intrusive.",

    ["LOCK_WINDOW"] = "鎖定窗口",
    ["LOCK_WINDOW_DESC"] = "鎖定窗口",
    ["RESET_WINDOW_POSITION"] = "重置位置",
    ["RESET_WINDOW_POSITION_DESC"] = "重置主窗口位置",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "不在團隊時隱藏窗口",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "不在團隊時隱藏窗口",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "加入團隊時隱藏窗口",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "如果您不想每次加入團隊時都顯示窗口，請選中此選項",
    ["SHOW_WHEN_TARGETING_BOSS"] = "當妳的目標是壹個可寧神的Boss時，顯示窗口",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "當妳的目標是壹個可寧神的Boss時，顯示窗口",
    ["WINDOW_LOCKED"] = "TranqRotate: 窗口已隱藏",
    ["WINDOW_UNLOCKED"] = "TranqRotate: 窗口已鎖定",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "玩家名稱格式",
    ["PLAYER_NAME_FORMAT_DESC"] = "在連結的伺服器上，預設將隱藏其他伺服器玩家的後綴。如果遇到同名的獵人，請調整此設定",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "玩家名稱",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "玩家名稱-伺服器(短)",
    ["FULL_NAME_OPTION_LABEL"] = "玩家名稱-伺服器(長)",

    ["TEST_MODE_HEADER"] = "測試模式",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "切換測試模式",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "當測試模式啟用時, 秘法射擊將註冊為寧神射擊\n" ..
        "測試模式將持續10分鐘, 除非妳提前關閉它",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "奧術射擊測試模式已啟用, 持續10分鐘",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "奧術射擊測試模式已禁用",

    ["FEATURES_HEADER"] = "Optionals features",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "顯示狂暴冷卻進度條",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "在標題列下方顯示一條細長的進度條來指示狂暴冷卻",
    ["DISPLAY_BLIND_ICON"] = "Show an icon for hunter without TranqRotate",
    ["DISPLAY_BLIND_ICON_DESC"] = "Adds a blind icon on the hunter frame to indicate he's not using the addon. This means he will not be aware of the rotate unless you communicate with him and his tranqshot won't be synced if he's far from every other TranqRotate user.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "Show the blind icon tooltip",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "You can disable this options to disable the tooltip while still having the icon",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "Enable automatic backup alert when incapacitated",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "TranqRotate will check for your debuffs when you should actually tranq and will call for backup if you are incapacitated for longer than the defined delay",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "Incapacitated alert threshold",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "If you are incapacitated for longer than the configured delay, TranqRotate will automatically call for backup",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "Enable timed automatic backup alert",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "TranqRotate will call for backup if the boss is on frenzy for a defined delay and you should have been tranqing it",
    ["TIMED_DELAY_THRESHOLD"] = "Timed alert threshold",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "TranqRotate will automatically call for backup if you do not tranq within the configured threshold",

    --- Announces
    ["SETTING_ANNOUNCES"] = "通告",
    ["ENABLE_ANNOUNCES"] = "啟用通告",
    ["ENABLE_ANNOUNCES_DESC"] = "啟用 / 禁用通告",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(Yell and say channels does not work in open world, but will inside your raids)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "通告頻道",
    ["MESSAGE_CHANNEL_TYPE"] = "發送到",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "你想發送到哪個頻道",
    ["MESSAGE_CHANNEL_NAME"] = "頻道名或玩家名",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "設置目標頻道的名稱",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "頻道",
    ["CHANNEL_RAID_WARNING"] = "團隊警告",
    ["CHANNEL_SAY"] = "說",
    ["CHANNEL_YELL"] = "大喊",
    ["CHANNEL_PARTY"] = "小隊",
    ["CHANNEL_RAID"] = "團隊",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "通告資訊",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "對首領寧神成功時的通告訊息 (%s 將被替換為下一個獵人的名字)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "對小怪寧神成功時的通告訊息 (%s 將被替換為目標的名字)",
    ["FAIL_MESSAGE_LABEL"] = "寧神失敗通告訊息",
    ["FAIL_WHISPER_LABEL"] = "寧神失敗密語訊息",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "當你無法寧神或需要替補時的密語訊息",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "寧神射擊成功，下一個是 %s！",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "已對 %s 使用寧神射擊",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! 對 %s 寧神失敗!!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "寧神失敗 !! 趕緊補寧神!!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "I'M UNABLE TO TRANQ ! TRANQ NOW !",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "立即使用寧神 !!",

    ["BROADCAST_MESSAGE_HEADER"] = "循環順序廣播頻道選擇",
    ["USE_MULTILINE_ROTATION_REPORT"] = "連續多行發送寧神通告",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "如果您想要更易於理解的順序顯示，請選中此選項",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "獵人寧神順序",
    ["BROADCAST_ROTATION_PREFIX"] = "循環",
    ["BROADCAST_BACKUP_PREFIX"] = "替補",

    --- Sounds
    ["SETTING_SOUNDS"] = "音效",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "當下壹個寧神射擊是您時，播放提示音",
    ["ENABLE_TRANQ_NOW_SOUND"] = "當您需要立即寧神射擊時，播放提示音",
    ["TRANQ_NOW_SOUND_CHOICE"] = "選擇要用於“寧神射擊”提示的聲音",
    ["DBM_SOUND_WARNING"] = "DBM在瘋狂時播放的'flag taken'提示音，可能導致您無法聽到TranqRotate的提示音。建議選擇壹個響亮的提示音，或者在DBM中禁用瘋狂的警告。",

    --- Profiles
    ["SETTING_PROFILES"] = "設定檔",

    --- Debug
    ["SETTING_DEBUG"] = "Debug",
    ["ENABLE_DEBUG_OUTPUT"] = "Enable debug output to chat window",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate will print debug information to your main chat window",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "此玩家未使用 TranqRotate",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "或使用了低於 %s 的過期版本",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(You can disable this icon and/or this tooltip in the settings)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "有新的 TranqRotate 版本可用，請更新以獲取最新功能",
    ["BREAKING_UPDATE_AVAILABLE"] = "有重大的 TranqRotate 更新，您必須盡快更新！否則可能無法與最新版本的玩家正常運作。",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "您必須是團隊助理才能重置循環",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "發送替補請求給 %s",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "從 %s 收到新的循環設定",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s 請求替補！",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s 已重置循環。",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "%s 的寧神射擊未擊中！",
    ["PRINT_FAILED_TRANQ_RESIST"] = "%s 的寧神射擊被抵抗！",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "%s 的寧神射擊未擊中或被抵抗！",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "因為您處於癱瘓狀態，已自動呼叫替補",
    ["PRINT_TIMED_BACKUP_CALL"] = "因為您的動作太慢，已自動呼叫替補",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "版本檢查",
    ["VERSION_CHECK_YOU"] = "您",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "無或低於 %s",
}

TranqRotate.L = L