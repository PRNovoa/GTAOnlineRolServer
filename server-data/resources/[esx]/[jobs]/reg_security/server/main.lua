-- Napisane przez --
-- vjuton#1337 -- 
-----------------

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

-- THERE IS SOME MONEY THINGS

RegisterServerEvent('esx_banksecurity')
AddEventHandler('esx_banksecurity', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Alguien tiene hack de dinero @everyone",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'ANTICHEAT | Que crees que estás haciendo?')
end)

RegisterServerEvent('esx_airlines:pay')
AddEventHandler('esx_airlines:pay', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Alguien ha intentado dar dinero con hack @everyone",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'ANTICHEAT | Que crees que estás haciendo?')
end)

RegisterServerEvent('esx_garbagejob:pay')
AddEventHandler('esx_garbagejob:pay', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Alguien ha intentado dar dinero con hack @everyone",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'ANTICHEAT | Que crees que estás haciendo?')
end)

-- THERE ARE SEND BILLS

RegisterServerEvent('esx_billing:sendBill')
AddEventHandler('esx_billing:sendBill', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Han intentado meter multas con hack @everyone",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'ANTICHEAT | Que crees que estás haciendo?')
end)

-- THERE ARE JAIL THINGS

RegisterServerEvent('esx_jailer:sendToJail')
AddEventHandler('esx_jailer:sendToJail', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Han intentado meter a todos en la carcel @everyone",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'ANTICHEAT | Que crees que estás haciendo?')
end)

-- THERE ARE POLICEJOB THINGS

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Han intentado esposar con hacks @everyone",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'ANTICHEAT | Que crees que estás haciendo?')
end)

-- INSERT BLOCK


RegisterServerEvent("klikanie")
AddEventHandler("klikanie", function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local id = GetPlayerLastMsg(source)
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "--> \n"..name.."ha tocado insert",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right noiw ): **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "Ostatnia wiadomosc gracza:"..id.."\n <--",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "CALLEJEROSRP", embeds = connect}), { ['Content-Type'] = 'application/json' }) 
print("vjuton-ac |"..name.." \n kliknal insert")
DropPlayer(source, "ANTICHEAT | Que crees que estás haciendo? ")
end)

-- EXPLOSION EVENT ONLY ONESYNC

RegisterServerEvent('explosionEvent')
AddEventHandler('explosionEvent', function(sender, ev) -- Anty eksplosja | Niestety działa tylko na onesync'u
	CancelEvent()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "23295",
            ["title"] = "Alguien ha intentado explotar el servidor",
            ["description"] = "User: **"..name.."**\nIP ( function dont work right now ): **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "NIGGER",
            },
        }
    }

PerformHttpRequest('https://discordapp.com/api/webhooks/629985864163917849/GJLPmPSTEBXBRPkCsCD_op7HtWErcUy6mDBG9O2G-ZXU-ihW0rjOZIpj2tmgOLqeD1yn', function(err, text, headers) end, 'POST', json.encode({username = "VJUTON ANTYCHEAT", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
end)
