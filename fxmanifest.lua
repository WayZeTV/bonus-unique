fx_version 'cerulean'
game 'gta5'

author 'WayZe'
description 'Commande bonus unique /bonus'
version '1.0.0'

server_script '@mysql-async/lib/MySQL.lua' -- ou oxmysql si tu utilises ça
server_script 'server.lua'
client_script 'client.lua'
