extends CanvasLayer

@onready var _white := $White
@onready var _static_noise := $StaticNoise
@onready var _timer := $Timer


# TODO: temporary for testing purposes
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		enable_noise(randf_range(0.2, 0.5))


func enable_noise(time: float) -> void:
	_static_noise.playing = true
	_white.visible = true
	_timer.start(time)


func _on_timer_timeout() -> void:
	_static_noise.playing = false
	_white.visible = false
