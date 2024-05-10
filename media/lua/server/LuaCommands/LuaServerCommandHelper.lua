--- @class LuaServerCommandHelper A group of helper API for custom commands. This helps where the server otherwise walls off functions that commands may require in order to execute successfully.
---
--- @author JabDoesThings | asledgehammer
LuaServerCommandHandler = {};

--- Retrieves a IsoPlayer with a username.
---
--- @param username string The username of the player.
---
--- @return IsoPlayer|nil player The player with the username.
function LuaServerCommandHandler.getPlayerByUsername(username) end

--- Retrieves all players on the server.
---
--- @return IsoPlayer[] players All online players.
function LuaServerCommandHandler.getOnlinePlayers() end

--- Syncs an IsoObject with all players on the server.
---
--- @param object IsoObject The object to sync with clients.
function LuaServerCommandHandler.syncIsoObject(object) end

--- Locally plays a sound where a player is in the world.
---
--- @param player IsoPlayer The player to play the sound.
--- @param sound string The name of the sound to play.
function LuaServerCommandHandler.playLocalSoundAtPlayer(player, sound) end

--- Plays a sound where a player is within a radius.
---
--- @param player IsoPlayer The player to play the sound.
--- @param sound any The name of the sound to play.
--- @param radius number The radius from the player to play/hear the sound. (In squares)
function LuaServerCommandHandler.playWorldSoundAtPlayer(player, sound, radius) end

--- Plays a sound at a square within a radius.
---
--- @param sound any The name of the sound to play.
--- @param square IsoGridSquare The square where the sound is played.
--- @param radius number The radius from the player to play/hear the sound. (In squares)
function LuaServerCommandHandler.playWorldSoundSquare(sound, square, radius) end

--- Spawns a IsoZombie at a location in the world.
---
--- @param x integer The x-coordinate in the world. (In squares)
--- @param y integer The y-coordinate in the world. (In squares)
--- @param z integer The z-coordinate in the world. (In squares)
---
--- @return IsoZombie zombie The zombie created.
function LuaServerCommandHandler.createZombie(x, y, z) end

--- Executes a command on the server.
---
--- @param command string The command to execute.
--- 
--- @return string result The results of the command-execution attempt.
function LuaServerCommandHandler.executeServerCommand(command) end

--- Triggers an alarm in a room.
---
--- @param roomOrRoomDef IsoRoom|RoomDef The room (or room-definition), to trigger the alarm.
function LuaServerCommandHandler.triggerRoomAlarm(roomOrRoomDef) end
