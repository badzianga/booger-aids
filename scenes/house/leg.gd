class_name Leg
extends Interactable

@export var to_update: Array[Sprite2D] = []


# THIS SHOULD BE IN EVERY INTERACTABLE -------------------------------------------------------------
func interact() -> void:
	print("This should be printed just when player arrives to the leg")
	# TODO: collect, update diary and noise here
	GlobalVariables.collect("leg", true)
	await GlobalVariables.item_collected
	GlobalVariables.player.stop()
	for sprite in to_update:
		sprite.visible = true
	queue_free()


func stop_interaction() -> void:
	pass


func _select_as_current() -> void:
	print("Selected leg as current potential interactable")
	GlobalVariables.set_deferred("current_interactable", self)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	_handle_input_event(event)


func _on_mouse_entered() -> void:
	_set_finger()


func _on_mouse_exited() -> void:
	_set_arrow()
# --------------------------------------------------------------------------------------------------
