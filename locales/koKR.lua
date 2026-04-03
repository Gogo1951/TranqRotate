if (GetLocale() ~= "koKR") then return end

TranqRotate = select(2, ...)

local L = {

    ["LOADED_MESSAGE"] = "TranqRotate가 로드되었습니다. 옵션을 보려면 /tranq 입력",
    ["TRANQ_WINDOW_HIDDEN"] = "TranqRotate 창이 숨겨졌습니다. 다시 보려면 /tranq toggle을 사용하세요",

    -- Buttons tooltips
    ["BUTTON_CLOSE"] = "창 숨기기",
    ["BUTTON_SETTINGS"] = "설정",
    ["BUTTON_RESET_ROTATION"] = "순서 초기화",
    ["BUTTON_PRINT_ROTATION"] = "순서 출력",

    -- Settings
    ["SETTING_GENERAL"] = "일반",
    ["SETTING_GENERAL_REPORT"] = "문제 발생 시 보고해주세요:",
    ["SETTING_GENERAL_DESC"] = "신규 기능: 이제 평정의 사격을 쏘아야 할 때 TranqRotate가 소리를 재생합니다! 또한 애드온이 덜 거슬리도록 몇 가지 표시 옵션이 추가되었습니다.",

    ["LOCK_WINDOW"] = "창 잠금",
    ["LOCK_WINDOW_DESC"] = "창 잠금",
    ["RESET_WINDOW_POSITION"] = "위치 초기화",
    ["RESET_WINDOW_POSITION_DESC"] = "기본 창 위치를 초기화합니다",
    ["HIDE_WINDOW_NOT_IN_RAID"] = "공격대에 속해 있지 않을 때 창 숨기기",
    ["HIDE_WINDOW_NOT_IN_RAID_DESC"] = "공격대에 속해 있지 않을 때 창 숨기기",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID"] = "공격대 참여 시 창 표시하지 않음",
    ["DO_NOT_SHOW_WHEN_JOINING_RAID_DESC"] = "공격대에 참여할 때마다 창이 나타나는 것을 원하지 않으면 이 옵션을 선택하세요",
    ["SHOW_WHEN_TARGETING_BOSS"] = "평정 가능한 우두머리 선택 시 창 표시",
    ["SHOW_WHEN_TARGETING_BOSS_DESC"] = "평정 가능한 우두머리 선택 시 창 표시",
    ["WINDOW_LOCKED"] = "TranqRotate: 창이 잠겼습니다",
    ["WINDOW_UNLOCKED"] = "TranqRotate: 창이 잠금 해제되었습니다",

    --- Player names formatting options
    ["PLAYER_NAME_FORMAT"] = "플레이어 이름 형식",
    ["PLAYER_NAME_FORMAT_DESC"] = "연결된 서버에서는 기본적으로 타 서버 플레이어의 서버 접미사가 숨겨집니다. 이름이 완전히 똑같은 두 명의 사냥꾼이 있다면 이 설정을 조정하세요",
    ["PLAYER_NAME_ONLY_OPTION_LABEL"] = "플레이어이름",
    ["SHORTENED_SUFFIX_OPTION_LABEL"] = "플레이어이름-서버(짧게)",
    ["FULL_NAME_OPTION_LABEL"] = "플레이어이름-서버",

    ["TEST_MODE_HEADER"] = "테스트 모드",
    ["ENABLE_ARCANE_SHOT_TESTING"] = "테스트 모드 켜기/끄기",
    ["ENABLE_ARCANE_SHOT_TESTING_DESC"] =
        "테스트 모드가 활성화된 동안 신비한 사격이 평정의 사격으로 등록됩니다\n" ..
        "테스트 모드는 수동으로 끄지 않는 한 10분 동안 지속됩니다",
    ["ARCANE_SHOT_TESTING_ENABLED"] = "신비한 사격 테스트 모드가 10분 동안 활성화되었습니다",
    ["ARCANE_SHOT_TESTING_DISABLED"] = "신비한 사격 테스트 모드가 비활성화되었습니다",

    ["FEATURES_HEADER"] = "추가 기능",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN"] = "우두머리 광기 재사용 대기시간 진행 바 표시",
    ["DISPLAY_BOSS_FRENZY_COOLDOWN_DESC"] = "제목 표시줄 바로 아래에 진행 상황을 나타내는 얇은 진행 바가 표시됩니다",
    ["DISPLAY_BLIND_ICON"] = "TranqRotate가 없는 사냥꾼에게 아이콘 표시",
    ["DISPLAY_BLIND_ICON_DESC"] = "해당 플레이어가 애드온을 사용하지 않음을 나타내기 위해 사냥꾼 프레임에 아이콘을 추가합니다. 즉, 의사소통하지 않는 한 평정 순서를 모를 것이며, 다른 TranqRotate 사용자와 멀리 떨어져 있으면 동기화되지 않습니다.",
    ["DISPLAY_BLIND_ICON_TOOLTIP"] = "아이콘 툴팁 표시",
    ["DISPLAY_BLIND_ICON_TOOLTIP_DESC"] = "이 옵션을 비활성화하여 툴팁은 숨기고 아이콘만 유지할 수 있습니다",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED"] = "행동 불가 시 자동 예비 알림 활성화",
    ["ENABLE_AUTOMATIC_BACKUP_ALERT_WHEN_INCAPACITATED_DESC"] = "평정을 해야 할 때 TranqRotate가 디버프를 확인하고 설정된 지연 시간을 초과하여 행동 불가 상태이면 예비 인원을 호출합니다",
    ["INCAPACITATED_DELAY_THRESHOLD"] = "행동 불가 알림 임계값",
    ["INCAPACITATED_DELAY_THRESHOLD_DESC"] = "설정된 지연 시간 이상 행동 불가 상태인 경우, TranqRotate가 자동으로 예비 인원을 호출합니다",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT"] = "시간 제한 자동 예비 알림 활성화",
    ["ENABLE_AUTOMATIC_TIMED_BACKUP_ALERT_DESC"] = "우두머리가 정해진 시간 동안 광기 상태이고 평정을 했어야 하는 경우, TranqRotate가 예비 인원을 호출합니다",
    ["TIMED_DELAY_THRESHOLD"] = "시간 제한 알림 임계값",
    ["TIMED_DELAY_THRESHOLD_DESC"] = "설정된 임계값 내에 평정을 하지 않으면 TranqRotate가 자동으로 예비 인원을 호출합니다",

    --- Announces
    ["SETTING_ANNOUNCES"] = "알림",
    ["ENABLE_ANNOUNCES"] = "알림 활성화",
    ["ENABLE_ANNOUNCES_DESC"] = "알림을 활성화 / 비활성화합니다.",
    ["YELL_SAY_DISABLED_OPEN_WORLD"] = "(외치기 및 일반 대화 채널은 야외에서는 작동하지 않지만 공격대 내부에서는 작동합니다)",

    ---- Channels
    ["ANNOUNCES_CHANNEL_HEADER"] = "알림 채널",
    ["MESSAGE_CHANNEL_TYPE"] = "메시지 보낼 곳",
    ["MESSAGE_CHANNEL_TYPE_DESC"] = "메시지를 보낼 채널",
    ["MESSAGE_CHANNEL_NAME"] = "채널 이름",
    ["MESSAGE_CHANNEL_NAME_DESC"] = "대상 채널의 이름을 설정합니다",

    ----- Channels types
    ["CHANNEL_CHANNEL"] = "채널",
    ["CHANNEL_RAID_WARNING"] = "공격대 경보",
    ["CHANNEL_SAY"] = "일반",
    ["CHANNEL_YELL"] = "외치기",
    ["CHANNEL_PARTY"] = "파티",
    ["CHANNEL_RAID"] = "공격대",

    ---- Messages
    ["ANNOUNCES_MESSAGE_HEADER"] = "알림 메시지",
    ["BOSS_SUCCESS_MESSAGE_LABEL"] = "우두머리 평정 성공 알림 메시지 (%s는 다음 사냥꾼 이름으로 대체됩니다)",
    ["TRASH_SUCCESS_MESSAGE_LABEL"] = "일반 몹 평정 성공 알림 메시지 (%s는 대상 이름으로 대체됩니다)",
    ["FAIL_MESSAGE_LABEL"] = "실패 알림 메시지",
    ["FAIL_WHISPER_LABEL"] = "실패 귓속말 메시지",
    ["UNABLE_TO_TRANQ_MESSAGE_LABEL"] = "평정을 할 수 없거나 예비 인원을 호출할 때의 귓속말 메시지",

    ['DEFAULT_BOSS_SUCCESS_ANNOUNCE_MESSAGE'] = "평정 완료, 다음은 %s!",
    ['DEFAULT_TRASH_SUCCESS_ANNOUNCE_MESSAGE'] = "%s에게 평정 완료",
    ['DEFAULT_FAIL_ANNOUNCE_MESSAGE'] = "!!! %s에게 평정 실패 !!!",
    ['DEFAULT_FAIL_WHISPER_MESSAGE'] = "평정 빗나감! 지금 평정하세요!",
    ['DEFAULT_UNABLE_TO_TRANQ_MESSAGE'] = "평정을 쏠 수 없습니다! 지금 평정하세요!",

    ['TRANQ_NOW_LOCAL_ALERT_MESSAGE'] = "지금 평정의 사격 사용!",

    ["BROADCAST_MESSAGE_HEADER"] = "순서 설정 텍스트 알림",
    ["USE_MULTILINE_ROTATION_REPORT"] = "보고 시 메인 순서에 여러 줄 사용",
    ["USE_MULTILINE_ROTATION_REPORT_DESC"] = "더 이해하기 쉬운 순서 표시를 원하면 이 옵션을 선택하세요",

    --- Raid broadcast messages
    ["BROADCAST_HEADER_TEXT"] = "사냥꾼 평정 순서",
    ["BROADCAST_ROTATION_PREFIX"] = "순서",
    ["BROADCAST_BACKUP_PREFIX"] = "예비",

    --- Sounds
    ["SETTING_SOUNDS"] = "소리",
    ["ENABLE_NEXT_TO_TRANQ_SOUND"] = "다음에 쏴야 할 때 소리 재생",
    ["ENABLE_TRANQ_NOW_SOUND"] = "평정을 쏴야 할 때 소리 재생",
    ["TRANQ_NOW_SOUND_CHOICE"] = "'지금 평정' 알림에 사용할 소리 선택",
    ["DBM_SOUND_WARNING"] = "DBM은 광기 때마다 '깃발 뺏김' 소리를 재생하며, 이는 TranqRotate의 부드러운 소리를 듣지 못하게 할 수 있습니다. 강한 소리를 선택하거나 DBM 광기 소리를 비활성화하는 것을 권장합니다.",

    --- Debug
    ["SETTING_DEBUG"] = "디버그",
    ["ENABLE_DEBUG_OUTPUT"] = "채팅창에 디버그 출력 활성화",
    ["ENABLE_DEBUG_OUTPUT_DESC"] = "TranqRotate가 기본 채팅창에 디버그 정보를 출력합니다",

    --- Profiles
    ["SETTING_PROFILES"] = "프로필",

    -- Blind icon tooltip
    ["TOOLTIP_PLAYER_WITHOUT_ADDON"] = "이 플레이어는 TranqRotate를 사용하지 않습니다",
    ["TOOLTIP_MAY_RUN_OUTDATED_VERSION"] = "또는 %s 미만의 구버전을 실행 중입니다",
    ["TOOLTIP_DISABLE_SETTINGS"] = "(설정에서 이 아이콘이나 툴팁을 비활성화할 수 있습니다)",

    -- Available update
    ["UPDATE_AVAILABLE"] = "새로운 TranqRotate 버전을 사용할 수 있습니다. 최신 기능을 위해 업데이트하세요",
    ["BREAKING_UPDATE_AVAILABLE"] = "새로운 대규모 TranqRotate 업데이트가 있습니다. 가능한 빨리 업데이트해야 합니다! 구버전 사용자와 호환되지 않을 수 있습니다.",

    -- Rotation reset
    ["RESET_UNAUTHORIZED"] = "순서를 초기화하려면 공격대 부지원자여야 합니다",

    -- Comms chat messages
    ["COMMS_SENT_BACKUP_REQUEST"] = "%s에게 예비 요청을 보냅니다",
    ["COMMS_RECEIVED_NEW_ROTATION"] = "%s로부터 새로운 순서 구성을 받았습니다",
    ["COMMS_RECEIVED_BACKUP_REQUEST"] = "%s님이 예비를 요청했습니다!",
    ["COMMS_RECEIVED_RESET_BROADCAST"] = "%s님이 순서를 초기화했습니다.",

    -- Failed tranq printed messages
    ["PRINT_FAILED_TRANQ_MISS"] = "%s의 평정의 사격이 빗나갔습니다!",
    ["PRINT_FAILED_TRANQ_RESIST"] = "%s의 평정의 사격이 저항되었습니다!",
    ["PRINT_FAILED_TRANQ_MISS_OR_RESIST"] = "%s의 평정의 사격이 빗나가거나 저항되었습니다!",

    -- Incapacitated backup call printed messages
    ["PRINT_INCAPACITATED_BACKUP_CALL"] = "당신이 행동 불가 상태였기 때문에 예비 인원이 자동으로 요청되었습니다",
    ["PRINT_TIMED_BACKUP_CALL"] = "당신이 너무 늦게 반응했기 때문에 예비 인원이 자동으로 요청되었습니다",

    -- Version check printed messages
    ["VERSION_CHECK_HEADER"] = "버전 확인",
    ["VERSION_CHECK_YOU"] = "나",
    ["VERSION_CHECK_NONE_OR_OUTDATED_VERSION"] = "없거나 %s 미만",
}

TranqRotate.L = L