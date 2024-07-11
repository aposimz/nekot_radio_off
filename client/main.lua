Citizen.CreateThread(function()
    local lastRadioCheckVehicle = nil
    local CatEnterTime = 0

    while true do
        Citizen.Wait(1000)

        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local currentVehicle = GetVehiclePedIsIn(ped, false)

            if currentVehicle ~= lastRadioCheckVehicle then
                lastRadioCheckVehicle = currentVehicle
                CatEnterTime = GetGameTimer()
                
                -- 1秒後にラジオ局がnilオフ以外ならオフにする Turn off the radio station after 1 second
                Citizen.CreateThread(function()
                    local ped = PlayerPedId()
                    Citizen.Wait(1000)
                    if IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) == currentVehicle then
                        local currentRadioStation = GetPlayerRadioStationName()
                        if currentRadioStation ~= nil and currentRadioStation ~= "OFF" then
                            SetVehRadioStation(currentVehicle, "OFF")
                        end
                    end
                end)
                
                -- 10秒後にラジオ局を再度オフに設定 Turn off the radio station after 10 seconds
                Citizen.CreateThread(function()
                    local ped = PlayerPedId()
                    Citizen.Wait(10000)
                    if IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) == currentVehicle then
                        SetVehRadioStation(currentVehicle, "OFF")
                    end
                end)
            end
        else
            lastRadioCheckVehicle = nil
        end
    end
end)

-- コマンドでラジオ局オフ Turn off the radio station using a command
RegisterCommand('offradio', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local currentVehicle = GetVehiclePedIsIn(ped, false)
        SetVehRadioStation(currentVehicle, "OFF")
        TriggerEvent('QBCore:Notify', "Radio turned off", "success")
    else
        TriggerEvent('QBCore:Notify', "You are not in a vehicle", "error")
    end
end, false)

-- コマンドでラジオ無効化 Disable the radio using a command
RegisterCommand('noradio', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local currentVehicle = GetVehiclePedIsIn(ped, false)
        SetVehicleRadioEnabled(currentVehicle, false)
        SetVehRadioStation(currentVehicle, "OFF")
        TriggerEvent('QBCore:Notify', "Radio disabled", "success")
    else
        TriggerEvent('QBCore:Notify', "You are not in a vehicle", "error")
    end
end, false)