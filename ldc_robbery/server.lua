ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('laptop', function(source)
	local _source = source
	TriggerClientEvent('ldc_robbery:start', _source)

end)

RegisterNetEvent('ldc_robbery:catch')
AddEventHandler('ldc_robbery:catch', function()
	_source = source
	local weight = 2
	xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('ldc_robbery:message', _source, "~y~你正在駭入系統")
    xPlayer.removeInventoryItem('laptop', 1)
end)

RegisterNetEvent('ldc_robbery:enter')
AddEventHandler('ldc_robbery:enter', function()
	_source = source
	TriggerClientEvent('ldc_robbery:message', _source, "~y~你成功駭入系統")
end)