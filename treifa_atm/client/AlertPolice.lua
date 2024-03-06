ESX = exports['es_extended']:getSharedObject()


RegisterNetEvent('351f-0000-0300-8007', function(pos)
    -- send notification to police
    ESX.ShowNotification(ATM.NotifPoliceAlertPolice)
    -- add blip on map
    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('ATM Piraté')
    EndTextCommandSetBlipName(blip)
    Wait(120001)
    RemoveBlip(blip)
end)