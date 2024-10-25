class_name DialogSystem
extends Control

@export_file("*.json") var dialog_path: String

var _dialog: Dictionary

@onready var _initial_visible := false
@onready var _text_label := $Box/Margin/TextLabel


func _ready() -> void:
	visible = _initial_visible
	assert(not dialog_path.is_empty(), "Dialog is not loaded!")
	_dialog = _load_dialog()


func _input(event: InputEvent) -> void:
	if not visible:
		return
	if not event is InputEventMouse:
		return
	visible = false


func display_dialog(id: StringName) -> void:
	visible = true
	_text_label.bbcode_text = &"[center]" + _dialog[id] + &"[/center]"


func _load_dialog() -> Dictionary:
	var _file := FileAccess.open(dialog_path, FileAccess.READ)
	var _content := _file.get_as_text()
	var _json: Dictionary = JSON.parse_string(_content)
	assert(typeof(_json) == TYPE_DICTIONARY, "Structure from json is not dictionary!")
	return _json
