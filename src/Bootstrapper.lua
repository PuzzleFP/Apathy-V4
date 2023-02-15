getgenv().RequestServer = function(Type, Data)
    local Package = {
        Url = "http://localhost:8090/",
        Headers = {
            InstructionType = Type, 
            InstructionData = Data}
    }

    return HTTP(Package)
end 

getgenv().Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua"))()
local Window = Library:CreateWindow({
    Title = 'Apathy V4',
    Center = true, 
    AutoShow = true,
})

Library:Notify("Apathy V4 has been injected", 4)
Library:Notify("Successfully terminated the anticheat", 4)

local Tabs = {
    -- Creates a new tab titled Main
    Player = Window:AddTab('Player'), 
    Aim = Window:AddTab('Aim'),
    ESP = Window:AddTab('ESP'),
    Tools = Window:AddTab('Tools'),
    Environment = Window:AddTab('Environment'),
    Miscellaneous = Window:AddTab('Miscellaneous'),
}

local ClientDamage = Tabs.Player:AddLeftTabbox():AddTab("Client Damage")
local Speed = Tabs.Player:AddLeftTabbox():AddTab("Speed")
local Jetpack = Tabs.Player:AddLeftTabbox():AddTab("Jetpack")
local Portafab = Tabs.Player:AddRightTabbox():AddTab("Portafab")
local Miscellaneous = Tabs.Player:AddRightTabbox():AddTab("Miscellaneous")

local Aimbot = Tabs.Aim:AddLeftTabbox():AddTab("Aimbot")

local PlayerESP = Tabs.ESP:AddLeftTabbox():AddTab("Players")
local StructureESP = Tabs.ESP:AddLeftTabbox():AddTab("Structures")
local TerrainESP = Tabs.ESP:AddRightTabbox():AddTab("Terrain")

ClientDamage:AddToggle('Fall Damage', {
    Text = 'Fall Damage',
    Default = true, 
})

ClientDamage:AddToggle('Ocean Damage', {
    Text = 'Ocean Damage',
    Default = true, 
})

Speed:AddSlider('Walk Speed', {
    Text = 'Walk Speed',
    
    Default = 16,
    Min = 0,
    Max = 325,
    Rounding = 0,

    Compact = false, 
})

Speed:AddSlider('Sprint Speed', {
    Text = 'Walk Speed',
    
    Default = 24,
    Min = 0,
    Max = 325,
    Rounding = 0,

    Compact = false, 
})

Speed:AddSlider('Jump Power', {
    Text = 'Jump Power',
    
    Default = 48,
    Min = 0,
    Max = 620,
    Rounding = 0,

    Compact = false,
})

Jetpack:AddSlider('Thrust Power', {
    Text = 'Thrust Power',
    
    Default = 17,
    Min = 0,
    Max = 265,
    Rounding = 0,

    Compact = false, 
})

Jetpack:AddSlider('Thrust Time', {
    Text = 'Thrust Time',
    
    Default = 1,
    Min = 0,
    Max = 400,
    Rounding = 0,

    Compact = false, 
})

Jetpack:AddSlider('Cooldown Time', {
    Text = 'Cooldown Time',
    
    Default = 0.5,
    Min = 0,
    Max = 60,
    Rounding = 0,

    Compact = false, 
})

Jetpack:AddToggle('No Usage Cost', {
    Text = 'No Usage Cost',
    Default = false,
})

Portafab:AddButton('Fill Backpack', function()
    print('You clicked a button!')
end)

Portafab:AddToggle('Auto Fill Backpack', {
    Text = 'Auto Fill Backpack',
    Default = false,
})

Portafab:AddToggle('Auto Iridium', {
    Text = 'Auto Iridium',
    Default = false,
})

PlayerESP:AddToggle('Chams', {
    Text = 'Chams',
    Default = false,
})

PlayerESP:AddToggle('Tracers', {
    Text = 'Tracers',
    Default = false,
})

PlayerESP:AddToggle('Boxes', {
    Text = 'Tracers',
    Default = false,
})

PlayerESP:AddToggle('ShowDistance', {
    Text = 'Show Distance',
    Default = false,
})

PlayerESP:AddToggle('ShowIridium', {
    Text = 'Show Iridium',
    Default = false,
})

PlayerESP:AddToggle('ShowWeapon', {
    Text = 'Show Weapon',
    Default = false,
})

StructureESP:AddToggle('Show Cruise Missle ', {
    Text = 'Show Beacons',
    Default = false,
})

TerrainESP:AddToggle('ShowBeaconSpots', {
    Text = 'Show Beacon Spots',
    Default = false,
})

TerrainESP:AddToggle('ShowBeacons', {
    Text = 'Show Beacons',
    Default = false,
})


TerrainESP:AddToggle('ShowPumpClusters', {
    Text = 'Show Pump Clusters',
    Default = false,
})

TerrainESP:AddSlider('PumpClusterSize', {
    Text = 'Pump Cluster Size',
    
    Default = 3,
    Min = 1,
    Max = 8,
    Rounding = 0,
    
    Compact = false, 
})

Miscellaneous:AddButton('Teleport to Top of Map', function()
    print('You clicked a button!')
end)

Miscellaneous:AddButton('Drain Enemy Backpacks', function()
    print('You clicked a button!')
end)

Miscellaneous:AddButton('Destroy all Crystals', function()
    print('You clicked a button!')
end)


Miscellaneous:AddToggle('Loop Fling Enemies', {
    Text = 'Loop Fling Enemies',
    Default = false,
})

Miscellaneous:AddToggle('Force Swim', {
    Text = 'Force Swim',
    Default = false, 
    Tooltip = 'Force the character into a swimming state', 
})

Miscellaneous:AddToggle('Noclip', {
    Text = 'Noclip',
    Default = false, 
    Tooltip = 'Noclip allows you to phase through parts', 
})


Miscellaneous:AddToggle('Fly', {
    Text = 'Fly',
    Default = false,
})

Miscellaneous:AddLabel('Keybind Teleport'):AddKeyPicker('Keybind Teleport', { Default = 'E', NoUI = true, Text = 'Keybind Teleport' }) 
