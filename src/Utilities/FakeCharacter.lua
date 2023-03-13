local StarterPlayer = game:GetService("StarterPlayer")
local Players = game:GetService("Players")

local Client = Players.LocalPlayer

local FakeCharacterController = {}
FakeCharacterController.__index = FakeCharacterController

function FakeCharacterController.New()
    local self = setmetatable({}, FakeCharacterController)

    -- Check if there is an existing character template that can be used to form the fake character
    -- Can be the starter character, or the current character
    -- TODO: Build a new character from scratch, and not rely on templates?

    -- Grab the character template, and clone it

    local CharacterTemplate = 

    self.CurrentCharacterState = false 

    return self 
end 

function FakeCharacterController:SwitchToFakeCharacter()
    
end 

function FakeCharacterController:SwitchToRealCharacter()

end 
 

return FakeCharacterController 
