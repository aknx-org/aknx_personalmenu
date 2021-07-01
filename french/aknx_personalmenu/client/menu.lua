self = {
	weaponSelected    = {},
    itemSelected      = {},
    WeaponData        = {},
    black_money       = nil,
    billing_table = {},
    headClothesIndex  = 1,
    actionsLicenseIndex = 1,
    actionsLicenseList = { "Regarder mon permis de conduire", "Montrer mon permis de conduire", "Regarder mon permis d\'armes", "Montrer mon permis d\'armes" },
    clothesHeadList   = { "Chapeau/Casque", "Masque", "Oreilles", "Lunettes" },
    hightClothesIndex = 1,
    clothesHightList  = { "Haut", "Gilet Par Balles", "Sac", "Bras", "Montre", "Bracelet", "Chaines", "Calques" },
    downClothesIndex  = 1,
    clothesDownList   = { "Pantalon", "Chaussures" },
    windowVehIndex = 1,
    windowVehList = { "Ouvrir", "Fermer" },
    doorStatusIndex = 1,
    doorStatusList = { "Ouvrir", "Fermer" },
    doorOpenIndex = 1,
    doorOpenList = { "Avant Droit", "Avant Gauche", "Arrière Droit", "Arrière Gauche" },
    doorCloseIndex = 1,
    doorCloseList = { "Avant Droit", "Avant Gauche", "Arrière Droit", "Arrière Gauche" },
    hoodVehIndex = 1,
    hoodVehList = { "Ouvrir", "Fermer" },
    trunkVehIndex = 1,
    trunkVehList = { "Ouvrir", "Fermer" },
    societyIndex = 1,
    societyList = { '~g~Recruter~s~', '~g~Promouvoir~s~', '~r~Destituer~s~', '~r~Virer~s~' },
    societyIndex2 = 1,
    societyList2 = { '~g~Recruter~s~', '~g~Promouvoir~s~', '~r~Destituer~s~', '~r~Virer~s~' },
    InStaff = false,
    playersList = {},
    playersInZone = false,
    activeNoclip = false,
    noclipSpeed = 1.0,
    noclipC = false,
    noclipCollision = false,
    ghostMod = false,
    tpIndex = 1,
    tpList = { "Tp sur joueur", "Tp sur marker" },
    giveIndex = 1,
    giveList = { "Cash", "Banque", "Sale" },
    showNames = false,
    gamerTags = {},
    vehicleAdminIndex = 1,
    vehicleAdminList = {"Spawn un véhicule", "Réparer le véhicule", "Retourner le véhicule" },
};

