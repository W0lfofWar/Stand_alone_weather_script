-- Default settings
DefaultWeather = "EXTRASUNNY"
DefaultTime = { hour = 09, minute = 0 }

-- Configurable time and weather cycle lengths (in minutes)
TimeCycleLength = 2 -- Each in-game hour takes 2 real-time minutes
WeatherChangeInterval = 10 -- Weather changes every 15 real-time minutes

-- Weather options for dynamic changes (can be customized)
WeatherOptions = { "CLEAR", "EXTRASUNNY", "CLOUDS", "OVERCAST", "RAIN", "CLEARING", "FOGGY" }

-- Static weather zones configuration
StaticWeatherZones = {
    {
        name = "Sandy Shores",
        coords = vector3(-511.57,-835.37, 29.96),
        radius = 800.0,
        maxHeight = 200.0, -- Weather effects will only apply up to 200 meters
        weather = "FOGGY"
    },
    {
        name = "mount chiliad",
        coords = vector3(502.75,5604.20, 300.91),
        radius = 600.0,
        maxHeight = 1000, 
        weather = "XMAS"
    },
    {
        name = "mount josiah",
        coords = vector3(-1177.96, 3851.36, 157.48),
        radius = 500.0,
        maxHeight = 600.0, 
        weather = "XMAS"
    },
    {
        name = "humane labs",
        coords = vector3(3527.24, 3712.64, 36.64),
        radius = 400.0,
        maxHeight = 100.0, 
        weather = "THUNDER"
    },
    {
        name = "palmer power",
        coords = vector3(2744.16, 1553.64, 35.12),
        radius = 400.0,
        maxHeight = 100.0, 
        weather = "THUNDER"
    },

    -- Add more zones as needed
}