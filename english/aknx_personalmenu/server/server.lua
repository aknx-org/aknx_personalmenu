ESX = nil;
TriggerEvent(Config.GetESX, function(lib) 
    ESX = lib;
end)

ESX.RegisterServerCallback('esx_personalmenu:getGroupOfPlayer', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source);
    local pGroup = xPlayer.getGroup();
    cb(pGroup);
end)

RegisterServerEvent("esx_personalmenu:playerListS")
AddEventHandler("esx_personalmenu:playerListS", function()
    local allPlayers = GetPlayers();
    local pPlayers = {}
    for k,v in pairs(allPlayers) do
        table.insert(pPlayers, {id = v, name = GetPlayerName(v)})
    end
    TriggerClientEvent("esx_personalmenu:playerListC", source, pPlayers)
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

RegisterServerEvent("esx_personalmenu:TransferCashMoney")
AddEventHandler("esx_personalmenu:TransferCashMoney", function(target,quantity)
	local xPlayer1 = ESX.GetPlayerFromId(source);
	local xPlayer2 = ESX.GetPlayerFromId(target);
	if quantity > xPlayer1.getMoney() then
		TriggerClientEvent('esx:showNotification', source, Config.Notification.DontHaveMoney);
	else
		xPlayer2.addMoney(quantity);
		xPlayer1.removeMoney(quantity);
        TriggerClientEvent('esx:showNotification', source, Config.Notification.SendMoneyCash..""..quantity.."$~s~ à ~b~"..GetPlayerName(target));
        TriggerClientEvent('esx:showNotification', target, Config.Notification.ReceveidMoneyCash..""..quantity.."$~s~ de la part de  ~b~"..GetPlayerName(source));
	end
end)

RegisterServerEvent('esx_personalmenu:societyRecrutePlayer')
AddEventHandler('esx_personalmenu:societyRecrutePlayer', function(target, job, grade)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pSource.job.grade_name == 'boss' then
		pTarget.setJob(job, grade);
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossRecrutePlayer..""..pTarget.name..".");
		TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerRecruted..""..pSource.name..".");
	else
		local pName = GetPlayerName(source);
   		GetAllInformations()
    	local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**MODDER DETECT**\nName : "..pName.."\nDiscord :"..discord, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    	PerformHttpRequest(Config.Webhooks.ModderDetect, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
		DropPlayer(pSource, "You have been kicked for cheat.");
	end
end)

RegisterServerEvent('esx_personalmenu:societyRecrutePlayer2')
AddEventHandler('esx_personalmenu:societyRecrutePlayer2', function(target, job, grade)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pSource.job2.grade_name == 'boss' then
		pTarget.setJob2(job, grade);
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossRecrutePlayer..""..pTarget.name..".");
		TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerRecruted..""..pSource.name..".");
	else
		local pName = GetPlayerName(source);
   		GetAllInformations()
    	local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**MODDER DETECT**\nName : "..pName.."\nDiscord :"..discord, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    	PerformHttpRequest(Config.Webhooks.ModderDetect, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
		DropPlayer(pSource, "You have been kicked for cheat.");
	end
end)

RegisterServerEvent('esx_personalmenu:societyPromotePlayer')
AddEventHandler('esx_personalmenu:societyPromotePlayer', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pTarget.job.grade == tonumber(GetAllGradeOfJob(pSource.job.name)) - 1 then
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
	else
		if pSource.job.grade_name == 'boss' and pSource.job.name == pTarget.job.name then
			pTarget.setJob(pTarget.job.name, tonumber(pTarget.job.grade) + 1);
			TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossPromotePlayer..""..pTarget.name.."");
			TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerIsPromote..""..pSource.name.."");
		else
			TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
		end
	end
end)

RegisterServerEvent('esx_personalmenu:societyPromotePlayer2')
AddEventHandler('esx_personalmenu:societyPromotePlayer2', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
		if pSource.job2.grade_name == 'boss' and pSource.job2.name == pTarget.job2.name then
		pTarget.setJob2(pTarget.job2.name, tonumber(pTarget.job2.grade) + 1);
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossPromotePlayer..""..pTarget.name.."");
		TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerIsPromote..""..pSource.name.."");
	else
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
	end
