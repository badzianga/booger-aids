extends CanvasLayer

var paused := false

@onready var entries := $Control/CenterContainer/Panel/MarginContainer/GridContainer/Entries
@onready var description_label: Label = $Control/CenterContainer/Panel/MarginContainer/GridContainer/Description/CenterContainer/Label


func _ready() -> void:
	visible = paused


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		paused = not paused
		get_tree().paused = paused
		visible = paused
		if paused:
			description_label.visible = false
			update_entries()
		GlobalVariables.can_noise = not paused


func update_entries() -> void:
	for entry in entries.get_children():
		if entry is Label:
			continue
		if entry.name in GlobalVariables.collected:
			entry.visible = true
		else:
			entry.visible = false
		entry.update_title()


func _on_custom_mouse_entered(panel_name: String) -> void:
	description_label.visible = true
	
	var key := panel_name
	if GlobalVariables.fuck_up_level >= GlobalVariables.fuck_ups_for_descriptions[key]:
		key += "_fuck"
	var text: String = GlobalVariables.descriptions[key]["text"]
	
	description_label.text = text
