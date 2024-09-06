Utilities = {}
Utilities.Events = {
    RenderStepped = RunService.RenderStepped,
    Heartbeat = RunService.Heartbeat,
    Stepped = RunService.Stepped,
    PlayerAdded = Players.PlayerAdded,
    PlayerRemoving = Players.PlayerRemoving,
    Chatted = LocalPlayer.Chatted,
    ChildAdded = Workspace.ChildAdded,
    DescendantAdded = Workspace.DescendantAdded,
    IgnoredDescendantAdded = Workspace.Ignored.DescendantAdded,
    InputBegan = UserInputService.InputBegan,
    InputEnded = UserInputService.InputEnded,
    ReplicatedStorageChildAdded = ReplicatedStorage.ChildAdded,
    ReplicatedStorageDescendantAdded = ReplicatedStorage.DescendantAdded
}
return Utilities
