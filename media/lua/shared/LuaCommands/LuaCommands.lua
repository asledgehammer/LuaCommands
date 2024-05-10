--- @author JabDoesThings
local LuaCommands = {};

--- @type boolean
--- Set to true to print received commands.
LuaCommands.DEBUG = false;

--- The registered command handlers.
local handlers = {};

--- @param name string The name of the command.
--- @param callback fun(author: string, command: string, args: string[]): string|void The handler to call when the command is triggered.
LuaCommands.register = function(name, callback)
    if name == nil then error('The name is nil.') end
    if #name == 0 then error('The name of the LuaCommands is empty.') end
    if callback == nil then error('The function is nil.') end
    handlers[string.lower(name)] = callback;
end

--- @param name string The name of the command.
LuaCommands.unregister = function(name)
    if name == nil then error('The name is nil.') end
    if #name == 0 then error('The name of the LuaCommands is empty.') end
    handlers[string.lower(name)] = nil;
end

--- @param author string Either a player's username or "console".
--- @param command string The command triggered.
--- @param args string[] The arguments provided with the command.
---
--- @return string result The command result.
function LuaCommands.onCommand(author, command, args)
    if LuaCommands.DEBUG then
        print('LuaCommands: COMMAND RECEIVED => '
            .. 'author=\'' .. tostring(author) .. '\', '
            .. 'command=\'' .. tostring(command) .. '\', '
            .. 'args=string[' .. tostring(#args) .. ']');
    end

    local commandLower = string.lower(command);
    local handler = handlers[commandLower];
    if handler == nil then
        return 'LuaCommands handler not found: ' .. tostring(command);
    end

    return tostring(handler(author, command, args));
end

-- Server-mode.
if isServer() then
    Events.OnServerStarted.Add(function()
        triggerEvent('OnLuaCommand', '__register__');
        Events.OnLuaCommand.Add(LuaCommands.onCommand);
    end);
end

-- SinglePlayer-mode.
if not isServer() and not isClient() then
    Events.OnGameStart.Add(function()
        triggerEvent('OnLuaCommand', '__register__');
        Events.OnLuaCommand.Add(LuaCommands.onCommand);
    end);
end

_G.LuaCommands = LuaCommands;
return LuaCommands;
