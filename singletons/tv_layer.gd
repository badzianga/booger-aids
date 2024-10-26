extends CanvasLayer

@onready var _white := $White
@onready var _static_noise := $StaticNoise
@onready var _timer := $Timer

#var just_pressed := false
#var pressed := false
#func _physics_process(_delta: float) -> void:
	#just_pressed = false
	#if Input.is_action_just_pressed("ui_accept"):
		#just_pressed = true
		#pressed = true
	#if Input.is_action_just_released("ui_accept"):
		#pressed = false
	#
	#if just_pressed:
		#turn_noise(true)
		#print("dupa")
	#if not pressed:
		#turn_noise(false)


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
