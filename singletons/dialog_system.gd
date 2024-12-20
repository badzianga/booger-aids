extends CanvasLayer

signal closed

@onready var _initial_visible := false
@onready var _text_label := $Control/Box/Margin/TextLabel
@onready var wait_timer: Timer = $WaitTimerBecauseIHaveStupid
@onready var whispering: AudioStreamPlayer = $Whispering


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
	#print("And now dialog is hidden. Bruh!")
	whispering.stop()
	closed.emit()
	GlobalVariables.can_noise = true
	Diary.set_process_input(true)


func display_dialog(id: String) -> void:
	visible = true
	_text_label.bbcode_text = &"[center]" + GlobalVariables.descriptions[id]["text"] + &"[/center]"
	get_tree().paused = true
	#print("Dialog ", id, " displayed")
	GlobalVariables.can_noise = false
	whispering.play()
	Diary.set_process_input(false)

func display_dialog_cursed(id: String) -> void:
	visible = true
	_text_label.bbcode_text = &"[center][color=#b40000]" + GlobalVariables.descriptions[id + "_fuck"]["text"] + &"[/color][/center]"
	get_tree().paused = true
	#print("Dialog ", id, " displayed")
	GlobalVariables.can_noise = false
	whispering.play()
	Diary.set_process_input(false)
