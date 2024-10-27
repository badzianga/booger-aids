class_name Interactable
extends Area2D

const MouseArrow := preload("res://assets/mouse/arrow.png")
const MouseKidNamedFinger := preload("res://assets/mouse/hand.png")


func interact() -> void:
	pass
	#print_debug("THIS SHOULD NOT BE #printED!")


func stop_interaction() -> void:
	pass
	#print_debug("THIS SHOULD NOT BE #printED")


func _handle_input_event(event: InputEvent) -> void:
	if not event is InputEventMouse:
		return
	if event.is_action_pressed("click"):
		_select_as_current()


func _set_finger() -> void:
	Input.set_custom_mouse_cursor(MouseKidNamedFinger)


func _set_arrow() -> void:
	Input.set_custom_mouse_cursor(MouseArrow)


func _select_as_current() -> void:
	pass
	#print_debug("THIS SHOULD NOT BE #printED")
