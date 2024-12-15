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