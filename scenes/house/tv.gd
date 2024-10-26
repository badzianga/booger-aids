extends Area2D

const MouseArrow := preload("res://assets/mouse/arrow.png")
const MouseKidNamedFinger := preload("res://assets/mouse/hand.png")


func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(MouseKidNamedFinger)


func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(MouseArrow)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not event is InputEventMouse:
		return
	if event.is_action_pressed("click"):
		interact()


func interact() -> void:
	print("Dupa")
