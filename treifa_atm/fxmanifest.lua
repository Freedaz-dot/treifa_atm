
fx_version 'adamant'
games { 'gta5' };
lua54 'yes'
author 'Treifa'
description ' HACK ATM NEST  FiveM'
version '1.0.0'

client_scripts {
    "client/*.lua",
}

server_scripts {
    "server/*.lua",
}

shared_script {
    'drilling.lua',
    'config.lua',
}

-- escrow ignore 

escrow_ignore {
    'config.lua',
}