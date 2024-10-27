extends Marker2D


func _ready() -> void:
	$AnimationPlayer.play("moving")
	$AnimationPlayer.seek(randf_range(0.0, 3.0))


func _physics_process(_delta: float) -> void:
	if global_position.distance_to(GlobalVariables.player.global_position) < 200:
		$AnimationPlayer.stop()
		var tween := create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.6)
		tween.tween_callback(queue_free)
