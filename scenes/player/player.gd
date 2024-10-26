extends CharacterBody2D

@export var speed := 400

var target: Vector2

@onready var sprite := $Sprite


func _ready() -> void:
	target = position


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"click"):
		target.x = get_global_mouse_position().x


func _physics_process(_delta: float) -> void:
	velocity = position.direction_to(target) * speed
	
	if position.distance_to(target) > 10:
		if velocity.x > 0:
			sprite.flip_h = false
			sprite.position.x = 16
		else:
			sprite.flip_h = true
			sprite.position.x = -16
		move_and_slide()
