RefreshMoney = function()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney = ESX.Math.GroupDigits(money);
		end, ESX.PlayerData.job.name);
	end
end

RefreshMoney2 = function()
	if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society2:getSocietyMoney', function(money)
			societymoney2 = ESX.Math.GroupDigits(money);
		end, ESX.PlayerData.job2.name);
	end
end

PlayerMarker = function()
    local closestPlayer = GetPlayerPed(ESX.Game.GetClosestPlayer())
    local pos = GetEntityCoords(closestPlayer);
    local target, distance = ESX.Game.GetClosestPlayer();
    if distance <= 2.0 then
		DrawMarker(21, pos.x, pos.y, pos.z+1.2, 1.0, 0.0, 1.0, 5.0, 0.0, 0.0, 0.35, 0.35, 0.35, 0, 255, 31, 255, 5, 1, 2, 0, nil, nil, 0);
    end
end

KeyboardInput = function(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry);
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength);
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(1.0);
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult();
        Citizen.Wait(500);
        return result
    else
        Citizen.Wait(500);
        return nil
    end
end

CheckQuantity = function(number)
    number = tonumber(number);
    if type(number) == 'number' then
        number = ESX.Math.Round(number);
        if number > 0 then
            return true, number;
        end
    end
    return false, number;
end

startAnimation = function(dict, anim)
	ESX.Streaming.RequestAnimDict(dict, function()
		TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, -1, 49, 0, false, false, false);
		RemoveAnimDict(dict);
	end)
end

getCamDirection = function()
	local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(plyPed);
	local pitch = GetGameplayCamRelativePitch();
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0));
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z));
	if len ~= 0 then
		coords = coords / len;
	end
	return coords;
end
