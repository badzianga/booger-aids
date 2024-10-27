class_name JumpscareBaluszkowoSobolewski
extends Sprite2D

@onready var boo: AudioStreamPlayer = $Boo


func activate_timer() -> void:
	$StartTimer.start()


func _on_start_timer_timeout() -> void:
	$AnimationPlayer.play("jumpscare")
	boo.play()
	$DurationTimer.start()


func _on_duration_timer_timeout() -> void:
	queue_free()
