extends CanvasLayer

@onready var _white := $White
@onready var _static_noise := $StaticNoise
@onready var _timer := $Timer
@onready var funny_noise := $FunnyNoise

const ScaryTextScene := preload("res://scenes/ui/scary_text.tscn")

signal noise_finished


# TODO: temporary for testing purposes
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		random_noise()
	funny_noise.position.y += delta * 400
	if funny_noise.position.y >= 1000:
		funny_noise.position.y = -250
	if GlobalVariables.can_noise:
		if randi_range(0, 1000) == 0:
			_static_noise.playing = true
			_white.visible = true
			_timer.start(randf_range(0.1, 0.3))


func random_noise() -> void:
	enable_noise(randf_range(0.3, 0.6))


func enable_noise(time: float) -> void:
	_static_noise.playing = true
	_white.visible = true
	_timer.start(time)
	get_tree().paused = true  # TODO: will this backfire???


func _on_timer_timeout() -> void:
	_static_noise.playing = false
	if randi_range(0, 3) == 0:  ## 33% chance for spooky
			var scary := ScaryTextScene.instantiate()
			scary.random_text()
			$White.add_child(scary)
			await get_tree().create_timer(randf_range(0.6, 2.0)).timeout
			scary.queue_free()
	_white.visible = false
	noise_finished.emit()
	get_tree().paused = false
