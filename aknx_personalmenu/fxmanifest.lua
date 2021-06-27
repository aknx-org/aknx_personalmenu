fx_version 'adamant'
game { 'gta5' };

developper 'Akashi'
discord 'A̴k̴a̴s̴h̴i̴#0001'

shared_scripts {
    -- ↓ PersonalMenu Config ↓
    'shared/config.lua'
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
    -- ↓ PersonalMenu Config Menu Buttons ↓
    'config_buttons.lua',
    -- ↓ PersonalMenu Client ↓
    'shared/commands.lua',
    'shared/keymapping.lua',
    'client/*.lua',
}

server_scripts {
    -- ↓ MySQL-Async ↓
    '@mysql-async/lib/MySQL.lua',
    -- ↓ PersonalMenu Server ↓
    'server/server.lua'
}