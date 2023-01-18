local RSGCore = exports['rsg-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false

RSGCore.Functions.CreateUseableItem("bedroll", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rsg_bedroll:client:placeDJEquipment", source, item.name)
    end
end)


RegisterNetEvent('rsg_bedroll:server:pickedup', function(entity)
    local src = source
    xSound:Destroy(-1, tostring(entity))
end)


RegisterNetEvent('rsg_bedroll:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)

RegisterServerEvent('rsg_bedroll:server:pickeupdecks')
AddEventHandler('rsg_cookkit:server:pickeupdecks', function()
	local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('bedroll', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['bedroll'], "add")
end)