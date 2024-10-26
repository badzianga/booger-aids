class_name DialogSystem
extends Control

@onready var _initial_visible := false
@onready var _text_label := $Box/Margin/TextLabel


func _ready() -> void:
	visible = _initial_visible


func _input(event: InputEvent) -> void:
	if not visible:
		return
	if not event is InputEventMouse:
		return
	visible = false


func display_dialog(id: StringName) -> void:
	visible = true
	_text_label.bbcode_text = &"[center]" + GlobalVariables.dialogs[id] + &"[/center]"
