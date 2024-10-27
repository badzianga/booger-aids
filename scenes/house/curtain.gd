class_name Curtain
extends Interactable

const SecondCurtain := preload("res://assets/home/lazienka1/zaslona2.png")

var interacted := false


# THIS SHOULD BE IN EVERY INTERACTABLE -------------------------------------------------------------
func interact() -> void:
	if interacted:
		return
	print("This should be printed just when player arrives to the curtain")
	interacted = true
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	TvLayer.random_noise()
	$Sprite.texture = SecondCurtain
	GlobalVariables.player.stop()


func stop_interaction() -> void:
	pass


func _select_as_current() -> void:
	print("Selected curtain as current potential interactable")
	GlobalVariables.set_deferred("current_interactable", self)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	_handle_input_event(event)


func _on_mouse_entered() -> void:
	_set_finger()


func _on_mouse_exited() -> void:
	_set_arrow()
# --------------------------------------------------------------------------------------------------