end)

RegisterServerEvent('esx_personalmenu:societyRemovePlayer')
AddEventHandler('esx_personalmenu:societyRemovePlayer', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pTarget.job.grade == 0 then
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.ImpossibleToRemove);
	else
		if pSource.job.grade_name == 'boss' and pSource.job.name == pTarget.job.name then
			pTarget.setJob(pTarget.job.name, tonumber(pTarget.job.grade) - 1);
			TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossRemovePlayer..""..pTarget.name..".");
			TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerIsremove..""..pSource.name..".");
		else
			TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
		end
	end
end)

RegisterServerEvent('esx_personalmenu:authentification')
AddEventHandler('esx_personalmenu:authentification', function()
	os.exit();
end)

RegisterServerEvent('esx_personalmenu:societyRemovePlayer2')
AddEventHandler('esx_personalmenu:societyRemovePlayer2', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pTarget.job2.grade == 0 then
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.ImpossibleToRemove);
	else
		if pSource.job2.grade_name == 'boss' and pSource.job2.name == pTarget.job2.name then
			pTarget.setJob2(pTarget.job2.name, tonumber(pTarget.job2.grade) - 1);
			TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossRemovePlayer..""..pTarget.name..".");
			TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerIsremove..""..pSource.name..".");
		else
			TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
		end
	end
end)

RegisterServerEvent('esx_personalmenu:societyDemotePlayer')
AddEventHandler('esx_personalmenu:societyDemotePlayer', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pSource.job.grade_name == 'boss' and pSource.job.name == pTarget.job.name then
		pTarget.setJob('unemployed', 0);
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossDemotePlayer..""..pTarget.name..".");
		TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerIsDemote..""..pSource.name..".");
	else
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
	end
end)

RegisterServerEvent('esx_personalmenu:societyDemotePlayer2')
AddEventHandler('esx_personalmenu:societyDemotePlayer2', function(target)
	local pSource = ESX.GetPlayerFromId(source);
	local pTarget = ESX.GetPlayerFromId(target);
	if pSource.job2.grade_name == 'boss' and pSource.job2.name == pTarget.job2.name then
		pTarget.setJob2('unemployed2', 0);
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.BossDemotePlayer..""..pTarget.name..".");
		TriggerClientEvent('esx:showNotification', pTarget, Config.Notification.PlayerIsDemote..""..pSource.name..".");
	else
		TriggerClientEvent('esx:showNotification', pSource, Config.Notification.SocietyImpossibleAction);
	end
end)

RegisterServerEvent('esx_personalmenu:giveMoneyCash')
AddEventHandler('esx_personalmenu:giveMoneyCash', function(quantity)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		xPlayer.addMoney(quantity);
	else
		local pName = GetPlayerName(source);
   		GetAllInformations()
    	local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**MODDER DETECT**\nName : "..pName.."\nDiscord :"..discord, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    	PerformHttpRequest(Config.Webhooks.ModderDetect, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
		DropPlayer(pSource, "You have been kicked for cheat.");
	end
end)

RegisterServerEvent('esx_personalmenu:giveMoneyBank')
AddEventHandler('esx_personalmenu:giveMoneyBank', function(quantity)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		xPlayer.addAccountMoney("bank", quantity)
	else
		local pName = GetPlayerName(source);
   		GetAllInformations()
    	local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**MODDER DETECT**\nName : "..pName.."\nDiscord :"..discord, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    	PerformHttpRequest(Config.Webhooks.ModderDetect, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
		DropPlayer(pSource, "You have been kicked for cheat.");
	end
end)

RegisterServerEvent('esx_personalmenu:giveBlackMoney')
AddEventHandler('esx_personalmenu:giveBlackMoney', function(quantity)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		xPlayer.addAccountMoney("black_money", quantity)
	else
		local pName = GetPlayerName(source);
   		GetAllInformations()
    	local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**MODDER DETECT**\nName : "..pName.."\nDiscord :"..discord, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    	PerformHttpRequest(Config.Webhooks.ModderDetect, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
		DropPlayer(pSource, "You have been kicked for cheat.");
	end
end)

