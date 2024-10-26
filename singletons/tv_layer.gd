extends CanvasLayer

@onready var _white := $White
@onready var _static_noise := $StaticNoise
@onready var _timer := $Timer
@onready var funny_noise := $FunnyNoise

signal noise_finished


# TODO: temporary for testing purposes
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		enable_noise(randf_range(0.1, 0.4))
	funny_noise.position.y += delta * 400
	if funny_noise.position.y >= 1000:
		funny_noise.position.y = -250


func enable_noise(time: float) -> void:
	_static_noise.playing = true
	_white.visible = true
	_timer.start(time)


func _on_timer_timeout() -> void:
	_static_noise.playing = false
	_white.visible = false
	noise_finished.emit()
