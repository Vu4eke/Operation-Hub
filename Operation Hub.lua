local statusURL = "https://raw.githubusercontent.com/Vu4eke/Operation-Hub/refs/heads/main/Work.txt" -- Замените на ссылку вашего txt файла

local function getStatus()
    local status = game:HttpGet(statusURL)
    if status then
        status = string.match(status, "%d+") -- Извлекаем только число из текста
        if status then
            return tonumber(status) -- Возвращает числовое значение статуса (0 или 1)
        end
    end
    return nil -- Возвращает nil, если не удалось получить или обработать статус
end

local currentStatus = getStatus()

if currentStatus == nil then
    warn("Не удалось получить статус, выполнение скрипта прекращено.")
elseif currentStatus == 0 then
	-- Код для статуса 0 (технические работы не ведутся)
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Vu4eke/Operation-Hub/refs/heads/main/GameList.lua"))()
    for PlaceID, Execute in pairs(Games) do
        if PlaceID == game.PlaceId then
            loadstring(game:HttpGet(Execute))()
        end
    end
elseif currentStatus == 1 then
    -- Код для статуса 1 (ведутся технические работы)
    warn("Ведутся технические работы")
    -- Тут можно добавить дополнительный код, например, отображение сообщения в игре
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Vu4eke/Operation-Hub_scripts/refs/heads/main/techical_work.lua"))() 
else
    warn("Неизвестный статус: " .. tostring(currentStatus) .. ", выполнение скрипта прекращено.")
end
