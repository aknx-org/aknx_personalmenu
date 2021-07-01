fx_version 'adamant'
game { 'gta5' };

developper 'Akashi'
discord 'A̴k̴a̴s̴h̴i̴#0001'

shared_scripts {
    -- ↓ PersonalMenu Config ↓
    'shared/config.lua',
    -- ↓ PersonalMenu Config Traduction ↓
    'traduction.lua'
}

client_scripts {
    -- ↓ RageUI src ↓
    "RageUI_Source/client/RMenu.lua",
    "RageUI_Source/client/menu/RageUI.lua",
    "RageUI_Source/client/menu/Menu.lua",
    "RageUI_Source/client/menu/MenuController.lua",
    "RageUI_Source/client/components/*.lua",
    "RageUI_Source/client/menu/elements/*.lua",
    "RageUI_Source/client/menu/items/*.lua",
    "RageUI_Source/client/menu/panels/*.lua",
    "RageUI_Source/client/menu/windows/*.lua",
    -- ↓ PersonalMenu Client ↓
    'shared/commands.lua',
    'shared/keymapping.lua',
    'client/*.lua',
}

server_scripts {
    -- ↓ MySQL-Async ↓
    '@mysql-async/lib/MySQL.lua',
    -- ↓ PersonalMenu Webhooks Config ↓
    'shared/config_webhooks.lua',
    -- ↓ PersonalMenu Server ↓
    'server/server.lua'
}

dependency 'jsfour-idcard'