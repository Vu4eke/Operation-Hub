loadstring(game:HttpGet("https://raw.githubusercontent.com/Vu4eke/Operation-Hub/refs/heads/main/GameList.lua"))()
for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
