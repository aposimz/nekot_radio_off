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