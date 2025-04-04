local spawnPos = vector3(686.245, 577.950, 130.461)

AddEventHandler('onClientGameTypeStart',
    function() exports.spawnmanager:setAutoSpawnCallback(
        function() exports.spawnmanager:spawnPlayer(
        {
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_c_rat'
        },
        function() TriggerEvent('chat:addMessage',
        {
            args = { 'Spawn to: ', spawnPos }
        })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)
