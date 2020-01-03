ESX = nil
Citizen.CreateThread(function()
	while true do
		Wait(5)
		if ESX ~= nil then
		
		else
			ESX = nil
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		end
	end
end)

local lastInput = 0
local pause = false
local correct = 0

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


RegisterNetEvent('ldc_robbery:message')
AddEventHandler('ldc_robbery:message', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('ldc_robbery:start')
AddEventHandler('ldc_robbery:start', function()
	playerPed = GetPlayerPed(-1)
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local w01 = -227
	local w02 = -2000
	local w03 = 0
	local w04 = 0
--	local cops = 0
 --	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 	--if xPlayer.job.name == 'police' then
	--	 cops = cops + 1
	--	end
	--end
---	if(cops > 1)then
	  if IsPedInAnyVehicle(playerPed) then
		ESX.ShowNotification("~y~無法在車上開啟電腦")
	  else
	    w03 = pos.x - w01
		w04 = pos.y - w02
		 if w03 < 3 and w03 > -3 and w04 < 3 and w04 > -3 then
		 local ped = PlayerPedId()
			 TriggerServerEvent('ldc_robbery:catch')
		 Wait(1000)
		     TriggerEvent("mhacking:show")
	         TriggerEvent("mhacking:start",7,150, openmoney)
		 else
			 ESX.ShowNotification("~y~無法在此開啟電腦")
		 end
	end
	--else
	--ESX.ShowNotification("~r~線上警察不足")
	--end
	end, false)

function openmoney(success)
	if success then
		TriggerEvent('mhacking:hide')

	else
        TriggerEvent('mhacking:hide')
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not changed then
            ped = PlayerPedId()
            local IsCuffed = IsPedCuffed(ped)
            if IsCuffed and not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 3) then
                Citizen.Wait(0)
                TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)
            end
        else
            changed = false
        end
    end
end)