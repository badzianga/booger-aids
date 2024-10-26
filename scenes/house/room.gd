extends Area2D


func _on_mouse_entered() -> void:
	GlobalVariables.player.set_deferred("mouse_in_room", true)


func _on_mouse_exited() -> void:
	GlobalVariables.player.mouse_in_room = false