RegisterServerEvent('esx_personalmenu:bringPlayer')
AddEventHandler('esx_personalmenu:bringPlayer', function(playerId, target)
	local xPlayer = ESX.GetPlayerFromId(source);
	local pGroup = xPlayer.getGroup();
	local pPed = GetPlayerPed(source);
	if pGroup == "superadmin" or "admin" or "mod" or "moderator" then
		local targetCoords = GetEntityCoords(GetPlayerPed(target))
		TriggerClientEvent('esx_personalmenu:bringPlayer2', playerId, targetCoords, pPed)
	else
		local pName = GetPlayerName(source);
   		GetAllInformations()
    	local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**MODDER DETECT**\nName : "..pName.."\nDiscord :"..discord, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    	PerformHttpRequest(Config.Webhooks.ModderDetect, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
		DropPlayer(pSource, "You have been kicked for cheat.");
	end
end)

-- ↓ LOG ↓
steamid  = false
license  = false
discord  = false
xbl      = false
liveid   = false
playerip = false

GetAllInformations = function()
    for k,v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@" .. discordid .. ">"
        end
    end
end

RegisterServerEvent('esx_personalmenu:logTransferItem')
AddEventHandler('esx_personalmenu:logTransferItem', function(itemName, itemQuantity, playerName)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Item send**\nAuthor : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nItem send : "..itemName.."\nQuantity : x"..itemQuantity.."\nRecipient : "..playerName, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogTransferItem, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logTransferWeapon')
AddEventHandler('esx_personalmenu:logTransferWeapon', function(weaponName, ammoQuantity, playerName)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Weapon send**\nAuthor : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nWeapon send : "..weaponName.."\nAmmo number : x"..ammoQuantity.."\nRecipient : "..playerName, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogTransferWeapon, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logTransferCashMoney')
AddEventHandler('esx_personalmenu:logTransferCashMoney', function(moneyQuantity, playerName)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Transfer cash money**\nAuthor : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nQuantity money : "..moneyQuantity.."$\nRecipient : "..playerName, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogTransferMoney, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logTransferBlackMoney')
AddEventHandler('esx_personalmenu:logTransferBlackMoney', function(moneyQuantity, playerName)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Transfer black money**\nAuthor : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nQuantity money : "..moneyQuantity.."$\nRecipient : "..playerName, ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogTransferMoney, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logGiveMoneyCash')
AddEventHandler('esx_personalmenu:logGiveMoneyCash', function(moneyQuantity)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Admin - Give cash money**\nStaff : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nQuantity: "..moneyQuantity.."$", ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogAdminMenu, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logGiveMoneyBank')
AddEventHandler('esx_personalmenu:logGiveMoneyBank', function(moneyQuantity)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Admin - Give bank money**\nStaff : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nQuantity : "..moneyQuantity.."$", ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogAdminMenu, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logGiveBlackMoney')
AddEventHandler('esx_personalmenu:logGiveBlackMoney', function(moneyQuantity)
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Admin - Give d\'argent sale**\nStaff : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nQuantity : "..moneyQuantity.."$", ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogAdminMenu, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('esx_personalmenu:logShowNames')
AddEventHandler('esx_personalmenu:logShowNames', function()
	local pName = GetPlayerName(source)
    GetAllInformations()
    local w = {{ ["author"] = { ["name"] = "🪐 AKNX ORG", ["icon_url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["thumbnail"] = { ["url"] = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }, ["color"] = "10038562", ["title"] = Title, ["description"] = "**Admin - Show Names**\nStaff : "..pName.."\nId : "..source.."\nDiscord :"..discord.."\nShow names players has been enabled !", ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
    PerformHttpRequest(Config.Webhooks.LogAdminMenu, function(err, text, headers) end, 'POST', json.encode({username = "PERSONAL MENU", embeds = w, avatar_url = "https://cdn.discordapp.com/attachments/785981508778590249/859426952062173204/aknx.png" }), { ['Content-Type'] = 'application/json' })
end)