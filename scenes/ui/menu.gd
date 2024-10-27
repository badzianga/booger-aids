extends TextureRect

const Game := preload("res://scenes/house/house.tscn")


func _ready() -> void:
	pass # Replace with function body.
	# TODO: disable all singletons for now


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(Game)
