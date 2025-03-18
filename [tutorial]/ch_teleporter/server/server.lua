RegisterNetEvent('ch_teleporter:goto', function (targetId)
    local playerId = source or 0
    local playerPed = GetPlayerPed(playerId)

    -- get entity handler of target
    local targetPed = GetPlayerPed(targetId)
    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'target isn\'t valid' }
        })
        return
    end

    -- get coords of the target
    local targetCoords = GetEntityCoords(targetPed)
    -- send coords to client, so client can teleport to the target
    -- TriggerClientEvent('ch_teleporter:teleport', playerId, targetCoords)
    SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, false)
end)

RegisterNetEvent('ch_teleporter:summon', function (targetId)
    local playerId = source or 0

    -- get coords of the player
    local playerPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)

    local targetPed = GetPlayerPed(targetId)

    -- get entity handler of target
    local targetPed = GetPlayerPed(targetId)
    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'target isn\'t valid' }
        })
        return
    end
    -- send coords to client, so client can teleport the target to the player
    -- TriggerClientEvent('ch_teleporter:teleport', targetId, playerCoords)
    SetEntityCoords(targetPed, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, false)
end)