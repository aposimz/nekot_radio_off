Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000) -- Check interval

        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            -- Disable user radio control
            SetUserRadioControlEnabled(false)

            -- Turn off the radio station directly
            SetVehRadioStation(GetVehiclePedIsIn(ped, false), "OFF")
        end
    end
end)

-- Turn off the radio station using a command
RegisterCommand('offradio', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        SetVehRadioStation(GetVehiclePedIsIn(ped, false), "OFF")
        TriggerEvent('QBCore:Notify', "Radio turned off", "success")
    else
        TriggerEvent('QBCore:Notify', "You are not in a vehicle", "error")
    end
end, false)

-- Disable the radio using a command
RegisterCommand('noradio', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        SetVehicleRadioEnabled(GetVehiclePedIsIn(ped, false), false)
        SetVehRadioStation(GetVehiclePedIsIn(ped, false), "OFF")
        TriggerEvent('QBCore:Notify', "Radio disabled", "success")
    else
        TriggerEvent('QBCore:Notify', "You are not in a vehicle", "error")
    end
end, false)