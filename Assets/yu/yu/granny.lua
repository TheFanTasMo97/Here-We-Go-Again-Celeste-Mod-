local lua_helper = celeste.Mod.LuaCutscenes.LuaHelper

function onBegin()
	disableMovement()
	disablePause()
	walk(155, false, 0.5)
	say("1_TEST_R01_05_DIALOG_GRANNY")
end

function onEnd()
	enableMovement()
	enablePause()
end