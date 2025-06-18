ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('bonus:notification')
AddEventHandler('bonus:notification', function(message)
    ESX.ShowNotification(message)
end)
