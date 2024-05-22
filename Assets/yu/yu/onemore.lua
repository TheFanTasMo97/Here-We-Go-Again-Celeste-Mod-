local lua_helper = celeste.Mod.LuaCutscenes.LuaHelper


function onBegin()
	local alreadHadCinematics = getFlag("alreadyHadCinematicsOneMore")
	if not alreadHadCinematics then
		disableMovement()
		disablePause()
		player.DummyGravity = false
		say("1_TEST_R01_05_DIALOG_2")
		setFlag("retrying_tower", true)
		instantTeleportTo(150, -400)
	end
end

function onEnd()
	enableMovement()
	enablePause()
	player.DummyGravity = true
	setFlag("alreadyHadCinematicsOneMore", true)
end