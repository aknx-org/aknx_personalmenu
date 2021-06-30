--[[
    JOIN THIS DISCORD FOR OTHER SCRIPTS : discord.gg/CyWHSYybEF
]]
Config = {}
Traduction = {}
Config.Notification = {}
Config.Keyboard = {}
Config.Webhooks = {}

Config.GetESX = 'esx:getSharedObject'

Config.YourServerName = "AKNX" -- Title of the personal menu
Config.DescriptionMenu = "PERSONAL MENU" -- Description of the personal menu
Config.MenuBannerColor = { -- The color of the banner of the menu, in R,G,B, OPACITY, check this website --> https://htmlcolorcodes.com/fr/
    r = 0, -- red
    g = 0, -- green
    b = 0, -- blue
    opacity = 255 -- opacity
}
Config.EnableLog = true -- for active discord log, if you put true, put your webhooks in "config_webhooks" file.
Config.PermissionsForAdministration = { -- permissions authorized for access to the admin menu
    'superadmin',
    'admin',
}
Config.EnableGroupAdminMessage = true -- for active a message when staff mod is enabled
Config.CanDropItem = true -- for drop an item of player inventory
Config.CanDropWeapon = true -- for drop an weapon of player inventory
Config.EnableDoubleJob = true -- job 2 and not org
Config.HaveDpEmotes = true -- put true if you have dpemotes on your server
Config.EnableNotification = true -- for active notification when you do an action, put false for disabled if you have notif with other scripts.

Config.WalksAnimation = {
    ["Alien"] = "move_m@alien",
    ["Armored"] = "anim_group_move_ballistic",
    ["Arrogant"] = "move_f@arrogant@a",
    ["Brave"] = "move_m@brave",
    ["Casual"] = "move_m@casual@a",
    ["Casual2"] = "move_m@casual@b",
    ["Casual3"] = "move_m@casual@c",
    ["Casual4"] = "move_m@casual@d",
    ["Casual5"] = "move_m@casual@e",
    ["Casual6"] = "move_m@casual@f",
    ["Chichi"] = "move_f@chichi",
    ["Confident"] = "move_m@confident",
    ["Cop"] = "move_m@business@a",
    ["Cop2"] = "move_m@business@b",
    ["Cop3"] = "move_m@business@c",
    ["Default Female"] = "move_f@multiplayer",
    ["Default Male"] = "move_m@multiplayer",
    ["Drunk"] = "move_m@drunk@a",
    ["Drunk"] = "move_m@drunk@slightlydrunk",
    ["Drunk2"] = "move_m@buzzed",
    ["Drunk3"] = "move_m@drunk@verydrunk",
    ["Femme"] = "move_f@femme@",
    ["Fire"] = "move_characters@franklin@fire",
    ["Fire2"] = "move_characters@michael@fire",
    ["Fire3"] = "move_m@fire",
    ["Flee"] = "move_f@flee@a",
    ["Franklin"] = "move_p_m_one",
    ["Gangster"] = "move_m@gangster@generic",
    ["Gangster2"] = "move_m@gangster@ng",
    ["Gangster3"] = "move_m@gangster@var_e",
    ["Gangster4"] = "move_m@gangster@var_f",
    ["Gangster5"] = "move_m@gangster@var_i",
    ["Grooving"] = "anim@move_m@grooving@",
    ["Guard"] = "move_m@prison_gaurd",
    ["Handcuffs"] = "move_m@prisoner_cuffed",
    ["Heels"] = "move_f@heels@c",
    ["Heels2"] = "move_f@heels@d",
    ["Hiking"] = "move_m@hiking",
    ["Hipster"] = "move_m@hipster@a",
    ["Hobo"] = "move_m@hobo@a",
    ["Hurry"] = "move_f@hurry@a",
    ["Janitor"] = "move_p_m_zero_janitor",
    ["Janitor2"] = "move_p_m_zero_slow",
    ["Jog"] = "move_m@jog@",
    ["Lemar"] = "anim_group_move_lemar_alley",
    ["Lester"] = "move_heist_lester",
    ["Lester2"] = "move_lester_caneup",
    ["Maneater"] = "move_f@maneater",
    ["Michael"] = "move_ped_bucket",
    ["Money"] = "move_m@money",
    ["Muscle"] = "move_m@muscle@a",
    ["Posh"] = "move_m@posh@",
    ["Posh2"] = "move_f@posh@",
    ["Quick"] = "move_m@quick",
    ["Runner"] = "female_fast_runner",
    ["Sad"] = "move_m@sad@a",
    ["Sassy"] = "move_m@sassy",
    ["Sassy2"] = "move_f@sassy",
    ["Scared"] = "move_f@scared",
    ["Sexy"] = "move_f@sexy@a",
    ["Shady"] = "move_m@shadyped@a",
    ["Slow"] = "move_characters@jimmy@slow@",
    ["Swagger"] = "move_m@swagger",
    ["Tough"] = "move_m@tough_guy@",
    ["Tough2"] = "move_f@tough_guy@",
    ["Trash"] = "clipset@move@trash_fast_turn",
    ["Trash2"] = "missfbi4prepp1_garbageman",
    ["Trevor"] = "move_p_m_two",
    ["Wide"] = "move_m@bag",
    ["Caution"] = "move_m@caution",
    ["Chubby"] = "anim@move_m@chubby@a",
    ["Crazy"] = "move_m@crazy",
    ["Joy"] = "move_m@joy@a",
    ["Power"] = "move_m@power",
    ["Sad2"] = "anim@move_m@depression@a",
    ["Sad3"] = "move_m@depression@b",
    ["Sad4"] = "move_m@depression@d",
    ["Wading"] = "move_m@wading",
}

Config.ExpressionAnimation = {
    ["Angry"] = "mood_angry_1",
    ["Drunk"] = "mood_drunk_1",
    ["Injured"] = "pose_injured_1",
    ["Electrocuded"] = "electrocuted_1",
    ["Grumpy"] = "effort_1",
    ["Grumpy2"] = "mood_drivefast_1",
    ["Grumpy3"] = "pose_angry_1",
    ["Happy"] = "mood_happy_1",
    ["Injured2"] = "mood_injured_1",
    ["Happy2"] = "mood_dancing_low_1",
    ["Smoking hold"] = "smoking_hold_1",
    ["Pose Normal"] = "pose_normal_1",
    ["Pose aiming"] = "pose_aiming_1",
    ["Schocked1"] = "shocked_1",
    ["Schocked2"] = "shocked_2",
    ["Sleep"] = "mood_sleeping_1",
    ["Sleep2"] = "dead_1",
    ["Sleep3"] = "dead_2",
    ["Smug"] = "mood_smug_1",
    ["Aiming"] = "mood_aiming_1",
    ["Stressed"] = "mood_stressed_1",
    ["Sulk"] = "mood_sulk_1",
    ["Weird"] = "effort_2",
    ["Weird2"] = "effort_3",
}