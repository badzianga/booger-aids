extends Node2D


func _ready() -> void:
	Diary.set_process(true)
	Diary.set_physics_process(true)
	Diary.set_process_input(true)
	TvLayer.visible = true
	TvLayer.set_physics_process(true)
	UserInterface.visible = true
	UserInterface.set_physics_process(true)
	
	DialogSystem.display_dialog("tut1")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut2")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut3")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut4")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut5")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut6")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut7")
	await DialogSystem.closed
	DialogSystem.display_dialog("tut8")
	await DialogSystem.closed
