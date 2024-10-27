extends Sprite2D

const SpookyMirror := preload("res://assets/home/lustro3.png")


func spook() -> void:
	texture = SpookyMirror


func _on_spook_area_body_entered(_body: Node2D) -> void:
	print("Boo!")
	spook()
	await get_tree().create_timer(0.1).timeout
	queue_free()
