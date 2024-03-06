ESX = exports['es_extended']:getSharedObject()

local cops = 0

ESX.RegisterUsableItem(ATM.ItemName, function(source)
    local All_xPlayers = ESX.GetPlayers()
    for i = 1, #All_xPlayers do
        local All_xPlayers = ESX.GetPlayerFromId(All_xPlayers[i])
        if All_xPlayers.job.name == ATM.CopsJobName then
            cops = cops + 1
        end
    end

    if cops >= ATM.numberCops then
        TriggerClientEvent("8007-0570", source)
    else 
        -- notif esx pas assez de flics
        TriggerClientEvent('esx:showNotification', source, ATM.Notifnotenoughcops)
    end
 
end)

RegisterNetEvent('843887615:84686', function(vaultPos)
    local All_xPlayers = ESX.GetPlayers()
    for i = 1, #All_xPlayers do
        local All_xPlayers = ESX.GetPlayerFromId(All_xPlayers[i])
        if All_xPlayers.job.name == ATM.CopsJobName then
            TriggerClientEvent("351f-0000-0300-8007", All_xPlayers.source, vaultPos)
        end
    end
end)


RegisterNetEvent('648856848:8484', function()
    -- send money to player
    local xPlayer = ESX.GetPlayerFromId(source)
    if ATM.Money then
        xPlayer.addAccountMoney('black_money', ATM.MoneyToGive)
    else
        xPlayer.addMoney(ATM.MoneyToGive)
    end
end)


RegisterNetEvent('89498471321-1212', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(ATM.ItemName, 1)
end)