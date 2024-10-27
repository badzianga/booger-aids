extends Node2D


func _ready() -> void:
	TvLayer.noise_finished.connect(_on_noise_finished)
	_randomize_windows()


func _randomize_windows() -> void:
	for window: Sprite2D in get_children():
		window.visible = randi_range(0, 1)


func _on_noise_finished() -> void:
	_randomize_windows()
