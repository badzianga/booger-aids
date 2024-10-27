class_name Finger
extends Interactable

@export var jumpscare: JumpscareBaluszkowoSobolewski

func _ready() -> void:
	assert(jumpscare != null, "Set jumpscare!")


# THIS SHOULD BE IN EVERY INTERACTABLE -------------------------------------------------------------
func interact() -> void:
	#print("This should be #printed just when player arrives to the finger")
	# TODO: collect, update diary and noise here
	GlobalVariables.collect("finger")
	await GlobalVariables.item_collected
	jumpscare.activate_timer()
	GlobalVariables.player.stop()
	queue_free()


func stop_interaction() -> void:
	pass


func _select_as_current() -> void:
	#print("Selected finger as current potential interactable")
	GlobalVariables.set_deferred("current_interactable", self)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	_handle_input_event(event)


func _on_mouse_entered() -> void:
	_set_finger()


func _on_mouse_exited() -> void:
	_set_arrow()
# --------------------------------------------------------------------------------------------------
