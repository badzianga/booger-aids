extends CanvasLayer

signal closed

@onready var _initial_visible := false
@onready var _text_label := $Control/Box/Margin/TextLabel
@onready var wait_timer: Timer = $WaitTimerBecauseIHaveStupid


func _ready() -> void:
	visible = _initial_visible


func _input(event: InputEvent) -> void:
	if not wait_timer.is_stopped():
		return
	if not visible:
		return
	if not event.is_action_pressed("click"):
		return
	visible = false
	get_tree().paused = false
	print("And now dialog is hidden. Bruh!")
	closed.emit()


func display_dialog(id: String) -> void:
	visible = true
	_text_label.bbcode_text = &"[center]" + GlobalVariables.dialogs[id] + &"[/center]"
	get_tree().paused = true
	print("Dialog ", id, " displayed")
