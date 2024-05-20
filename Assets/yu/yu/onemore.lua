local lua_helper = celeste.Mod.LuaCutscenes.LuaHelper

function onBegin()
	disableMovement()
	disablePause()
	say("1_TEST_R01_05_DIALOG_2")
	setFlag("retrying_tower", true)
	instantTeleportTo(150, -400)
end

function onEnd()
	enableMovement()
	enablePause()
end