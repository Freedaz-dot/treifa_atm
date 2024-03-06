local helpNotification = false

function start_atm()
    -- Charger l'animation de braquage de banque avec une perceuse
    local ped = PlayerPedId()
    local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
    local animDict = 'anim_heist@hs3f@ig9_vault_drill@laser_drill@'
    loadAnimDict(animDict)
    local bagModel = 'hei_p_m_bag_var22_arm_s'
    loadModel(bagModel)
    local laserDrillModel = 'hei_prop_heist_drill'
    loadModel(laserDrillModel)

    RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)

    soundId = GetSoundId()

    cam = CreateCam("DEFAULT_ANIMATED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, 0, 3000, 1, 0)

    bag = CreateObject(GetHashKey(bagModel), pedCo, 1, 0, 0)
    laserDrill = CreateObject(GetHashKey(laserDrillModel), pedCo, 1, 0, 0)
    
    
    -- change vaultPos to the position of the player
    local vaultPos = GetEntityCoords(ped)
    local vaultRot = GetEntityRotation(ped)

    for i = 1, #LaserDrill['animations'] do
        LaserDrill['scenes'][i] = NetworkCreateSynchronisedScene(vaultPos, vaultRot, 2, true, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
        NetworkAddEntityToSynchronisedScene(bag, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][2], 1.0, -1.0, 1148846080)
        NetworkAddEntityToSynchronisedScene(laserDrill, LaserDrill['scenes'][i], animDict, LaserDrill['animations'][i][3], 1.0, -1.0, 1148846080)
    end

    NetworkStartSynchronisedScene(LaserDrill['scenes'][1])
    PlayCamAnim(cam, 'intro_cam', animDict, vaultPos, vaultRot, 0, 2)
    Wait(GetAnimDuration(animDict, 'intro') * 1000)
    
    NetworkStartSynchronisedScene(LaserDrill['scenes'][2])
    PlayCamAnim(cam, 'drill_straight_start_cam', animDict, vaultPos, vaultRot, 0, 2)
    Wait(GetAnimDuration(animDict, 'drill_straight_start') * 1000)
    
    NetworkStartSynchronisedScene(LaserDrill['scenes'][3])
    PlayCamAnim(cam, 'drill_straight_idle_cam', animDict, vaultPos, vaultRot, 0, 2)
    PlaySoundFromEntity(soundId, "Drill", laserDrill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
    -- faire en sorte que quand il appuie sur x sa arrete tout

    -- ESX show help notification
    AddTextEntry('entryKeye', 'Appuyez sur ~INPUT_CELLPHONE_RIGHT~ pour augmenter la vitesse de la perceuse. Appuyez sur ~INPUT_CELLPHONE_LEFT~ pour diminuer la vitesse de la perceuse. Appuyez sur ~INPUT_CELLPHONE_UP~ pour faire monter la tige. Appuyez sur ~INPUT_CELLPHONE_DOWN~ pour faire descendre la tige. Appuyez sur ~INPUT_PARACHUTE_SMOKE~ pour arreter le forage')
    DisplayHelpTextThisFrame('entryKeye', true)


    Drilling.Start(function(status)
        if status then
            TriggerServerEvent('843887615:84686', vaultPos)
            TriggerServerEvent('89498471321-1212')
            StopSound(soundId)
            NetworkStartSynchronisedScene(LaserDrill['scenes'][5])
            PlayCamAnim(cam, 'drill_straight_end_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'drill_straight_end') * 1000)
            NetworkStartSynchronisedScene(LaserDrill['scenes'][6])
            TriggerServerEvent('648856848:8484')
            PlayCamAnim(cam, 'exit_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'exit') * 1000)
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(cam, false)
            ClearPedTasks(ped)
            DeleteObject(bag)
            DeleteObject(laserDrill)
        else
            TriggerServerEvent('843887615:84686', vaultPos)
            TriggerServerEvent('89498471321-1212')
            print('Drilling failed')
            StopSound(soundId)
            NetworkStartSynchronisedScene(LaserDrill['scenes'][4])
            PlayCamAnim(cam, 'drill_straight_fail_cam', animDict, vaultPos, vaultRot, 0, 2)
            Wait(GetAnimDuration(animDict, 'drill_straight_fail') * 1000 - 1500)
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(cam, false)
            ClearPedTasks(ped)
            DeleteObject(bag)
            DeleteObject(laserDrill)
        end
    end)
    removeShowHelpNotification()
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function removeShowHelpNotification()
    -- Remplacer le texte d'aide par une chaîne vide
    AddTextEntry('entryKeye', '')
    
end
