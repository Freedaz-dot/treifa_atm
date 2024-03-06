
RegisterNetEvent('8007-0570', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    for i = 1, #ATM.hashatm do
        local atm = GetClosestObjectOfType(pos.x, pos.y, pos.z, ATM.ATMDistance, ATM.hashatm[i].model, false, false, false)
        if DoesEntityExist(atm) then
            atm_model = ATM.hashatm[i].model
            if atm ~= closestATM then
                closestATM = atm
                atmPos = GetEntityCoords(atm)
            end
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, atmPos.x, atmPos.y, atmPos.z, true)
        
            if dist <= 3 then
                start_atm()
            end
            
        end
    end

end)