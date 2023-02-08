local RemoteBlocker = {}
local BlockedRemotes = {}

local function FindRemote(RemoteName)
    return game:FindFirstChild(RemoteName, true)
end 

function RemoteBlocker.BlockRemote(RemoteName)
    local IsRemote = FindRemote(RemoteName)

    if not IsRemote then 
        return false, string.format("Failed to block remote. Remote [%s] was not found", RemoteName)
    end 

    BlockedRemotes[RemoteName] = true
end 

function RemoteBlocker.UnblockRemote(RemoteName)
    local IsRemote = FindRemote(RemoteName)

    if not IsRemote then 
        return false, string.format("Failed to unblock remote. Remote [%s] was not found", RemoteName)
    end 

    BlockedRemotes[RemoteName] = nil 
end 

function RemoteBlocker.IsBlockingRemote(RemoteName)
    return BlockedRemotes[RemoteName] and true or false
end 

local oldNameCall
oldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local namecallMethod = getnamecallmethod()

    if not namecallMethod == "FireServer" or namecallMethod == "InvokeServer" then 
        return oldNameCall(self, ...)
    end 

    local IsRemoteBlocked = BlockedRemotes[self.Name]

    if IsRemoteBlocked then 
        return
    end 

    return oldNameCall(self, ...)
end)

 

return RemoteBlocker 
