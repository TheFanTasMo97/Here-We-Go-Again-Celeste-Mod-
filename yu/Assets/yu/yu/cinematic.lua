local lua_helper = celeste.Mod.LuaCutscenes.LuaHelper

local monocle = require("#monocle")
local coroutineEntity = monocle.Entity()

local waitingCoroutine
local goodToGo = false

local function waitTilCameraMoved()
	wait(0.5)
	goodToGo = true
end

local function makeCoroutine(func)
	return monocle.Coroutine(lua_helper.LuaCoroutineToIEnumerator(coroutine.create(func)))
end

function onBegin()
	local x = 0
	local y = -2100
	local defaultX = getLevel().Camera.X
	local defaultY = getLevel().Camera.Y

	disableMovement()

	getLevel():add(coroutineEntity)
	-- Move Camera to a certain point x and y
	coroutineEntity:add(monocle.Coroutine(celeste.CutsceneEntity.CameraTo(vector2(x, y), 10)))
	waitingCoroutine = makeCoroutine(waitTilCameraMoved)
	cutsceneEntity:Add(waitingCoroutine)
	while not goodToGo do
		wait()
	end
	say("1_TEST_R01_05_DIALOG_1")
	coroutine.yield(celeste.CutsceneEntity.CameraTo(vector2(defaultX, defaultY), 1))
	enableMovement()
end

function onEnd()
	if waitingCoroutine then
		waitingCoroutine:Cancel()
		CutsceneEntity:Remove(waitingCoroutine)
	end
end