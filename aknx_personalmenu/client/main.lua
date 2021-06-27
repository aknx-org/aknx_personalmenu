ESX = nil;
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.GetESX, function(lib) ESX = lib end)
        Citizen.Wait(10);
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10);
    end
    ESX.PlayerData = ESX.GetPlayerData();
    while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end
	--while ESX.GetPlayerData().job2 == nil do Citizen.Wait(10) end
    RefreshMoney();
	RefreshMoney2();
	self.WeaponData = ESX.GetWeaponList();
	for i = 1, #self.WeaponData, 1 do
		if self.WeaponData[i].name == 'WEAPON_UNARMED' then
			self.WeaponData[i] = nil;
		else
			self.WeaponData[i].hash = GetHashKey(self.WeaponData[i].name);
        end
	end
end)

--  event
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job;
	RefreshMoney();
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2;
	RefreshMoney2();
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
	ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer;
end)

RegisterNetEvent('esx_personalmenu:AddAmmoToPed')
AddEventHandler('esx_personalmenu:AddAmmoToPed', function(value, quantity)
	local weapon_hash = GetHashKey(value)
	if HasPedGotWeapon(ped, weapon_hash, false) and value ~= 'WEAPON_UNARMED' then
		AddAmmoToPed(ped, value, quantity)
	end
end)

-- admin
access_admin_menu = false
local interval = 1000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        if not openF5Menu then
            interval = 1000
        else
            interval = 15000
            ESX.TriggerServerCallback('esx_personalmenu:getGroupOfPlayer', function(pGroup)
                for k,v in pairs(Config.PermissionsForAdministration) do
                    print(Config.PermissionsForAdministration[k])
                    if pGroup == Config.PermissionsForAdministration[k] then
                        access_admin_menu = true
                        return true
                    end
                end
            end)
        end
    end
end)

local interval = 1000
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(interval);
		if not self.InStaff then
			interval = 1000;
		else
			interval = 0;
            plyPed = PlayerPedId()
			if self.showNames then
                local pCoords = GetEntityCoords(PlayerPedId(), false);
                for _,v in pairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v);
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            self.gamerTags[v] = CreateFakeMpGamerTag(otherPed, "["..GetPlayerServerId(v).."] - "..GetPlayerName(v), true, false, '', 2);
							SetMpGamerTagAlpha(self.gamerTags[v], 2, 255);
							SetMpGamerTagVisibility(self.gamerTags[v], 2, true);
						else
							RemoveMpGamerTag(self.gamerTags[v]);
                            self.gamerTags[v] = nil;
						end
                	end
            	else
                	for _,v in pairs(GetActivePlayers()) do
                    	RemoveMpGamerTag(self.gamerTags[v]);
                	end
            	end
				if self.activeNoclip then
					SetCanPedEquipAllWeapons(PlayerPedId(), false);
					local plyCoords = GetEntityCoords(plyPed, false);
					local camCoords = getCamDirection();
					SetEntityVelocity(plyPed, 0.01, 0.01, 0.01);
					SetEntityVelocity(PlayerPedId(), 0.01, 0.01, 0.01);
					if IsControlPressed(0, 32) then
						plyCoords = plyCoords + (self.noclipSpeed * camCoords);
					end
					if IsControlPressed(0, 269) then
                        plyCoords = plyCoords - (self.noclipSpeed * camCoords)
					end
					if IsControlPressed(1, 15) then
						self.noclipSpeed = self.noclipSpeed + 0.5;
					end
                	if IsControlPressed(1, 16) then
                    self.noclipSpeed = self.noclipSpeed - 0.5;
                    if self.noclipSpeed < 0 then
                        self.noclipSpeed = 0;
                    end
                end
				SetEntityCoordsNoOffset(plyPed, plyCoords, true, true, true)
			else
				SetCanPedEquipAllWeapons(PlayerPedId(), true);
			end
		end
	end
end)