--[[ ===================================================== ]]--
--[[       QBCore Job Garage Menu Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--

fx_version 'cerulean'
game 'gta5'

author 'MaDHouSe'
description 'QB-Garage Menu with categories'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/nl.lua', -- Change this to your preferred language
    'config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua',
}

lua54 'yes'