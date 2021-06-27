ESX = nil;
TriggerEvent(Config.GetESX, function(lib) 
    ESX = lib;
end)

GetAllGradeOfJob = function(jobname) -- by korioz
	local queryDone, queryResult = false, nil
	MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	}, function(result)
		queryDone, queryResult = true, result
	end)
	while not queryDone do Citizen.Wait(10) end
	if queryResult[1] then
		return queryResult[1].grade
	end
	return nil
end

ESX.RegisterServerCallback('esx_personalmenu:getGroupOfPlayer', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source);
    local pGroup = xPlayer.getGroup();
    cb(pGroup);
end)

RegisterServerEvent('esx_personalmenu:sendAmmo')
AddEventHandler('esx_personalmenu:sendAmmo', function(ped, value, quantity)
	if #(GetEntityCoords(source, false) - GetEntityCoords(ped, false)) <= 3.0 then
		TriggerClientEvent('esx_personalmenu:AddAmmoToPed', ped, value, quantity);
	end
end)

RegisterServerEvent("esx_personalmenu:TransferCashMoney")
AddEventHandler("esx_personalmenu:TransferCashMoney", function(target,quantity)
	local xPlayer1 = ESX.GetPlayerFromId(source);
	local xPlayer2 = ESX.GetPlayerFromId(target);
	if quantity > xPlayer2.getMoney() then
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas autant d\'argent sur vous !");
	else
		xPlayer2.addMoney(quantity);
		xPlayer1.removeMoney(quantity);
        TriggerClientEvent('esx:showNotification', source, "Vous venez de donner ~g~"..quantity.."$~s~ à ~b~"..GetPlayerName(target));
        TriggerClientEvent('esx:showNotification', target, "Vous venez de recevoir ~g~"..quantity.."$~s~ de la part de  ~b~"..GetPlayerName(source));
	end
end)

RegisterServerEvent('esx_personalmenu:societyRecrutePlayer')
AddEventHandler('esx_personalmenu:societyRecrutePlayer', function(target, job, grade)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pSource.job.grade_name == 'boss' then
		pTarget.setJob(job, grade);
		TriggerClientEvent('esx:showNotification', pSource, "Vous venez de recruter "..pTarget.name..".");
		TriggerClientEvent('esx:showNotification', pTarget, "Vous venez d\'être emabuché par "..pSource.name..".");
	else
		DropPlayer(pSource, "Vous avez été kick pour moddeur.");
	end
end)

RegisterServerEvent('esx_personalmenu:societyPromotePlayer')
AddEventHandler('esx_personalmenu:societyPromotePlayer', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pTarget.job.grade == tonumber(GetAllGradeOfJob(pSource.job.name)) - 1 then
		TriggerClientEvent('esx:showNotification', pSource, "~r~Cette action est impossible !");
	else
		if pSource.job.grade_name == 'boss' and pSource.job.name == pTarget.job.name then
			pTarget.setJob(pTarget.job.name, tonumber(pTarget.job.grade) + 1);
			TriggerClientEvent('esx:showNotification', pSource, "Vous venez de promouvoir "..pTarget.name.."");
			TriggerClientEvent('esx:showNotification', pTarget, "Vous venez d\'être promu par "..pSource.name.."");
		else
			TriggerClientEvent('esx:showNotification', pSource, "Cette action est impossible.");
		end
	end
end)

RegisterServerEvent('esx_personalmenu:societyRemovePlayer')
AddEventHandler('esx_personalmenu:societyRemovePlayer', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pTarget.job.grade == 0 then
		TriggerClientEvent('esx:showNotification', pSource, "~r~Vous ne pouvez plus rétrograder, maintenant il faut virer.");
	else
		if pSource.job.grade_name == 'boss' and pSource.job.name == pTarget.job.name then
			pTarget.setJob(pTarget.job.name, tonumber(pTarget.job.grade) - 1);
			TriggerClientEvent('esx:showNotification', pSource, "Vous venez de rétrograder "..pTarget.name..".");
			TriggerClientEvent('esx:showNotification', pTarget, "Vous venez d\'être rétrogradé par "..pSource.name..".");
		else
			TriggerClientEvent('esx:showNotification', pSource, "Cette action est impossible.");
		end
	end
end)

RegisterServerEvent('esx_personalmenu:societyDemotePlayer')
AddEventHandler('esx_personalmenu:societyDemotePlayer', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pSource.job.grade_name == 'boss' and pSource.job.name == pTarget.job.name then
		targetXPlayer.setJob('unemployed', 0);
		TriggerClientEvent('esx:showNotification', pSource, "Vous venez de virer "..pTarget.name..".");
		TriggerClientEvent('esx:showNotification', pTarget, "Vous venez d\'être viré par "..pSource.name..".");
	else
		TriggerClientEvent('esx:showNotification', pSource, "Cette action est impossible.");
	end
end)

RegisterServerEvent('esx_personalmenu:giveMoneyCash')
AddEventHandler('esx_personalmenu:giveMoneyCash', function(quantity)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		xPlayer.addMoney(quantity);
	else
		DropPlayer(source, "Vous avez été kick pour moddeur.");
	end
end)

RegisterServerEvent('esx_personalmenu:giveMoneyBank')
AddEventHandler('esx_personalmenu:giveMoneyBank', function(quantity)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		xPlayer.addAccountMoney("bank", quantity)
	else
		DropPlayer(source, "Vous avez été kick pour moddeur.");
	end
end)

RegisterServerEvent('esx_personalmenu:giveBlackMoney')
AddEventHandler('esx_personalmenu:giveBlackMoney', function(quantity)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		xPlayer.addAccountMoney("black_money", quantity)
	else
		DropPlayer(source, "Vous avez été kick pour moddeur.");
	end
end)