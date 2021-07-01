--[[
    REJOIGNEZ CE DISCORD POUR D'AUTRES SCRIPTS : discord.gg/CyWHSYybEF
]]
Config = {}
Traduction = {}
Config.Notification = {}
Config.Keyboard = {}
Config.Webhooks = {}

Config.GetESX = 'esx:getSharedObject'

Config.YourServerName = "AKNX" -- Title of the personal menu
Config.DescriptionMenu = "MENU PERSONNEL" -- Description of the personal menu
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
Config.EnableDoubleJob = false -- job 2 and not org
Config.HaveDpEmotes = true -- put true if you have dpemotes on your server
Config.EnableNotification = true -- for active notification when you do an action, put false for disabled if you have notif with other scripts.

Config.WalksAnimation = {
    ["Alien"] = "move_m@alien",
    ["Blindée"] = "anim_group_move_ballistic",
    ["Arrogant"] = "move_f@arrogant@a",
    ["Brave"] = "move_m@brave",
    ["Décontracté"] = "move_m@casual@a",
    ["Décontracté2"] = "move_m@casual@b",
    ["Décontracté3"] = "move_m@casual@c",
    ["Décontracté4"] = "move_m@casual@d",
    ["Décontracté5"] = "move_m@casual@e",
    ["Décontracté6"] = "move_m@casual@f",
    ["Chichi"] = "move_f@chichi",
    ["Confiant"] = "move_m@confident",
    ["Flic"] = "move_m@business@a",
    ["Flic2"] = "move_m@business@b",
    ["Flic3"] = "move_m@business@c",
    ["Par défaut femme"] = "move_f@multiplayer",
    ["Par défaut homme"] = "move_m@multiplayer",
    ["Ivre"] = "move_m@drunk@a",
    ["Ivre2"] = "move_m@drunk@slightlydrunk",
    ["Ivre3"] = "move_m@buzzed",
    ["Ivre4"] = "move_m@drunk@verydrunk",
    ["Femme"] = "move_f@femme@",
    ["Feu"] = "move_characters@franklin@fire",
    ["Feu2"] = "move_characters@michael@fire",
    ["Feu3"] = "move_m@fire",
    ["Fuir"] = "move_f@flee@a",
    ["Franklin"] = "move_p_m_one",
    ["Gangster"] = "move_m@gangster@generic",
    ["Gangster2"] = "move_m@gangster@ng",
    ["Gangster3"] = "move_m@gangster@var_e",
    ["Gangster4"] = "move_m@gangster@var_f",
    ["Gangster5"] = "move_m@gangster@var_i",
    ["Rainurage"] = "anim@move_m@grooving@",
    ["Gardien"] = "move_m@prison_gaurd",
    ["Menotter"] = "move_m@prisoner_cuffed",
    ["Talons"] = "move_f@heels@c",
    ["Talons2"] = "move_f@heels@d",
    ["Randonnée"] = "move_m@hiking",
    ["Branché"] = "move_m@hipster@a",
    ["Clochard"] = "move_m@hobo@a",
    ["Pressé"] = "move_f@hurry@a",
    ["Concierge"] = "move_p_m_zero_janitor",
    ["Concierge2"] = "move_p_m_zero_slow",
    ["Jogging"] = "move_m@jog@",
    ["Lemar"] = "anim_group_move_lemar_alley",
    ["Lester"] = "move_heist_lester",
    ["Lester2"] = "move_lester_caneup",
    ["Maneater"] = "move_f@maneater",
    ["Michael"] = "move_ped_bucket",
    ["Money"] = "move_m@money",
    ["Muscle"] = "move_m@muscle@a",
    ["Chic"] = "move_m@posh@",
    ["Chic2"] = "move_f@posh@",
    ["Rapide"] = "move_m@quick",
    ["Coureur"] = "female_fast_runner",
    ["Triste"] = "move_m@sad@a",
    ["Insolent"] = "move_m@sassy",
    ["Insolent2"] = "move_f@sassy",
    ["Effrayé"] = "move_f@scared",
    ["Sexy"] = "move_f@sexy@a",
    ["Ombreux"] = "move_m@shadyped@a",
    ["Ralenti"] = "move_characters@jimmy@slow@",
    ["Fanfaronnade"] = "move_m@swagger",
    ["Difficile"] = "move_m@tough_guy@",
    ["Difficile2"] = "move_f@tough_guy@",
    ["Poubelle"] = "clipset@move@trash_fast_turn",
    ["Poubelle2"] = "missfbi4prepp1_garbageman",
    ["Trevor"] = "move_p_m_two",
    ["Large"] = "move_m@bag",
    ["Garde"] = "move_m@caution",
    ["Joufflu"] = "anim@move_m@chubby@a",
    ["Fou"] = "move_m@crazy",
    ["Joie"] = "move_m@joy@a",
    ["Pouvoir"] = "move_m@power",
    ["Triste2"] = "anim@move_m@depression@a",
    ["Triste3"] = "move_m@depression@b",
    ["Triste4"] = "move_m@depression@d"
}

Config.ExpressionAnimation = {
    ["Colère"] = "mood_angry_1",
    ["Ivre"] = "mood_drunk_1",
    ["Stupide"] = "pose_injured_1",
    ["Électrocuté"] = "electrocuted_1",
    ["Grincheux"] = "effort_1",
    ["Grincheux2"] = "mood_drivefast_1",
    ["Grincheux3"] = "pose_angry_1",
    ["Content"] = "mood_happy_1",
    ["Blessé"] = "mood_injured_1",
    ["Joyeux"] = "mood_dancing_low_1",
    ["Respiration Bouche"] = "smoking_hold_1",
    ["Pose Normal"] = "pose_normal_1",
    ["Un oeil"] = "pose_aiming_1",
    ["Choqué"] = "shocked_1",
    ["Choqué2"] = "shocked_2",
    ["Dormir"] = "mood_sleeping_1",
    ["Dormir2"] = "dead_1",
    ["Dormir3"] = "dead_2",
    ["Suffisant"] = "mood_smug_1",
    ["Spéculatif"] = "mood_aiming_1",
    ["Stressé"] = "mood_stressed_1",
    ["Boude"] = "mood_sulk_1",
    ["Bizarre"] = "effort_2",
    ["Bizarre2"] = "effort_3",
}