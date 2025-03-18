RegisterCommand('+openTeleporter', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'teleport'
    })
end, false)

RegisterKeyMapping('+openTeleporter', 'Open Teleporter', 'keyboard', 'F5')

RegisterNUICallback('releaseFocus', function(data, cb)
    cb({})
    SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
    cb({})

    local x_pos = assert(tonumber(data.x), 'x is required')
    local y_pos = assert(tonumber(data.x), 'y is required')
    local z_pos = assert(tonumber(data.x), 'z is required')
    
    SetEntityCoords(PlayerPedId(), x_pos, y_pos, z_pos, false, false, false, false)
end)
