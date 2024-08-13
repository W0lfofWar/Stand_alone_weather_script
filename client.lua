local currentWeather = DefaultWeather
local currentTime = DefaultTime
local lastWeather = nil
local lastTime = { hour = -1, minute = -1 }

RegisterNetEvent('weatherSync:updateWeather')
AddEventHandler('weatherSync:updateWeather', function(weather, time)
    currentWeather = weather
    currentTime = time
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Check every second

        local playerCoords = GetEntityCoords(PlayerPedId())
        local playerHeight = playerCoords.z
        local zoneFound = false

        -- Check for static weather zones
        for _, zone in ipairs(StaticWeatherZones) do
            local distance = #(playerCoords - zone.coords)
            if distance < zone.radius and playerHeight <= zone.maxHeight then
                if lastWeather ~= zone.weather then
                    SetWeatherTypeOvertimePersist(zone.weather, 60.0)
                    lastWeather = zone.weather
                end
                zoneFound = true
                break
            end
        end

        if not zoneFound then
            -- Apply dynamic weather outside static zones if it has changed
            if lastWeather ~= currentWeather then
                SetWeatherTypeOvertimePersist(currentWeather, 60.0)
                lastWeather = currentWeather
            end
        end

        -- Apply time updates only if there is a change
        if lastTime.hour ~= currentTime.hour or lastTime.minute ~= currentTime.minute then
            NetworkOverrideClockTime(currentTime.hour, currentTime.minute, 0)
            lastTime.hour = currentTime.hour
            lastTime.minute = currentTime.minute
        end
    end
end)
