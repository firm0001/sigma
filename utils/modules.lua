local Modules = {}
local connections = {}

local repo = 'https://raw.githubusercontent.com/firm0001/sigma/main/'
local Utilities = loadstring(game:HttpGet(repo .. "utils/utilities.lua"))()
local Error = loadstring(game:HttpGet(repo .. "utils/error.lua"))()

function Modules:New(class, properties)
    local instance = Instance.new(class)
    if properties then
        for key, value in pairs(properties) do
            instance[key] = value
        end
    end
    return instance
end

function Modules:Connect(eventname, callback, id)
    local event = Utilities.Event[eventname]
    if not event then 
        return Error:Log("Event '" .. eventname .. "' does not exist.", "error")
    end

    local success, connection
    if typeof(event) == "RBXScriptSignal" then
        success, connection = pcall(function() return event:Connect(callback) end)
    elseif typeof(event) == "Instance" and (event:IsA("BindableEvent") or event:IsA("Changed")) then
        success, connection = pcall(function() return event.Event:Connect(callback) end)
    else
        return Error:Log("Unsupported event type: '" .. eventname .. "'", "error")
    end

    if success and connection then
        connections[id] = connection
    else
        Error:Log("Failed to establish connection for '" .. eventname .. "'", "error")
    end
end

return Modules
