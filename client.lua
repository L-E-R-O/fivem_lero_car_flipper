Citizen.CreateThread(function()
    print("DEBUG: Skript fivem_lero_car_flipper gestartet")
    local notified = false
    local isRightingVehicle = false

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        -- Fahrzeuge in der Nähe prüfen (Radius 5.0 Meter)
        local nearbyVehicle = GetClosestVehicle(playerPos, 3.0, 0, 70)

        -- DEBUG:  ACHTUNG:!!! Lege das Fahrzeug auf Dach, nur für Admins!
        -- if IsControlJustPressed(0, 45) then -- R-Taste
        --     SetEntityRotation(nearbyVehicle, 180.0) -- Fahrzeug auf dach legen      
        -- end
        -- /DEBUG

        if nearbyVehicle ~= 0 then
            local vehicleClass = GetVehicleClass(nearbyVehicle)
            -- Prüfen, ob die Fahrzeugklasse erlaubt ist
            if Config and Config.allowedVehicleClasses and Config.allowedVehicleClasses[vehicleClass] == true then
                local roll = GetEntityRoll(nearbyVehicle)
                if roll > 80.0 or roll < -80.0 then
                    if not notified then
                        ShowHelpNotification("~INPUT_CONTEXT~, um das Fahrzeug zu drehen.")
                        notified = true
                    end

                    -- E-Taste drücken
                    if IsControlJustPressed(0, 51) and not isRightingVehicle then -- E-Taste (INPUT_CONTEXT)
                        isRightingVehicle = true
                        RightVehicle(playerPed, nearbyVehicle)
                        isRightingVehicle = false
                    end
                else
                    notified = false
                end
            else
                notified = false
            end
        else
            notified = false
        end
    end
end)

function ShowNotification(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(true, false)
end

function ShowHelpNotification(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function RightVehicle(playerPed, vehicle)
    -- Sicherstellen, dass der Spieler nicht im Fahrzeug sitzt
    if IsPedInVehicle(playerPed, vehicle, false) then
        TaskLeaveVehicle(playerPed, vehicle, 0)
        Citizen.Wait(1000) -- Warten, bis der Spieler ausgestiegen ist
    end

    -- Request the push animation dictionary
    RequestAnimDict("missfinale_c2ig_11")
    while not HasAnimDictLoaded("missfinale_c2ig_11") do
        Citizen.Wait(100)
    end
    -- Play the push animation
    TaskPlayAnim(GetPlayerPed(-1), "missfinale_c2ig_11", "pushcar_offcliff_m", 8.0, -8.0, -1, 33, 0, false, false, false)
    
    -- Drei Skill-Checks während der Animation
    local success = true
    for i = 1, 3 do
        Citizen.Wait(1500) -- 1.5s delay to fit within animation
        local difficulty = i == 1 and 'medium' or i == 2 and 'medium' or 'medium'
        local checkResult = lib.skillCheck(difficulty, {'w'})
        if not checkResult then
            success = false
            ClearPedTasks(playerPed)
            ShowNotification("~r~" .. Config.funnyInsults[math.random(1, #Config.funnyInsults)])
            return false
        end
    end

    -- Fahrzeug auf die Räder stellen, nur wenn alle Skill-Checks erfolgreich waren
    if success then
        FreezeEntityPosition(vehicle, true) -- Fahrzeug einfrieren, um Physikprobleme zu vermeiden
        local heading = GetEntityHeading(vehicle)
        SetEntityRotation(vehicle, 0.0, 0.0, heading, 2, true) -- Fahrzeug aufrecht setzen
        Citizen.Wait(100)
        FreezeEntityPosition(vehicle, false) -- Fahrzeug entfrieren
        SetVehicleOnGroundProperly(vehicle) -- Fahrzeug korrekt auf den Boden setzen
        ShowNotification("~g~Gute Weiterfahrt!")
    end

    -- Animation beenden
    ClearPedTasks(playerPed)
    return success
end

