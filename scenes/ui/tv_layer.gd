extends CanvasLayer

@onready var _noise := $Noise
@onready var _static_noise := $StaticNoise

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


func turn_noise(enabled: bool) -> void:
	_static_noise.playing = enabled
	_noise.visible = enabled
