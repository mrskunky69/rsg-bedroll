local RSGCore = exports['rsg-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false

RSGCore.Functions.CreateUseableItem("bedroll", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
	if Player.Functions.RemoveItem(item.name, 0, item.slot) then
        TriggerClientEvent("rsg_bedroll:client:placeDJEquipment", source, item.name)
		TriggerEvent('rsg-log:server:CreateLog', 'camp', 'BEDTIME 💤', 'yellow', firstname..' '..lastname..' 💤 IS SETTING UP A BEDROLL 💤')
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
AddEventHandler('rsg_bedroll:server:pickeupdecks', function()
	local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('bedroll', 0)
	TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[bedroll], "add")
end)


