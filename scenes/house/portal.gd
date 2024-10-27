class_name Portal
extends Interactable

@onready var _teleports_to := $TeleportsTo


# THIS SHOULD BE IN EVERY INTERACTABLE -------------------------------------------------------------
func interact() -> void:
	print("This should be printed just when player arrives to the stairs")
	TvLayer.random_noise()
	GlobalVariables.player.teleport_to(_teleports_to.global_position)


func stop_interaction() -> void:
	pass


func _select_as_current() -> void:
	print("Selected stairs as current potential interactable")
	GlobalVariables.set_deferred("current_interactable", self)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	_handle_input_event(event)


func _on_mouse_entered() -> void:
	_set_finger()


func _on_mouse_exited() -> void:
	_set_arrow()
# --------------------------------------------------------------------------------------------------
