RefreshMoney = function()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			societymoney = ESX.Math.GroupDigits(money);
		end, ESX.PlayerData.job.name);
	end
end

RefreshMoney2 = function()
	if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
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

startAnimation = function(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
		RemoveAnimDict(lib)
	end)
end

getCamDirection = function()
	local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId());
	local pitch = GetGameplayCamRelativePitch();
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0));
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z));
	if len ~= 0 then
		coords = coords / len;
	end
	return coords;
end

entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle);
		end
		enum.destructor = nil;
		enum.handle = nil;
	end
}

EnumerateEntities = function(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter);
			return
		end
		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator);
		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next
		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter);
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject);
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed);
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle);
end

function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup);
end

function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0);
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle);
	return vehicle;
end

DeleteVehicle = function()
    local vehicle = ESX.Game.GetVehicleInDirection();
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        vehicle = GetVehiclePedIsIn(PlayerPedId(), false);
    end
    if DoesEntityExist(vehicle) then
        ESX.Game.DeleteVehicle(vehicle);
    end
end

DeleteVehicleDistance = function(entity)
    if not DoesEntityExist(entity) then return end
    NetworkRequestControlOfEntity(entity);
    SetEntityAsMissionEntity(entity, true, true);
    DeleteEntity(entity);
    DeleteVehicle(entity);
end

local dict = {
    math = math;
}
GetClosestVehicle = function(max_distance)
    local veh, dist = nil, dict.math.huge;
    local cur = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0);
    for vehicle in EnumerateVehicles() do
        local this = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.0, 0.0);
        if DoesEntityExist(vehicle) then
            local distance = GetDistanceBetweenCoords(cur.x, cur.y, cur.z, this.x, this.y, this.z);
            if distance < dist then
                dist = distance;
                veh = vehicle;
            end
        end
    end
    if dist > (max_distance or 10.0) then return end
    return veh, dist;
end