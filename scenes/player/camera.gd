extends Camera2D


func _ready() -> void:
	limit_left = $LeftLimit.global_position.x
	limit_right = $RightLimit.global_position.x
