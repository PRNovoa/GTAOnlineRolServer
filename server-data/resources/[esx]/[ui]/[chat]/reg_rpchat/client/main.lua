ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function AddText(message, state, pid)
  Citizen.CreateThread(function()
    local time = 1500 + string.len(message) * 50
    if state == 1 then
      message = "~o~· " .. message .. " ·"
    else
      message = "~p~· " .. message .. " ·"
    end
    local loop = true
    Citizen.SetTimeout(time, function() loop = false end)
    while loop do
      ESX.Game.Utils.DrawText3D(GetEntityCoords(GetPlayerPed(pid)) + vector3(0,0,1), message, 1.0, 1)
      Wait(0)
    end
  end)
end

RegisterNetEvent('reg_rpchat:proximityMessage')
AddEventHandler('reg_rpchat:proximityMessage', function(id, name, message, temp, state)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == id then
    TriggerEvent('chat:addMessage', {
      template = temp,
      args = { name, message }
    })
    if state then
      AddText(message, state, pid)
    end
  elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(GetPlayerPed(pid))) < Config.Distance then
    TriggerEvent('chat:addMessage', {
      template = temp,
      args = { name, message }
    })
    if state then
      AddText(message, state, pid)
    end
  end
end)

RegisterNetEvent('reg_rpchat:globalMessage')
AddEventHandler('reg_rpchat:globalMessage', function(name, message, temp)
  TriggerEvent('chat:addMessage', {
    template = temp,
    args = { name, message }
  })
end)