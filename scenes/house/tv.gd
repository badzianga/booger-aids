class_name TV
extends Interactable

const ROTATIONS_PER_SEC := 4.0 * PI

var interacting := false

@onready var crank := $Crank
@onready var sound := $AudioStreamPlayer


func _physics_process(delta: float) -> void:
	if interacting:
		UserInterface.increase_time(delta)
		crank.rotation += delta * ROTATIONS_PER_SEC
		if not sound.playing:
			sound.pitch_scale = randf_range(0.9, 1.1)
			sound.play()


# THIS SHOULD BE IN EVERY INTERACTABLE -------------------------------------------------------------
func interact() -> void:
	#print("This should be #printed just when player arrives to the TV")
	interacting = true
	GlobalVariables.player.stop()


func stop_interaction() -> void:
	interacting = false


func _select_as_current() -> void:
	#print("Selected TV as current potential interactable")
	GlobalVariables.set_deferred("current_interactable", self)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	_handle_input_event(event)


func _on_mouse_entered() -> void:
	_set_finger()


func _on_mouse_exited() -> void:
	_set_arrow()
# --------------------------------------------------------------------------------------------------
