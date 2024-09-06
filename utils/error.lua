local Error = {}

function Error:Log(msg, level)
    local levels = {
        ["info"] = "[info] ",
        ["warning"] = "[warning] ",
        ["error"] = "[error] ",
        ["debug"] = "[debug] "
    }
    local prefix = levels[level] or levels["error"]
    print(prefix .. tostring(msg))
end

function Error:Throw(msg)
    error("[critical] " .. tostring(msg))
end

function Error:Warn(msg)
    warn("[warning] " .. tostring(msg))
end

return Error