openF5Menu = false;
RMenu.Add('personal_menu', 'main_menu', RageUI.CreateMenu(Config.YourServerName, Config.DescriptionMenu));
RMenu.Add('personal_menu', 'inventory_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleInventoryMenu, Traduction.DescriptionInventoryMenu));
RMenu.Add('personal_menu', 'inventory_use', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'inventory_menu'), Traduction.TitleInventoryUseMenu, Traduction.DescriptionUseInventoryMenu));
RMenu.Add('personal_menu', 'weapon_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleWeaponMenu, Traduction.DescriptionWeaponMenu));
RMenu.Add('personal_menu', 'weapon_use', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'weapon_menu'), Traduction.TitleWeaponUseMenu, Traduction.DescriptionUseWeaponMenu));
RMenu.Add('personal_menu', 'wallet_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleWalletMenu, Traduction.DescriptionWalletMenu));
RMenu.Add('personal_menu', 'moneycash_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'wallet_menu'), Traduction.TitleMoneyCashMenu, Traduction.DescriptionMoneyCashMenu));
RMenu.Add('personal_menu', 'blackmoney_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'wallet_menu'), Traduction.TitleBlackMoneyMenu, Traduction.DescriptionBlackMoneyMenu));
RMenu.Add('personal_menu', 'billing_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleBillingMenu, Traduction.DescriptionBillingMenu));
RMenu.Add('personal_menu', 'clothes_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleClothesMenu, Traduction.DescriptionClothesMenu));
RMenu.Add('personal_menu', 'animations_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleAnimationsMenu, Traduction.DescriptionAnimationsMenu));
RMenu.Add('personal_menu', 'animations_walk_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'animations_menu'), Traduction.TitleAnimationsWalkMenu, Traduction.DescriptionAnimationsWalkMenu));
RMenu.Add('personal_menu', 'animations_face_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'animations_menu'), Traduction.TitleAnimationsFaceMenu, Traduction.DescriptionAnimationsFaceMenu));
RMenu.Add('personal_menu', 'vehicle_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleVehicleMenu, Traduction.DescriptionVehicleMenu));
RMenu.Add('personal_menu', 'vehicle_limiter_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'vehicle_menu'), Traduction.TitleVehicleLimiterMenu, Traduction.DescriptionVehicleLimiterMenu));
RMenu.Add('personal_menu', 'vehicle_doors_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'vehicle_menu'), Traduction.TitleVehicleDoorsMenu, Traduction.DescriptionVehicleDoorsMenu));
RMenu.Add('personal_menu', 'society_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleSocietyMenu, Traduction.DescriptionSocietyMenu));
RMenu.Add('personal_menu', 'admin_menu', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'main_menu'), Traduction.TitleAdminMenu, Traduction.DescriptionAdminMenu));
RMenu.Add('personal_menu', 'admin_menu_divers', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'admin_menu'), Traduction.TitleAdminDiversMenu, Traduction.DescriptionAdminDiversMenu));
RMenu.Add('personal_menu', 'admin_menu_vehicles', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'admin_menu'), Traduction.TitleAdminVehicleMenu, Traduction.DescriptionAdminVehicleMenu));
RMenu.Add('personal_menu', 'admin_menu_list', RageUI.CreateSubMenu(RMenu:Get('personal_menu', 'admin_menu'), Traduction.TitleAdminListMenu, Traduction.DescriptionAdminListMenu));
RMenu:Get('personal_menu', 'main_menu').Closed = function()
	openF5Menu = false;
end

function openPersonalMenu()
    if openF5Menu then
        openF5Menu = false
    else
        openF5Menu = true
        RageUI.Visible(RMenu:Get('personal_menu', 'main_menu'), true);
        Citizen.CreateThread(function()
            while openF5Menu do
                Citizen.Wait(1);
                RageUI.IsVisible(RMenu:Get('personal_menu', 'main_menu'), true, true, true, function()
                    if Config.EnableInventory then
                        RageUI.ButtonWithStyle(Traduction.InventoryButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                            if s then
                                ESX.PlayerData = ESX.GetPlayerData()
                            end
                        end, RMenu:Get('personal_menu', 'inventory_menu'));
                    end
                    if Config.EnableWeaponGestion then
                        RageUI.ButtonWithStyle(Traduction.WeaponGestionButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('personal_menu', 'weapon_menu'));
                    end
                    if Config.EnableWallet then
                        RageUI.ButtonWithStyle(Traduction.WalletButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('personal_menu', 'wallet_menu'));
                    end
                    if Config.EnableBilling then
                        RageUI.ButtonWithStyle(Traduction.BillingButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('personal_menu', 'billing_menu'));
                    end
                    if Config.EnableClothes then
                        RageUI.ButtonWithStyle(Traduction.ClothesButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('personal_menu', 'clothes_menu'));
                    end
                    if Config.EnableAnimations then
                        RageUI.ButtonWithStyle(Traduction.AnimationsButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                            if s then
                            end
                        end, RMenu:Get('personal_menu', 'animations_menu'));
                    end
                    if Config.EnableVehicleGestion then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            RageUI.ButtonWithStyle(Traduction.VehicleButtonTitle, nil, {RightLabel = "→"},true, function(_,_,s)
                                if s then
                                end
                            end, RMenu:Get('personal_menu', 'vehicle_menu'));
                        else
                            RageUI.ButtonWithStyle(Traduction.VehicleButtonTitle, nil, {RightBadge = RageUI.BadgeStyle.Lock}, false, function()
                            end)
                        end
                    end
                    if Config.EnableSociety then
                        if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job2.grade_name == 'boss' then
                            RageUI.ButtonWithStyle(Traduction.SocietyButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                                if s then
                                end
                            end, RMenu:Get('personal_menu', 'society_menu'));
                        else
                            RageUI.ButtonWithStyle(Traduction.SocietyButtonTitle, nil, {RightBadge = RageUI.BadgeStyle.Lock}, false, function()
                            end)
                        end
                        if Config.EnableAdmin then
                            RageUI.ButtonWithStyle(Traduction.AdminButtonTitle, nil, {RightLabel = "→"}, access_admin_menu, function()
                            end, RMenu:Get('personal_menu', 'admin_menu'));
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'inventory_menu'), true, true, true, function()
                    RageUI.Separator(Traduction.InventorySeparatorTitle);
                    ESX.PlayerData = ESX.GetPlayerData();
                    for i = 1, #ESX.PlayerData.inventory do
                        if ESX.PlayerData.inventory[i].count > 0 then
                            RageUI.ButtonWithStyle(ESX.PlayerData.inventory[i].label.." (x"..ESX.PlayerData.inventory[i].count..")", nil, {RightLabel = "→→"}, true, function(_,_,s) 
                                if s then
                                    self.itemSelected = ESX.PlayerData.inventory[i];
                                end
                            end, RMenu:Get('personal_menu', 'inventory_use'));
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'inventory_use'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.UseButtonTitle, nil, {RightLabel = "→→"}, true, function(_,_,s)
                        if s then
                            if self.itemSelected.usable then
                                TriggerServerEvent('esx:useItem', self.itemSelected.name);
                                Citizen.Wait(150);
                                RageUI:GoBack();
                                if Config.EnableNotification then
                                    ESX.ShowNotification(Config.Notification.UseItem..""..self.itemSelected.label..""..Config.Notification.AddPointInNotif, true, true, 50);
                                end
                            else
                                if Config.EnableNotification then
                                    ESX.ShowNotification(Config.Notification.ItemNotUsable, true, true, 50);
                                end
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.SendButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if a then
                            PlayerMarker();
                        end
                        if s then
                            local quantity = KeyboardInput('Quantité de '..self.itemSelected.label..' à donner :', "", 25);
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                            if tonumber(quantity) then
                                if closestDistance ~= -1 and closestDistance <= 3 then
                                    local cPed = GetPlayerPed(closestPlayer);
                                    if IsPedOnFoot(cPed) then
                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', self.itemSelected.name, tonumber(quantity));
                                        Citizen.Wait(150);
                                        RageUI:GoBack();
                                        ESX.ShowNotification(Config.Notification.TransferItem..""..quantity.." ~b~"..self.itemSelected.label.." ~s~à ~p~"..GetPlayerName(closestPlayer), true, true, 50);
                                        TriggerServerEvent('esx_personalmenu:logTransferItem', self.itemSelected.name, quantity, GetPlayerName(closestPlayer));
                                    else
                                        ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                    end
                                else
                                    ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                end
                            else
                                ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                            end
                        end
                    end)
                    if Config.CanDropItem then
                        RageUI.ButtonWithStyle(Traduction.DropButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                            if s then
                                local quantity = KeyboardInput('Quantité de '..self.itemSelected.label..' à jeter :', "", 25);
                                if tonumber(quantity) then
                                    if IsPedOnFoot(PlayerPedId()) then
                                        TriggerServerEvent('esx:removeInventoryItem', 'item_standard', self.itemSelected.name, tonumber(quantity));
                                        ESX.ShowNotification(Config.Notification.DropItem..""..tonumber(quantity).." ~b~"..self.itemSelected.label..".", true, true, 50);
                                        Citizen.Wait(150);
                                        RageUI:GoBack();
                                    else
                                        ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                    end
                                else
                                    ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                                end
                            end
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'weapon_menu'), true, true, true, function()
                    RageUI.Separator(Traduction.WeaponSeparatorTitle);
                    for i = 1, #self.WeaponData, 1 do
                        if HasPedGotWeapon(PlayerPedId(), self.WeaponData[i].hash, false) then
                            local ammo = GetAmmoInPedWeapon(PlayerPedId(), self.WeaponData[i].hash);
                            RageUI.ButtonWithStyle(self.WeaponData[i].label.." [" ..ammo.."]", nil, {RightLabel = "→→"}, true, function(_,_,s)
                                if s then
                                    self.weaponSelected = self.WeaponData[i];
                                end
                            end, RMenu:Get('personal_menu', 'weapon_use'));
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'weapon_use'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.SendWeaponButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if a then
                            PlayerMarker();
                        end
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                            if closestDistance ~= -1 and closestDistance <= 3 then
                                local cPed = GetPlayerPed(closestPlayer);
                                if IsPedOnFoot(cPed) then
                                    local weapon_ammo = GetAmmoInPedWeapon(PlayerPedId(), self.weaponSelected.hash)
                                    TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_weapon', self.weaponSelected.name, weapon_ammo);
                                    TriggerServerEvent('esx_personalmenu:logTransferWeapon', self.weaponSelected.name, weapon_ammo, GetPlayerName(closestPlayer));
                                    if Config.EnableNotification then
                                        ESX.ShowNotification(Config.Notification.SendWeapon.." x1 "..self.weaponSelected.label.." a "..GetPlayerName(closestPlayer), true, true, 50);
                                    end
                                    Citizen.Wait(150);
                                    RageUI:GoBack();
                                else
                                    ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                end
                            else
                                ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                            end
                        end
                    end)
                    if Config.CanDropWeapon then
                        RageUI.ButtonWithStyle(Traduction.DropWeaponButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                            if s then
                                if IsPedOnFoot(PlayerPedId()) then
                                    TriggerServerEvent('esx:removeInventoryItem', 'item_weapon', self.weaponSelected.name);
                                    Citizen.Wait(150);
                                    RageUI:GoBack();
                                else
                                    ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                end
                            end
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'wallet_menu'), true, true, true, function()
                    RageUI.Separator(Traduction.JobSeparatorTitle);
                    RageUI.Separator(ESX.PlayerData.job.label.. " - " ..ESX.PlayerData.job.grade_label);
                    if Config.EnableDoubleJob then
                        RageUI.Separator(ESX.PlayerData.job2.label.. " - " ..ESX.PlayerData.job2.grade_label)
                    end
                    RageUI.Separator(Traduction.InformationsWalletSeparatorTitle);
                    RageUI.ButtonWithStyle(Traduction.ShowIdentityCardButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()));
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.ShowIdentityCardToPlayerButtonTitle, nil, {RightLabel = "→→"},true, function(_,a,s)
                        if a then
                            PlayerMarker();
                        end
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer));
                            else
                                ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                            end
                        end
                    end)
                    RageUI.List(Traduction.ActionsLicenseButtonTitle, self.actionsLicenseList, self.actionsLicenseIndex, nil, {}, true, function(_,a,s,i)
                        self.actionsLicenseIndex = i;
                        if a then
                            if i == 1 then
                                if a then
                                    PlayerMarker();
                                end
                                if s then
                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver');
                                end
                            else
                                if i == 2 then
                                    if s then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver');
                                        else
                                            ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                        end
                                    end
                                else
                                    if i == 3 then
                                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon');
                                    else
                                        if i == 4 then
                                            if a then
                                                PlayerMarker();
                                            end
                                            if s then
                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                                if closestDistance ~= -1 and closestDistance <= 3.0 then
                                                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon');
                                                else
                                                    ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)

                    RageUI.Separator(Traduction.WalletMoneySeparatorTitle);
                    RageUI.ButtonWithStyle(Traduction.MoneyCashButtonTitle, nil, {RightLabel = "~g~"..ESX.Math.GroupDigits(ESX.PlayerData.money.."$ ~s~→")}, true, function(_,a,s)
                        if s then 
                        end
                    end, RMenu:Get('personal_menu', 'moneycash_menu'))
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'bank'  then
                            self.black_money = RageUI.ButtonWithStyle(Traduction.MoneyBankButtonTitle, nil, {RightLabel = "~b~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."$")}, true, function()
                            end)
                        end
                    end
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'black_money'  then
                            self.black_money = RageUI.ButtonWithStyle(Traduction.BlackMoneyButtonTitle, nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."$ ~s~→")}, true, function(h,a,s)
                                if s then 
                                end 
                            end, RMenu:Get('personal_menu', 'blackmoney_menu'));
                        end
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'moneycash_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.SendMoneyCashButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if a then
                            PlayerMarker();
                        end
                        if s then
                            local quantity = KeyboardInput(Config.Keyboard.SendCashMoney, "", 25)
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                            if tonumber(quantity) then
                                if closestDistance ~= -1 and closestDistance <= 3 then
                                    local cPed = GetPlayerPed(closestPlayer)
                                    if IsPedOnFoot(cPed) then
                                        TriggerServerEvent('esx_personalmenu:TransferCashMoney', GetPlayerServerId(closestPlayer), tonumber(quantity));
                                        Citizen.Wait(150);
                                        RageUI:GoBack();
                                        TriggerServerEvent('esx_personalmenu:logTransferCashMoney', tonumber(quantity), GetPlayerName(closestPlayer));
                                    else
                                        ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                    end
                                else
                                    ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                end
                            else
                                ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.DropMoneyCashButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if s then
                            local quantity = KeyboardInput(Config.Keyboard.DropCashMoney, "", 25);
                            if tonumber(quantity) then
                                if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                    TriggerServerEvent('esx:removeInventoryItem', 'item_money', 'money', tonumber(quantity));
                                    Citizen.Wait(150);
                                    RageUI:GoBack();
                                else
                                    ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                end
                            else
                                ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                            end
                        end
                    end)
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'blackmoney_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.SendBlackMoneyCashButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if a then
                            PlayerMarker();
                        end
                        if s then
                            local quantity = KeyboardInput(Config.Keyboard.SendBlackMoney, "", 25);
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                            if tonumber(quantity) then
                                if closestDistance ~= -1 and closestDistance <= 3 then
                                    local cPed = GetPlayerPed(closestPlayer)
                                    if IsPedOnFoot(cPed) then
                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', 'black_money', tonumber(quantity));
                                        Citizen.Wait(150);
                                        RageUI:GoBack();
                                        TriggerServerEvent('esx_personalmenu:logTransferBlackMoney', quantity, GetPlayerName(closestPlayer));
                                    else
                                        ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                    end
                                else
                                    ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                end
                            else
                                ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.DropBlackMoneyCashButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if s then
                            local quantity = KeyboardInput(Config.Keyboard.DropBlackMoney, "", 25);
                            if tonumber(quantity) then
                                if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                    TriggerServerEvent('esx:removeInventoryItem', 'item_account', 'black_money', tonumber(quantity));
                                    Citizen.Wait(150);
                                    RageUI:GoBack();
                                else
                                    ESX.ShowNotification(Config.Notification.ActionNotPossibleInVehicle, true, true, 50);
                                end
                            else
                                ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                            end
                        end
                    end)
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'billing_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.RefreshBillingButtonTitle, nil, {RightLabel = "→→"}, true, function(_,_,s)
                        if s then
                            ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
                                self.billing_table = bills;
                            end)
                        end
                    end)
                    if #self.billing_table == 0 then
                        RageUI.Separator("") RageUI.Separator(Traduction.NotBillingButtonTitle) RageUI.Separator("")
                    end
                    for i = 1, #self.billing_table, 1 do
                        RageUI.ButtonWithStyle(self.billing_table[i].label, nil, {RightLabel = '[~b~$' .. ESX.Math.GroupDigits(self.billing_table[i].amount.."~s~] →")}, true, function(_,_,s)
                            if s then
                                ESX.TriggerServerCallback('esx_billing:payBill', function()
                                    ESX.TriggerServerCallback('esx_billing:getBills', function(bills) self.billing_table = bills end)
                                end, self.billing_table[i].id);
                            end
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'clothes_menu'), true, true, true, function()
                    RageUI.Separator(Traduction.HeadSeparatorTitle)
                    RageUI.List("Actions", self.clothesHeadList, self.headClothesIndex, nil, {}, true, function(_,a,s,i)
                        self.headClothesIndex = i;
                        if a then
                            if i == 1 then
                                if s then
                                    startAnimation('missheist_agency2ahelmet', 'take_off_helmet_stand');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.helmet_1 ~= skin2.helmet_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['helmet_1'] = skin1.helmet_1, ['helmet_2'] = skin1.helmet_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['helmet_1'] = -1, ['helmet_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 2 then
                                if s then
                                    startAnimation('mp_masks@standard_car@ds@', 'put_on_mask');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.mask_1 ~= skin2.mask_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['mask_1'] = skin1.mask_1, ['mask_2'] = skin1.mask_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['mask_1'] = 0, ['mask_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 3 then
                                if s then
                                    startAnimation('mp_cp_stolen_tut', 'b_think');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.ears_1 ~= skin2.ears_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['ears_1'] = skin1.ears_1, ['ears_2'] = skin1.ears_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['ears_1'] = -1, ['ears_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 4 then
                                if s then
                                    startAnimation('clothingspecs', 'take_off');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.glasses_1 ~= skin2.glasses_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['glasses_1'] = skin1.glasses_1, ['glasses_2'] = skin1.glasses_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['glasses_1'] = 0, ['glasses_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            end
                        end -- dégeulasse, mais je met les if i then sous le else, sinon ça cais des grosses zigzag dégeulasses avec tout les index qui y'a
                        end
                        end
                        end
                    end)
                    RageUI.Separator(Traduction.HightSeparatorTitle)
                    RageUI.List("Actions", self.clothesHightList, self.hightClothesIndex, nil, {}, true, function(_,a,s,i)
                        self.hightClothesIndex = i;
                        if a then
                            if i == 1 then
                                if s then
                                    startAnimation('clothingtie', 'try_tie_negative_a');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.torso_1 ~= skin2.torso_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['tshirt_1'] = skin1.tshirt_1, ['tshirt_2'] = skin1.tshirt_2, ['torso_1'] = skin1.torso_1, ['torso_2'] = skin1.torso_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['tshirt_1'] = 15, ['tshirt_2'] = 0, ['torso_1'] = 15, ['torso_2'] = 0, ['arms'] = 15});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 2 then
                                if s then
                                    startAnimation('clothingtie', 'try_tie_negative_a');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.bproof_1 ~= skin2.bproof_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['bproof_1'] = skin1.bproof_1, ['bproof_2'] = skin1.bproof_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['bproof_1'] = 0, ['bproof_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 3 then
                                if s then
                                    startAnimation('anim@heists@ornate_bank@grab_cash', 'intro');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.bags_1 ~= skin2.bags_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['bags_1'] = skin1.bags_1, ['bags_2'] = skin1.bags_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['bags_1'] = 0, ['bags_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 4 then
                                if s then
                                    startAnimation('missmic4', 'michael_tux_fidget');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.arms ~= skin2.arms then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['arms'] = skin1.arms});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['arms'] = 15});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 5 then
                                if s then
                                    startAnimation('nmt_3_rcm-10', 'cs_nigel_dual-10');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.watches_1 ~= skin2.watches_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['watches_1'] = skin1.watches_1, ['watches_2'] = skin1.watches_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['watches_1'] = -1, ['watches_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 6 then
                                if s then
                                    startAnimation('nmt_3_rcm-10', 'cs_nigel_dual-10');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.bracelets_1 ~= skin2.bracelets_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['bracelets_1'] = skin1.bracelets_1, ['bracelets_2'] = skin1.bracelets_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['bracelets_1'] = -1, ['bracelets_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                                else
                                if i == 7 then
                                    if s then
                                        startAnimation('clothingtie', 'try_tie_positive_a');
                                        Citizen.Wait(1000);
                                        ClearPedTasks(PlayerPedId());
                                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                            TriggerEvent('skinchanger:getSkin', function(skin2)
                                                if skin1.chain_1 ~= skin2.chain_1 then
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['chain_1'] = skin1.chain_1, ['chain_2'] = skin1.chain_2});
                                                else
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['chain_1'] = -1, ['chain_2'] = 0});
                                                end
                                            end)
                                        end)
                                    end
                                else
                                if i == 8 then
                                    if s then
                                        startAnimation('clothingtie', 'try_tie_negative_a');
                                        Citizen.Wait(1000);
                                        ClearPedTasks(PlayerPedId());
                                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                            TriggerEvent('skinchanger:getSkin', function(skin2)
                                                if skin1.decals_1 ~= skin2.decals_1 then
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['decals_1'] = skin1.decals_1, ['decals_2'] = skin1.decals_2});
                                                else
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['decals_1'] = -1, ['decals_2'] = 0});
                                                end
                                            end)
                                        end)
                                    end
                                end
                            end
                        end -- dégeulasse, mais je met les if i then sous le else, sinon ça cais des grosses zigzag dégeulasses avec tout les index qui y'a
                        end
                        end
                        end
                        end
                        end
                        end
                    end)
                    RageUI.Separator(Traduction.DownSeparatorTitle)
                    RageUI.List("Actions", self.clothesDownList, self.downClothesIndex, nil, {}, true, function(_,a,s,i)
                        self.downClothesIndex = i;
                        if a then
                            if i == 1 then
                                if s then
                                    startAnimation('re@construction', 'out_of_breath');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.pants_1 ~= skin2.pants_1 then
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['pants_1'] = skin1.pants_1, ['pants_2'] = skin1.pants_2});
                                            else
                                                TriggerEvent('skinchanger:loadClothes', skin2, {['pants_1'] = 14, ['pants_2'] = 0});
                                            end
                                        end)
                                    end)
                                end
                            else
                            if i == 2 then
                                if s then
                                    startAnimation('random@domestic', 'pickup_low');
                                    Citizen.Wait(1000);
                                    ClearPedTasks(PlayerPedId());
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin1)
                                        TriggerEvent('skinchanger:getSkin', function(skin2)
                                            if skin1.sex == 0 then
                                                if skin1.shoes_1 ~= skin2.shoes_1 then
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['shoes_1'] = skin1.shoes_1, ['shoes_2'] = skin1.shoes_2});
                                                else
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['shoes_1'] = 34, ['shoes_2'] = 0});
                                                end
                                            else
                                                if skin1.shoes_1 ~= skin2.shoes_1 then
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['shoes_1'] = skin1.shoes_1, ['shoes_2'] = skin1.shoes_2});
                                                else
                                                    TriggerEvent('skinchanger:loadClothes', skin2, {['shoes_1'] = 35, ['shoes_2'] = 0});
                                                end
                                            end
                                        end)
                                    end)
                                end
                            end
                        end -- dégeulasse, mais je met les if i then sous le else, sinon ça cais des grosses zigzag dégeulasses avec tout les index qui y'a
                        end
                    end)
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'animations_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.WalkButtonTitle, nil, {RightLabel = "→"}, true, function(_,a,s)
                        if s then
                        end
                    end, RMenu:Get('personal_menu', 'animations_walk_menu'))
                    RageUI.ButtonWithStyle(Traduction.FaceExpressionsButtonTitle, nil, {RightLabel = "→"}, true, function(_,a,s)
                        if s then
                        end
                    end, RMenu:Get('personal_menu', 'animations_face_menu'))
                    if Config.HaveDpEmotes then
                        RageUI.ButtonWithStyle(Traduction.OpenAnimationButtonTitle, nil, {RightLabel = "→"}, true, function(_,a,s)
                            if s then
                                RageUI.CloseAll();
                                ExecuteCommand("emotemenu");
                                print("dpemotes requis"); -- à enlever si vous voulez
                            end
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'animations_walk_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.ResetWalkButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if s then
                            ResetPedMovementClipset(PlayerPedId());
                        end
                    end)
                    for k,v in pairs(Config.WalksAnimation) do
                        RageUI.ButtonWithStyle(k, nil, {RightLabel = "→→"}, true, function(_,a,s)
                            if s then
                                RequestAnimSet(v);
                                while not HasAnimSetLoaded(v) do Citizen.Wait(10) end
                                SetPedMovementClipset(PlayerPedId(), v);
                            end
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'animations_face_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.ResetFaceExpressionButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if s then
                            ClearFacialIdleAnimOverride(PlayerPedId());
                        end
                    end)
                    for k,v in pairs(Config.ExpressionAnimation) do
                        RageUI.ButtonWithStyle(k, nil, {RightLabel = "→→"}, true, function(_,a,s)
                            if s then
                                SetFacialIdleAnimOverride(PlayerPedId(), v, 0);
                            end
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'vehicle_menu'), true, true, true, function()
                    RageUI.Checkbox(Traduction.VehicleEngineButtonTitle, nil, checkbox,{},function(_,_,s,c)
                        if s then
                            checkbox = c
                            if c then
                                c = true
                                SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), 0), 0, 0, 1);
                                SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId(), 0), 1);
                            else
                                c = false
                                SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), 0), 1, 0, 1);
                                SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId(), 0), 0);
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.LimiterVehButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                        if s then
                        end
                    end, RMenu:Get('personal_menu', 'vehicle_limiter_menu'))
                    RageUI.ButtonWithStyle(Traduction.DoorsVehButtonTitle, nil, {RightLabel = "→"}, true, function(_,_,s)
                        if s then
                        end
                    end, RMenu:Get('personal_menu', 'vehicle_doors_menu'))
                    RageUI.List(Traduction.WindowVehListTitle, self.windowVehList, self.windowVehIndex, nil, {}, true, function(_,a,s,index)
                        self.windowVehIndex = index;
                        if a then
                            if index == 1 then
                                if s then
                                    RollDownWindows(GetVehiclePedIsIn(PlayerPedId(), true));
                                end
                            else
                                if index == 2 then
                                    if s then
                                        for i = 0,7,1 do
                                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), true), i);
                                            FixVehicleWindow(GetVehiclePedIsIn(PlayerPedId(), true), i);
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    if GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*3.6 < 1.0 then
                        RageUI.ButtonWithStyle(Traduction.ExitVehicleButtonTitle, nil, {}, true, function(_,_,s)
                            if s then
                                local pCoords = GetEntityCoords(PlayerPedId());
                                SetEntityCoords(PlayerPedId(), pCoords.x, pCoords.y, pCoords.z+0.5); -- 200 qi Akashi ?
                                RageUI:GoBack();
                            end
                        end)
                    else
                        RageUI.ButtonWithStyle(Traduction.ExitVehicleButtonTitle, nil, {}, false, function()
                        end)
                    end
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'vehicle_limiter_menu'), true, true, true, function()
                    RageUI.ButtonWithStyle(Traduction.LimitatorDefault, nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 1000.0/3.6);
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.Limitator30km , nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 30.0/3.6);
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.Limitator50km, nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 50.0/3.6);
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.Limitator80km, nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 80.0/3.6);
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.Limitator120km, nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 120.0/3.6);
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.Limitator150km, nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 150.0/3.6);
                        end
                    end)
                    RageUI.ButtonWithStyle(Traduction.Limitator180km, nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(_,_,s)
                        if s then
                            SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 180.0/3.6);
                        end
                    end)
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'vehicle_doors_menu'), true, true, true, function()
                    RageUI.List(Traduction.ActionOnAllDoors, self.doorStatusList, self.doorStatusIndex, nil, {RightLabel = nil}, true, function(_,_,s,i)
                        self.doorStatusIndex = i;
                        if s then
                            if i == 1 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 0, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 1, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 2, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 3, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 4, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 5, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 6, 0, 0);
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 7, 0, 0);
                            elseif i == 2 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 0, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 1, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 2, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 3, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 4, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 5, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 6, 0, 0);
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 7, 0, 0);
                            end
                        end
                    end)
                    RageUI.List(Traduction.OpenDoorsButtonTitle, self.doorOpenList, self.doorOpenIndex, nil, {RightLabel = nil}, true, function(_,a,s,i)
                        self.doorOpenIndex = i;
                        if s then
                            if i == 1 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 1, 0, 0);
                            elseif i == 2 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 0, 0, 0);
                            elseif i == 3 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 3, 0, 0);
                            elseif i == 4 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 2, 0, 0);
                            end
                        end
                    end)
                    RageUI.List(Traduction.CloseDoorsButtonTitle, self.doorCloseList, self.doorCloseIndex, nil, {RightLabel = nil}, true, function(_,_,s,i)
                        self.doorCloseIndex = i;
                        if s then
                            if i == 1 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 1, 0, 0);
                            elseif i == 2 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 0, 0, 0);
                            elseif i == 3 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 3, 0, 0);
                            elseif i == 4 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 2, 0, 0);
                            end
                        end
                    end)
                    RageUI.List(Traduction.ActionsHoodButtonTitle, self.hoodVehList, self.hoodVehIndex, nil, {RightLabel = nil}, true, function(_,_,s,i)
                        self.hoodVehIndex = i;
                        if s then
                            if i == 1 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 4, 0, 0);
                            elseif i == 2 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 4, 0, 0);
                            end
                        end
                    end)
                    RageUI.List(Traduction.ActionsTrunkButtonTitle, self.trunkVehList, self.trunkVehIndex, nil, {RightLabel = nil}, true, function(_,_,s,i)
                        self.trunkVehIndex = i;
                        if s then
                            if i == 1 then
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), 0), 5, 0, 0);
                            elseif i == 2 then
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), 0), 5, 0, 0);
                            end
                        end
                    end)
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'society_menu'), true, true, true, function()
                    if ESX.PlayerData.job.grade_name == 'boss' then
                        RageUI.Separator(Traduction.LegalSocietySeparator)
                        RageUI.List(Traduction.ActionsLegalSocietyTitle, self.societyList, self.societyIndex, nil, {}, true, function(_,a,s,i)
                            self.societyIndex = i;
                            if a then
                                if i == 1 then
                                    if a then
                                        PlayerMarker();
                                    end
                                    if s then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                            ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                        else
                                            TriggerServerEvent('esx_personalmenu:societyRecrutePlayer', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0);
                                        end
                                    end
                                else
                                    if i == 2 then
                                        if a then
                                            PlayerMarker();
                                        end
                                        if s then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                            if closestPlayer == -1 or closestDistance > 3.0 then
                                                ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                            else
                                                TriggerServerEvent('esx_personalmenu:societyPromotePlayer', GetPlayerServerId(closestPlayer));
                                            end
                                        end
                                    else
                                        if i == 3 then
                                            if a then
                                                PlayerMarker();
                                            end
                                            if s then
                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                                if closestPlayer == -1 or closestDistance > 3.0 then
                                                    ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                                else
                                                    TriggerServerEvent('esx_personalmenu:societyRemovePlayer', GetPlayerServerId(closestPlayer));
                                                end
                                            end
                                        else
                                            if i == 4 then
                                                if a then
                                                    PlayerMarker();
                                                end
                                                if s then
                                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                                        ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                                    else
                                                        TriggerServerEvent('esx_personalmenu:societyDemotePlayer', GetPlayerServerId(closestPlayer));
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                        RageUI.Separator(Traduction.MoneyLegalSocietySeparator)
                        RageUI.ButtonWithStyle(Traduction.MoneyLegalSocietyButton, nil, { RightLabel = "~g~"..societymoney.."$" }, true,function(h,a,s)
                        end)
                    end
                    if Config.EnableDoubleJob then
                    if ESX.PlayerData.job2.grade_name == 'boss' then
                            RageUI.Separator(Traduction.MoneyIllegalSocietySeparator)
                            RageUI.List(Traduction.ActionsIllegalSocietyTitle, self.societyList2, self.societyIndex2, nil, {}, true, function(_,a,s,i)
                                self.societyIndex2 = i;
                                if a then
                                    if i == 1 then
                                        if a then
                                            PlayerMarker();
                                        end
                                        if s then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                            if closestPlayer == -1 or closestDistance > 3.0 then
                                                ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                            else
                                                TriggerServerEvent('esx_personalmenu:societyRecrutePlayer2', GetPlayerServerId(closestPlayer), ESX.PlayerData.job2.name, 0);
                                            end
                                        end
                                    else
                                        if i == 2 then
                                            if a then
                                                PlayerMarker();
                                            end
                                            if s then
                                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                                if closestPlayer == -1 or closestDistance > 3.0 then
                                                    ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                                else
                                                    TriggerServerEvent('esx_personalmenu:societyPromotePlayer2', GetPlayerServerId(closestPlayer));
                                                end
                                            end
                                        else
                                            if i == 3 then
                                                if a then
                                                    PlayerMarker();
                                                end
                                                if s then
                                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer();
                                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                                        ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                                    else
                                                        TriggerServerEvent('esx_personalmenu:societyRemovePlayer2', GetPlayerServerId(closestPlayer));
                                                    end
                                                end
                                            else
                                                if i == 4 then
                                                    if a then
                                                        PlayerMarker();
                                                    end
                                                    if s then
                                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                                            ESX.ShowNotification(Config.Notification.NoPlayers, true, true, 50);
                                                        else
                                                            TriggerServerEvent('esx_personalmenu:societyDemotePlayer2', GetPlayerServerId(closestPlayer));
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                            RageUI.Separator(Traduction.MoneyIllegalSocietySeparator)
                            RageUI.ButtonWithStyle(Traduction.MoneyIllegalSocietyButton, nil, { RightLabel = "~g~"..societymoney2.."$" }, true,function(h,a,s)
                            end)
                        end
                    end
                end)
                
                RageUI.IsVisible(RMenu:Get('personal_menu', 'admin_menu'), true, true, true, function()
                    RageUI.Checkbox(Traduction.ActiveStaffMod, nil, self.InStaff, { Style = RageUI.CheckboxStyle.Tick }, function(_,s,_,c)
						if s then
                            self.InStaff = c;
							if c then
								self.InStaff = true;
							else
								SetEntityInvincible(PlayerPedId(), 0);
								self.InStaff = false;
								FreezeEntityPosition(PlayerPedId(), 0);
								SetEntityVisible(PlayerPedId(), 1, 0);
								NetworkSetEntityInvisibleToNetwork(PlayerPedId(), 0);
								SetEntityCollision(PlayerPedId(), 1, 1);
							end
						end
					end)
                    RageUI.ButtonWithStyle(Traduction.StaffDiversButtonTitle, nil, { RightLabel = "→" }, self.InStaff, function(_,_,s)
                        if s then
                        end
                    end, RMenu:Get('personal_menu', 'admin_menu_divers'))
                    RageUI.ButtonWithStyle(Traduction.StaffVehicleButtonTitle, nil, { RightLabel = "→" }, self.InStaff, function(_,_,s)
                        if s then
                        end
                    end, RMenu:Get('personal_menu', 'admin_menu_vehicles'))
                    RageUI.ButtonWithStyle(Traduction.PlayersListButtonTitle, nil, { RightLabel = "→" }, self.InStaff, function(_,_,s)
                        if s then
                            TriggerServerEvent('esx_personalmenu:playerListS')
                        end
                    end, RMenu:Get('personal_menu', 'admin_menu_list'))
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'admin_menu_divers'), true, true, true, function()
                    RageUI.Separator(Traduction.PersonalActionSeparator);
                    RageUI.Checkbox(Traduction.NoclipButtonTitle, nil, self.noclipC, { Style = RageUI.CheckboxStyle.Tick }, function(_,s,_,c)
						self.noclipC = c;
						if s then
							if c then
                                self.activeNoclip = true;
                                self.noclipC = true;
								FreezeEntityPosition(PlayerPedId(), 1);
								SetEntityInvincible(PlayerPedId(), 1);
								SetEntityVisible(PlayerPedId(), 0, 0);
							    SetEveryoneIgnorePlayer(PlayerId(), 1);
							    SetPoliceIgnorePlayer(PlayerId(), 1);
                                SetEntityCollision(PlayerPedId(), 0, 0);
							else
                                self.activeNoclip = false;
                                self.noclipC = false;
								SetEntityVisible(PlayerPedId(), 1, 1);
								FreezeEntityPosition(PlayerPedId(), 0);
								SetEntityInvincible(PlayerPedId(), 0);
								NetworkSetEntityInvisibleToNetwork(PlayerId(), 0);
								SetEveryoneIgnorePlayer(PlayerId(), 0);
								SetPoliceIgnorePlayer(PlayerId(), 0);
                                SetEntityCollision(PlayerPedId(), 1, 1);
							end
						end
					end)
                    RageUI.Checkbox(Traduction.GhostmodButtonTitle, nil, self.ghostMod, {}, function(_,_,s,c)
						if s then
							self.ghostMod = c;
							if c then
								SetEntityVisible(PlayerPedId(), 0);
							else
								SetEntityVisible(PlayerPedId(), 1);
							end
						end
					end)
                    RageUI.List(Traduction.TpActionsButtonTitle, self.tpList, self.tpIndex, nil, {}, true, function(_,a,s,i)
                        self.tpIndex = i;
                        if a then
                            if i == 1 then
                                if s then
                                    local player_id = KeyboardInput(Config.Keyboard.AdminPlayerId , "", 10);
                                    if (tonumber(player_id)) then
                                        TriggerServerEvent('esx_personalmenu:bringPlayer', GetPlayerServerId(PlayerId()), player_id)
                                    else
                                        ESX.ShowNotification(Config.Notification.IdIncorrectOrIncorrectFields, true, true, 50);
                                    end
                                end
                            else
                                if i == 2 then
                                    if s then
                                        local blip_on_map = GetFirstBlipInfoId(8)
                                        if DoesBlipExist(blip_on_map) then
                                            Citizen.CreateThread(function()
                                                local blipCoords = GetBlipInfoIdCoord(blip_on_map)
                                                local foundGround, zCoords, zPos = false, -500.0, 0.0
                                                while not foundGround do
                                                    zCoords = zCoords + 10.0
                                                    RequestCollisionAtCoord(blipCoords.x, blipCoords.y, zCoords)
                                                    Citizen.Wait(0)
                                                    foundGround, zPos = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, zCoords)
                                                    if not foundGround and zCoords >= 2000.0 then
                                                        foundGround = true
                                                    end
                                                end
                                                SetPedCoordsKeepVehicle(PlayerPedId(), blipCoords.x, blipCoords.y, zPos)
                                                ESX.ShowNotification(Config.Notification.TpMarkerWithSuccess, true, true, 50);
                                            end)
                                        else
                                            ESX.ShowNotification(Config.Notification.MarkerNotFound, true, true, 50);
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    RageUI.Separator(Traduction.GiveSeparatorTitle);
                    RageUI.List(Traduction.GiveMoneyListTitle, self.giveList, self.giveIndex, nil, {}, true, function(_,a,s,i)
                        self.giveIndex = i;
                        if a then
                            if i == 1 then
                                if s then
                                    local quantity = KeyboardInput(Config.Keyboard.GiveMoneyCash, "", 100);
                                    if (tonumber(quantity)) then
                                        TriggerServerEvent('esx_personalmenu:giveMoneyCash', tonumber(quantity));
                                        TriggerServerEvent('esx_personalmenu:logGiveMoneyCash', tonumber(quantity));
                                    else
                                        ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                                    end
                                end
                            else
                                if i == 2 then
                                    if s then
                                        local quantity = KeyboardInput(Config.Keyboard.GiveMoneyBank , "", 100);
                                        if (tonumber(quantity)) then
                                            TriggerServerEvent('esx_personalmenu:giveMoneyBank', tonumber(quantity));
                                            TriggerServerEvent('esx_personalmenu:logGiveMoneyBank', tonumber(quantity));
                                        else
                                            ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                                        end
                                    end
                                else
                                    if i == 3 then
                                        if s then
                                            local quantity = KeyboardInput(Config.Keyboard.GiveBlackMoney, "", 100);
                                            if (tonumber(quantity)) then
                                                TriggerServerEvent('esx_personalmenu:giveBlackMoney', tonumber(quantity));
                                                TriggerServerEvent('esx_personalmenu:logGiveBlackMoney', tonumber(quantity));
                                            else
                                                ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    RageUI.Separator(Traduction.ShowSeparatorTitle);
                    RageUI.Checkbox(Traduction.ShowNamesButtonTitle, nil, self.showNames, {},function(_,_,s,c)
						if s then
							self.showNames = c;
							if c then
								self.showNames = true;
                                TriggerServerEvent('esx_personalmenu:logShowNames')
							else
								self.showNames = false;
							end
						end
					end)
                    RageUI.ButtonWithStyle(Traduction.PrintCoordsButtonTitle, nil, {RightLabel = "→→"}, true, function(_,_,s)
                        if s then
                            local pCoords = GetEntityCoords(PlayerPedId());
                            local pHeading = GetEntityHeading(PlayerPedId());
                            print(json.encode(pCoords)..", heading : "..pHeading);
                        end
                    end);
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'admin_menu_vehicles'), true, true, true, function()
                    RageUI.Separator(Traduction.MyVehSepratorTitle);
                    RageUI.List(Traduction.ActionsVehicleListTitle, self.vehicleAdminList, self.vehicleAdminIndex, nil, {}, true, function(_,a,s,i)
                        self.vehicleAdminIndex = i;
                        if a then
                            if i == 1 then
                                if s then
                                    local veh_name = KeyboardInput(Config.Keyboard.VehicleNameSpawn, "", 100);
                                    if veh_name ~= nil then
                                        local modelVeh = GetHashKey(veh_name);
                                        RequestModel(modelVeh);
                                        while not HasModelLoaded(modelVeh) do RequestModel(modelVeh) Citizen.Wait(10) end
                                        local pCoords = GetEntityCoords(PlayerPedId());
                                        local createVeh = CreateVehicle(modelVeh, pCoords.x +2.5, pCoords.y + 2.5, pCoords.z, 180.0, true, false);
                                        TaskWarpPedIntoVehicle(PlayerPedId(), createVeh, -1);
                                        ESX.ShowNotification(Config.Notification.VehicleAdminSpawn.." "..veh_name..".", true, true, 50);
                                    else
                                        ESX.ShowNotification(Config.Notification.IncorrectFields, true, true, 50);
                                    end
                                end
                            else
                                if i == 2 then
                                    if s then
                                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                            SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId()));
                                            WashDecalsFromVehicle(GetVehiclePedIsUsing(PlayerPedId()), 1.0);
                                            SetVehicleDirtLevel(GetVehiclePedIsUsing(PlayerPedId()));
                                            ESX.ShowNotification(Config.Notification.VehicleAdminFixed, true, true, 50);
                                        else
                                            ESX.ShowNotification(Config.Notification.IfNotIsInVehicle, true, true, 50);
                                        end
                                    end
                                else
                                    if i == 3 then
                                        if s then
                                            if GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*3.6 > 1.0 then
                                                ESX.ShowNotification(Config.Notification.StopVehicleReturn, true, true, 50);
                                            else
                                                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                                    local pVeh = GetVehiclePedIsIn(PlayerPedId())
                                                    ApplyForceToEntity(pVeh, 3, 0.0, 0.0, 10.5, 360.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                                                else
                                                    ESX.ShowNotification(Config.Notification.IfNotIsInVehicle, true, true, 50);
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    RageUI.Separator(Traduction.DistanceVehicleSeparatorTitle);
                    RageUI.ButtonWithStyle(Traduction.DeleteVehicleButtonTitle, nil, {RightLabel = "→→"}, true, function(_,a,s)
                        if a then
                            local closestVeh = GetClosestVehicle();
                            local posVeh = GetEntityCoords(closestVeh)
                            DrawMarker(21, posVeh.x, posVeh.y, posVeh.z+1.5, 1.0, 0.0, 1.0, 5.0, 0.0, 0.0, 0.35, 0.35, 0.35, 0, 255, 31, 255, 5, 1, 2, 0, nil, nil, 0);
                        end
                        if s then
                            local closestVeh = GetClosestVehicle();
                            if not DoesEntityExist(closestVeh) then 
                                return ESX.ShowNotification(Config.Notification.NotFoundVehicle, true, true, 50);
                            else
                                DeleteVehicleDistance(closestVeh);
                            end 
                        end
                    end);
                end)

                RageUI.IsVisible(RMenu:Get('personal_menu', 'admin_menu_list'), true, true, true, function()
                    RageUI.Checkbox(Traduction.ZoneOnlyButtonTitle, nil, self.playersInZone, {}, function(_,_,_,c)
                        self.playersInZone = c;
                    end)
                    if not self.playersInZone then
                        for k,v in pairs(self.playersList) do
                            RageUI.ButtonWithStyle("["..v.id.."] - "..v.name, nil, {RightLabel = nil}, true, function(_,_,_)
                            end)
                        end
                    else
                        for k,v in pairs(GetActivePlayers()) do
                            RageUI.ButtonWithStyle("["..GetPlayerServerId(v).."] - "..GetPlayerName(v), nil, {RightLabel = nil}, true, function(_,_,_)
                            end)
                        end
                    end
                end)
            end
        end)
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(1000);
    Config.MenuBannerColor [1] = GetResourceKvpInt("menuR");
    Config.MenuBannerColor [2] = GetResourceKvpInt("menuG");
    Config.MenuBannerColor [3] = GetResourceKvpInt("menuB");
    AddBannerColor();
end)

local AllMenuToChange = nil;
function AddBannerColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {};
            for Name,Menu in pairs(RMenu['personal_menu']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name);
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('personal_menu', v):SetRectangleBanner(Config.MenuBannerColor.r, Config.MenuBannerColor.g, Config.MenuBannerColor.b, Config.MenuBannerColor.opacity);
        end
    end)
end