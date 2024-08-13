local currentWeather = DefaultWeather
local currentTime = DefaultTime
local timeCycleLength = TimeCycleLength -- Default from config
local weatherChangeInterval = WeatherChangeInterval -- Default from config

-- Dynamic weather change logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(weatherChangeInterval * 60000) -- Change weather based on configured interval
        currentWeather = WeatherOptions[math.random(1, #WeatherOptions)]
        TriggerClientEvent('weatherSync:updateWeather', -1, currentWeather, currentTime)
    end
end)

-- Synchronize time progression
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Update every second
        currentTime.minute = currentTime.minute + 1
        if currentTime.minute >= 60 then
            currentTime.minute = 0
            currentTime.hour = currentTime.hour + 1
            if currentTime.hour >= 24 then
                currentTime.hour = 0
            end
        end
        TriggerClientEvent('weatherSync:updateWeather', -1, currentWeather, currentTime)
    end
end)

-- On resource start, set the default weather and time
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        currentWeather = DefaultWeather
        currentTime = DefaultTime
        TriggerClientEvent('weatherSync:updateWeather', -1, currentWeather, currentTime)
    end
end)
