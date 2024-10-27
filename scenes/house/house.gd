extends Node2D


func _ready() -> void:
	# TODO: enable all singletons
	
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
