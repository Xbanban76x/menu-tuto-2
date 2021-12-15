ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------- Menu -------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if VarColor == "~b~" then VarColor = "~r~" else VarColor = "~b~" end
    end
end)

RMenu.Add('menu-tuto', 'main', RageUI.CreateMenu("Menu-Tuto", "Menu Interaction"))
RMenu.Add('menu-tuto', 'inventaire', RageUI.CreateSubMenu(RMenu:Get('menu-tuto', 'main'), "Inventaire", "Inventaire"))
RMenu.Add('menu-tuto', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('menu-tuto', 'main'), "Portefeuille", "Portefeuille"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('menu-tuto', 'main'), true, true, true, function()

            RageUI.Separator("~g~Votre steam : ~b~"..GetPlayerName(PlayerId()))
            RageUI.Separator("~g~Votre ID : ~b~"..GetPlayerServerId(PlayerId()))

            RageUI.ButtonWithStyle(VarColor.."→ ~s~Inventaire", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
            end, RMenu:Get('menu-tuto', 'inventaire'))

            RageUI.ButtonWithStyle(VarColor.."→ ~s~Portefeuille", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
            end, RMenu:Get('menu-tuto', 'portefeuille'))

        end, function()
        end)
    
            RageUI.IsVisible(RMenu:Get('menu-tuto', 'inventaire'), true, true, true, function()

                RageUI.Separator("~r~↓ Votre inventaire : ↓")

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('menu-tuto', 'portefeuille'), true, true, true, function()

                RageUI.Separator("~r~↓ Votre Portefeuille : ↓")
                RageUI.Separator("~b~↓ Vos license ↓")

                RageUI.ButtonWithStyle('Regarder sa carte d\'identité', nil, {RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                    end
                end)

                RageUI.ButtonWithStyle('Montrer sa carte d\'identité', nil, {RightLabel = nil }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                        else
                            ESX.ShowNotification(_U('proximity'))
                        end
                    end
                end)
            end, function()
            end)
            Citizen.Wait(0)
        end
    end)






Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 327) then
            RageUI.Visible(RMenu:Get('menu-tuto', 'main'), not RageUI.Visible(RMenu:Get('menu-tuto', 'main')))
        end
    end
end)
