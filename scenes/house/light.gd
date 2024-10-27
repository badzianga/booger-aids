extends Sprite2D


func _ready() -> void:
	GlobalVariables.lights.append($PointLight2D)
