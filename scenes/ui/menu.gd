extends TextureRect

const Game := preload("res://scenes/house/house.tscn")


func _ready() -> void:
	Diary.set_process(false)
	Diary.set_physics_process(false)
	Diary.set_process_input(false)
	TvLayer.visible = false
	TvLayer.set_physics_process(false)
	UserInterface.visible = false
	UserInterface.set_physics_process(false)


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(Game)


func _on_quit_pressed() -> void:
	get_tree().quit()
