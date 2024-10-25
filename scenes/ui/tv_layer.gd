extends CanvasLayer

@onready var _noise := $Noise


func turn_noise(enabled: bool) -> void:
	_noise.visible = enabled
