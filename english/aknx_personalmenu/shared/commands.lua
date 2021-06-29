RegisterCommand("personalmenu", function()
    if not openF5Menu then
        openPersonalMenu()
    else
        openF5Menu = false
        RageUI.CloseAll()
    end
end)