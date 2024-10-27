extends CanvasLayer

var paused := false

@onready var entries := $Control/CenterContainer/Panel/MarginContainer/GridContainer/Entries


func _ready() -> void:
	visible = paused


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		paused = not paused
		get_tree().paused = paused
		visible = paused
		if paused:
			update_entries()
		GlobalVariables.can_noise = not paused


func update_entries() -> void:
	for entry in entries.get_children():
		if entry is Label:
			continue
		entry.update_title()
