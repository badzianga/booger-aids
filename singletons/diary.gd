extends CanvasLayer

var paused := false


func _ready() -> void:
	visible = paused


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		paused = not paused
		get_tree().paused = paused
		visible = paused
