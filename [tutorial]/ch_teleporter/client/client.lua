RegisterCommand('goto', function(_, args)
    local targetId = args[1]

    if not targetId then
        argsInvalid('Usage: /goto [targetId]')
        return
    end

    TriggerServerEvent('ch_teleporter:goto', targetId)
end, false)

RegisterCommand('summon', function(_, args)
    local targetId = args[1]

    if not targetId then
        argsInvalid('Usage: /summon [targetId]')
        return
    end

    TriggerServerEvent('ch_teleporter:summon', targetId)
end, false)

-- DEPRECETED: Just manipulate in server
-- AddEventHandler('ch_teleporter:teleport', function(resourceName)
-- below is two in one
-- RegisterNetEvent('ch_teleporter:teleport',
--     function(targetCoords)
--         TriggerEvent('chat:addMessage', {
--             args = { 'Teleporting to: ', targetCoords }
--         })
--         SetEntityCoords(PlayerPedId(), targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, false)
--     end)

------------------------------------------------------------

function argsInvalid(args)
    TriggerEvent('chat:addMessage', {
        args = { args }
    })
end