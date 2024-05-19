function onBegin()
	disableMovement()
	say("1_TEST_R01_04_STRAWBERRY_DIALOG_1")
	setFlag("first_strawberry_collected", true)
end

function onEnd()
	enableMovement()
end