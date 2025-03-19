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
    local x_pos = assert(tonumber(data.x), infoToPlayer('X invalid'))
    local y_pos = assert(tonumber(data.y), infoToPlayer('Y invalid'))
    local z_pos = assert(tonumber(data.z), infoToPlayer('Z invalid'))

    SetEntityCoords(PlayerPedId(), x_pos, y_pos, z_pos, false, false, false, false)
    cb({}) -- Safety, callback must be in bottom
end)

function infoToPlayer(args)
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {args}
    })
end
