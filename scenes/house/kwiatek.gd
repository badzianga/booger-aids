extends Sprite2D

@onready var markers := $Node.get_children()
var ticks := 0


func _physics_process(_delta: float) -> void:
	ticks -= 1
	if ticks <= 0:
		ticks = randi_range(1, 5)
		global_position = markers[randi_range(0, 1)].global_position
	
