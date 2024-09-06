local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Utilities = {}
Utilities.Events = {
    RenderStepped = RunService.RenderStepped,
    Heartbeat = RunService.Heartbeat,
    Stepped = RunService.Stepped,
    PlayerAdded = Players.PlayerAdded,
    PlayerRemoving = Players.PlayerRemoving,
    Chatted = LocalPlayer.Chatted,
    ChildAdded = Workspace.ChildAdded,
    DescendantAdded = Workspace.DescendantAdded,
    IgnoredDescendantAdded = Workspace:FindFirstChild("Ignored") and Workspace.Ignored.DescendantAdded or nil,
    InputBegan = UserInputService.InputBegan,
    InputEnded = UserInputService.InputEnded,
    ReplicatedStorageChildAdded = ReplicatedStorage.ChildAdded,
    ReplicatedStorageDescendantAdded = ReplicatedStorage.DescendantAdded
}

return Utilities
