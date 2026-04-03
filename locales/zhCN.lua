if (GetLocale() ~= "zhCN") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate 已加载, 输入 /tranq 进入设置",
    ["TRANQ_WINDOW_HIDDEN"] = "TranqRotate 窗口已隐藏。输入 /tranq toggle 显示窗口",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "隐藏窗口",
    ["BUTTON_SETTINGS"] = "设置",
    ["BUTTON_RESET_ROTATION"] = "重置循环",
    ["BUTTON_PRINT_ROTATION"] = "发送循环",

    -- Settings
    ["SETTING_GENERAL"] = "一般",
    ["SETTING_GENERAL_REPORT"] = "请报告问题: ",
    ["SETTING_GENERAL_DESC"] = "新内容: TranqRotate 当你需要施放你的宁神射击时，现在将播放一个声音!也有一些显示选项，可以减少插件得干扰。",

    ["LOCK_WINDOW"] = "锁定窗口",
    ["LOCK_WINDOW_DESC"] = "锁定窗口",
    ["RESET_WINDOW_POSITION"] = "重置位置",
    ["RESET_WINDOW_POSITION_DESC"] = "重置主窗口位置",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "不在团队时隐藏窗口",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "不在团队时隐藏窗口",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "加入团队时隐藏窗口",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "如果您不想每次加入团队时都显示窗口，请选中此选项",
    ["SHOW_WHEN_TARGETING_BOSS"] = "当你的目标是一个可宁神的Boss时，显示窗口",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "当你的目标是一个可宁神的Boss时，显示窗口",
    ["WINDOW_LOCKED"] = "TranqRotate: 窗口已隐藏",
    ["WINDOW_UNLOCKED"] = "TranqRotate: 窗口已锁定",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "玩家名称格式",
    ["PLAYER_NAME_FORMAT_DESC"] = "在互联服务器上，默认将隐藏其他服务器玩家的后缀。如果遇到同名的猎人，请调整此设置",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "玩家名称",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "玩家名称-服(短)",
    ["FULL_NAME_OPTION_LABEL"] = "玩家名称-服务器(长)",

    ["TEST_MODE_HEADER"] = "测试模式",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "切换测试模式",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "当测试模式启用时, 奥术射击将注册为宁神射击\n" ..
        "测试模式将持续10分钟, 除非你提前关闭它",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "奥术射击测试模式已启用, 持续10分钟",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "奥术射击测试模式已禁用",

    ["FEATURES_HEADER"] = "可选功能",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "显示激怒冷却进度条",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "标题栏下方显示一个细进度条",
    ["DISPLAY_BLIND_ICON"] = "显示一个没有TranqRotate插件的失明图标",
    ["DISPLAY_BLIND_ICON_DESC"] = "在猎人框架上添加一个失明图标，表明他没有使用此插件。这意味着他将不会意识到轮换，除非你与他交流，如果他远离其他TranqRotate用户，他的宁神射击将不会同步。",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "显示失明图标的工具提示",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "您可以禁用此选项来禁用工具提示，同时仍然拥有图标",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "当无法工作时，启用自动替补通告",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "TranqRotate会检查你的Debuff，如果轮到你宁神时，你瘫痪时间超过定义的延迟时间，则会要求替补",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "瘫痪通告阀值",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "如果您瘫痪时间超过配置的延迟时间，TranqRotate将自动调用替补",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "启用定时自动替补通告",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "如果BOSS在规定的延迟时间内激怒，而你已经宁神了，那么TranqRotate会要求替补",
    ["TIMED_DELAY_THRESHOLD"] = "定时通告阈值",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "如果你没有在配置的阈值内进行宁神，TranqRotate将自动调用替补",

    --- Announces
    ["SETTING_ANNOUNCES"] = "通告",
    ["ENABLE_ANNOUNCES"] = "启用通告",
    ["ENABLE_ANNOUNCES_DESC"] = "启用 / 禁用通告",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(大喊并说 频道在开放世界中不工作，但会在你的团本中工作)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "通告频道",
    ["MESSAGE_CHANNEL_TYPE"] = "发送到",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "你想发送到哪个频道",
    ["MESSAGE_CHANNEL_NAME"] = "频道名或玩家名",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "设置目标频道的名称",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "频道",
    ["CHANNEL_RAID_WARNING"] = "团队警告",
    ["CHANNEL_SAY"] = "说",
    ["CHANNEL_YELL"] = "大喊",
    ["CHANNEL_PARTY"] = "小队",
    ["CHANNEL_RAID"] = "团队",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "通告信息",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "Boss宁神成功通告信息 (%s 将被替换为下一个猎人名字)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "小怪宁神成功通告信息 (%s 将被替换为目标名字)",
    ["FAIL_MESSAGE_LABEL"] = "施放失败通告信息",
    ["FAIL_WHISPER_LABEL"] = "施放失败私聊信息",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "当你无法宁神或呼叫替补时,这条信息就会低声传来",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "宁神射击成功，下一个是 %s！",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "已对 %s 施放宁神射击",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! 对 %s 宁神失败!!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "宁神失败 !! 赶紧补宁神!!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "我无法宁神射击 ! 请现在宁神 !",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "立即使用宁神 !!",

    ["BROADCAST_MESSAGE_HEADER"] = "循环顺序广播频道选择",
    ["USE_MULTILINE_ROTATION_REPORT"] = "连续多行发送宁神通告",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "如果您想要更易于理解的顺序显示，请选中此选项",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "猎人宁神顺序",
    ["BROADCAST_ROTATION_PREFIX"] = "循环",
    ["BROADCAST_BACKUP_PREFIX"] = "替补",

    --- Sounds
    ["SETTING_SOUNDS"] = "音效",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "当下一个宁神射击是您时，播放提示音",
    ["ENABLE_TRANQ_NOW_SOUND"] = "当您需要立即宁神射击时，播放提示音",
    ["TRANQ_NOW_SOUND_CHOICE"] = "选择要用于“宁神射击”提示的声音",
    ["DBM_SOUND_WARNING"] = "DBM在激怒时播放的'flag taken'提示音，可能导致您无法听到TranqRotate的提示音。建议选择一个响亮的提示音，或者在DBM中禁用激怒的警告。",

    --- Debug
    ["SETTING_DEBUG"] = "Debug",
    ["ENABLE_DEBUG_OUTPUT"] = "在聊天窗口启用调试输出",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate 将在主聊天窗口中打印调试信息",

    --- Profiles
    ["SETTING_PROFILES"] = "配置文件",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "此玩家没有使用TranqRotate插件",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "或者运行低于%s的过时版本",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(您可以在设置中禁用此图标或此工具提示)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "有新的 TranqRotate 版本可用，请更新以获取最新功能",
    ["BREAKING_UPDATE_AVAILABLE"] = "有重大的 TranqRotate 更新可用，您必须尽快更新！否则可能无法与更新版本的玩家正常运作。",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "您必须是团队助理才能重置循环",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "向 %s 发送替补请求",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "从 %s 收到新的循环配置",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s 请求替补！",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s 已重置循环。",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "%s 的宁神射击未击中！",
    ["PRINT_FAILED_TRANQ_RESIST"] = "%s 的宁神射击被抵抗！",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "%s 的宁神射击未击中或被抵抗！",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "由于您处于瘫痪状态，已自动请求替补",
    ["PRINT_TIMED_BACKUP_CALL"] = "由于您太慢，已自动请求替补",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "版本检查",
    ["VERSION_CHECK_YOU"] = "您",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "无或低于 %s",
}

TranqRotate.L = L