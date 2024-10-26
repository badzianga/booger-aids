extends Area2D



func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not event is InputEventMouse:
		return
	if event.is_action_pressed("click"):
		print("Dupa")
