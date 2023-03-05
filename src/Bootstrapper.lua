getgenv().Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua"))()

-- if game.PlaceId ~= 632574862 then 
--     return Library:Notify("Apathy V4 can only be injected in Eclipsis")
-- end 

getgenv().ImportScript = function(Name)
    Library:Notify("Importing script: " .. Name, 2)
    return loadstring(syn.request({Url = "http://localhost:8080/Script/GetScript", Headers = {Script = Name}}).Body)()
end 

local AnticheatByass = ImportScript("AnticheatBypass")
local Player = ImportScript("Player")
local Jetpack = ImportScript("Jetpack")
local Aimbot = ImportScript("Aimbot")
local ESP = ImportScript("ESP")
local SilentAim = ImportScript("SilentAim")
local Spectators = ImportScript("Spectators")
local Tools = ImportScript("Tools")
local Miscellaneous = ImportScript("Miscellaneous")

local Window = Library:CreateWindow({
    Title = 'Apathy V4',
    Center = true, 
    AutoShow = true,
})

Library:Notify("Apathy V4 has been injected", 4)

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
local PlayerMiscellaneous = Tabs.Player:AddRightTabbox():AddTab("Miscellaneous")

local Aimbot = Tabs.Aim:AddLeftTabbox():AddTab("Aimbot")


local PlayerESP = Tabs.ESP:AddLeftTabbox():AddTab("Players")
local StructureESP = Tabs.ESP:AddLeftTabbox():AddTab("Structures")
local TerrainESP = Tabs.ESP:AddRightTabbox():AddTab("Terrain")

local function CreateToggle(TabObject, Name, Callback, ...)
    local Toggle = TabObject:AddToggle(Name, ...)

    Toggles[Name]:OnChanged(function()
        local ToggleValue = Toggles[Name].Value 
        Callback(ToggleValue)
    end)

end 

local function CreateSlider(TabObject, Name, Callback, ...)
    local Toggle = TabObject:AddSlider(Name, ...)

    Options[Name]:OnChanged(function()
        local SliderValue = Options[Name].Value
        Callback(SliderValue)
    end)

end 

local function CreateButton(TabObject, Name, Callback)
    local Toggle = TabObject:AddButton(Name, Callback)
end 

CreateToggle(ClientDamage, "FallDamage", Player.SetFallDamage, {Text = "Fall Damage", Default = true})
CreateToggle(ClientDamage, "OceanDamage", Player.SetOceanDamage, {Text = "Ocean Damage", Default = true})

CreateSlider(Speed, "WalkSpeed", Player.SetWalkSpeed, {Text = "Walk Speed", Default = 16, Min = 0, Max = 325, Rounding = 0, Compact = false})
CreateSlider(Speed, "SprintSpeed", Player.SetSprintSpeed, {Text = "Sprint Speed", Default = 24, Min = 0, Max = 650, Rounding = 0, Compact = false})
CreateSlider(Speed, "JumpPower", Player.SetJumpPower, {Text = "Jump Power", Default = 48, Min = 0, Max = 455, Rounding = 0, Compact = false})

CreateSlider(Jetpack, "ThrustPower", Jetpack.SetThrustPower, {Text = "Thrust Power", Default = 16, Min = 0, Max = 325, Rounding = 0, Compact = false})
CreateSlider(Jetpack, "ThrustTime", Jetpack.SetMaxThrustTime, {Text = "Thrust Time", Default = 1, Min = 0, Max = 400, Rounding = 0, Compact = false})
CreateSlider(Jetpack, "CooldownTime", Jetpack.SetCooldownTime, {Text = "Cooldown Time", Default = 0.5, Min = 0, Max = 60, Rounding = 0, Compact = false})
CreateToggle(Jetpack, "NoUsageCost", Jetpack.SetNoUseCost, {Text = "No Usage Cost", Default = false})

CreateButton(PlayerMiscellaneous, "Teleport to Top of Map", Miscellaneous.ToTopOfMap)
CreateButton(PlayerMiscellaneous, "Teleport to Bottom of Ocean", Miscellaneous.ToBottomOfOcean)
CreateToggle(PlayerMiscellaneous, "LoopFlingEnemies", Miscellaneous.LoopFlingEnemies, {Text = "Loop Fling Enemies", Default = false})
CreateToggle(PlayerMiscellaneous, "ForceSwim", Miscellaneous.ForceSwim, {Text = "Force Swim", Default = false})
CreateToggle(PlayerMiscellaneous, "Noclip", Miscellaneous.Noclip, {Text = "Noclip", Default = false})
CreateToggle(PlayerMiscellaneous, "Fly", Miscellaneous.Fly, {Text = "Fly", Default = false})

CreateToggle(PlayerMiscellaneous, "KeybindTeleport", Miscellaneous.KeybindTeleport, {Text = "Keybind Teleport", Default = false})
Miscellaneous:AddLabel('Keybind Teleport'):AddKeyPicker('Keybind', { Default = 'E', NoUI = true, Text = 'Keybind'}) 

-- CreateButton(Portafab, "Fill Backpack", )
-- CreateToggle(Portafab, "AutoFillBackpack", Player.SetFallDamage, {Text = "Auto Fill Backpack", Default = true})
-- CreateToggle(Portafab, "AutoIridium", Player.SetFallDamage, {Text = "Auto Iridium", Default = true})
-- CreateButton(Portafab, "Fill Backpack", )

CreateToggle(PlayerESP, "Chams", ESP.ShowChams, {Text = "Show Chams", Default = false})
CreateToggle(PlayerESP, "Tracers", ESP.ShowTracers, {Text = "Show Tracers", Default = false})
CreateToggle(PlayerESP, "Boxes", ESP.ShowBoxes, {Text = "Show Boxes", Default = false})
CreateToggle(PlayerESP, "ShowDistance", ESP.ShowDistance, {Text = "Show Distance", Default = false})
CreateToggle(PlayerESP, "ShowIridium", ESP.ShowIridium, {Text = "Show Iridium", Default = false})
CreateToggle(PlayerESP, "ShowWeapon", ESP.ShowWeapon, {Text = "Show Weapon", Default = false})
CreateToggle(PlayerESP, "IgnoreTeam", ESP.IgnoreTeam, {Text = "Ignore Team", Default = false})
CreateToggle(PlayerESP, "IgnoreLocalPlayer", ESP.IgnoreLocalPlayer, {Text = "Ignore Local Player", Default = false})

CreateToggle(StructureESP, "ShowCruiseMissleTrajectory", ESP.ShowCruiseMissleTrajectory, {Text = "Show Cruise Missle Trajectory", Default = false})
CreateToggle(StructureESP, "ShowArtilleryTrajectory", ESP.ShowArtilleryTrajectory, {Text = "Show Artillery Trajectory", Default = false})

CreateToggle(TerrainESP, "ShowBeaconSpots", ESP.ShowBeaconSpots, {Text = "Show Beacon Spots", Default = false})
CreateToggle(TerrainESP, "ShowBeacons", ESP.ShowBeacon, {Text = "Show Beacons", Default = false})
CreateToggle(TerrainESP, "ShowPumpClusters", ESP.ShowPumpClusters, {Text = "Show Pump Clusters", Default = false})
CreateSlider(TerrainESP, "PumpClusterSize", Player.SetClusterSize, {Text = "Pump Cluster Size", Default = 3, Min = 0, Max = 8, Rounding = 0, Compact = false})

