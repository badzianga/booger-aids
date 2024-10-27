extends Marker2D


const OmoriScene := preload("res://scenes/house/omori.tscn")

var spawned := false


func _ready() -> void:
	$AnimationPlayer.play("moving")
	$AnimationPlayer.seek(randf_range(0.0, 3.0))


func _physics_process(_delta: float) -> void:
	if global_position.distance_to(GlobalVariables.player.global_position) < 200:
		if not spawned:
			if name == "SpookyArm":  # I hate myself
				var omori := OmoriScene.instantiate()
				omori.global_position = Vector2(252, 367)  # still hating myself
				get_parent().add_child(omori)
				spawned = true
		$AnimationPlayer.stop()
		var tween := create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.6)
		tween.tween_callback(queue_free)
