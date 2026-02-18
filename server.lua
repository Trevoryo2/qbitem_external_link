local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('serverbook', function(source)
    TriggerClientEvent('myguide:openBook', source)
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    local src = Player.PlayerData.source
    local metadata = Player.PlayerData.metadata

    if not metadata.receivedGuide then
        exports.ox_inventory:AddItem(src, 'serverbook', 1)
        Player.Functions.SetMetaData('receivedGuide', true)
        Player.Functions.Save()
    end
end)