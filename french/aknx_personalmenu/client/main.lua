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
	if Config.EnableDoubleJob then
		while ESX.GetPlayerData().job2 == nil do Citizen.Wait(10) end
	end
    RefreshMoney();
	if Config.EnableDoubleJob then
		RefreshMoney2();
	end
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

if Config.EnableDoubleJob then
	RegisterNetEvent('esx:setJob2')
	AddEventHandler('esx:setJob2', function(job2)
		ESX.PlayerData.job2 = job2;
		RefreshMoney2();
	end)
end

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
	ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer;
end)

RegisterNetEvent("esx_personalmenu:bringPlayer2")
AddEventHandler("esx_personalmenu:bringPlayer2", function(coords)
	SetEntityCoords(PlayerPedId(), coords)

end)

RegisterNetEvent("esx_personalmenu:playerListC")
AddEventHandler("esx_personalmenu:playerListC", function(list)
    self.playersList = list
end)

-- admin
access_admin_menu = false
local interval = 1000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval);
        if not openF5Menu then
            interval = 1000;
        else
            interval = 15000;
            ESX.TriggerServerCallback('esx_personalmenu:getGroupOfPlayer', function(pGroup)
				pPerms = pGroup
                for k,v in pairs(Config.PermissionsForAdministration) do
                    if pGroup == Config.PermissionsForAdministration[k] then
                        access_admin_menu = true;
                        return true;
                    end
                end
            end)
        end
    end
end)

local interval = 1000;
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(interval);
		if not self.InStaff then
			interval = 1000;
		else
			interval = 0;
			if Config.EnableGroupAdminMessage then
			RageUI.Text({message = "~g~Administration activé\n~s~Rang : ~b~"..pPerms ,time_display = 1});
			end
            plyPed = PlayerPedId()
			if self.showNames then
                local pCoords = GetEntityCoords(PlayerPedId(), false);
                for _,v in pairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v);
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            self.gamerTags[v] = CreateFakeMpGamerTag(otherPed, "["..GetPlayerServerId(v).."] - "..GetPlayerName(v), true, false, '', 0);
							SetMpGamerTagAlpha(self.gamerTags[v], 0, 255);
							SetMpGamerTagAlpha(self.gamerTags[v], 2, 255);
							SetMpGamerTagAlpha(self.gamerTags[v], 4, 255);
							SetMpGamerTagAlpha(self.gamerTags[v], 7, 255);
							SetMpGamerTagVisibility(self.gamerTags[v], 0, true);
							SetMpGamerTagVisibility(self.gamerTags[v], 2, true);
							SetMpGamerTagVisibility(self.gamerTags[v], 4, NetworkIsPlayerTalking(v));
							SetMpGamerTagVisibility(self.gamerTags[v], 7, DecorExistOn(otherPed, "staff1") and DecorGetInt(otherPed, "staff1") > 0);
							SetMpGamerTagColour(self.gamerTags[v], 7, 55);
							if NetworkIsPlayerTalking(otherPed) then
								SetMpGamerTagHealthBarColour(self.gamerTags[v], 211);
								SetMpGamerTagColour(self.gamerTags[v], 4, 211);
								SetMpGamerTagColour(self.gamerTags[v], 0, 211);
							else
								SetMpGamerTagHealthBarColour(self.gamerTags[v], 0);
								SetMpGamerTagColour(self.gamerTags[v], 4, 0);
								SetMpGamerTagColour(self.gamerTags[v], 0, 0);
							end
							if DecorExistOn(otherPed, "staff1") then
								SetMpGamerTagWantedLevel(otherPed, DecorGetInt(otherPed, "staff1"));
							end
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
					gett = false
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