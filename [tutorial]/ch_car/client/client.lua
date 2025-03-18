RegisterCommand('car', function (source, args)
    local vehicleName = args[1]
    local isCdimage = IsModelInCdimage(vehicleName)
    local isVehicle = IsModelAVehicle(vehicleName)

    checkModel(vehicleName, isCdimage, isVehicle)

    Citizen.CreateThread(function ()
        loadModel(vehicleName)
    end)

    getPlayerToCar(vehicleName)
end, false)

function checkModel(modelName, isCdimage, isVehicle)
    if not isCdimage or not isVehicle then
        TriggerEvent('chat:addMessage', {
            args = { 'Unknown vehicle name: ' .. modelName }
        })
        return
    end

    TriggerEvent('chat:addMessage', {
        args = { 'Spawning vehicle: ' .. modelName }
    })
end

function loadModel(modelName)
    RequestModel(modelName)

    local maxTimeWait = 5000
    local timeSeconds = 10
    local timeWait = 0
    while not HasModelLoaded(modelName) do
        Citizen.Wait(timeSeconds)
        timeWait = timeWait + timeSeconds

        if timeWait >= maxTimeWait then
            TriggerEvent('chat:addMessage', {
                args = { 'Could not load: ' .. modelName }
            })
            return
        end
    end
end

function getPlayerToCar(modelName)
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local vehicle = CreateVehicle(modelName, pos.x, pos.y, pos.z, heading, true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetModelAsNoLongerNeeded(modelName)
end