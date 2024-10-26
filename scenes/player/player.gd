extends CharacterBody2D

@export var speed := 400

var target: Vector2
var arrived := false
var just_arrived := false

@onready var sprite := $Sprite


func _ready() -> void:
	target = position


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"click"):
		print("Clicked, so moving to position: ", global_position)
		# TODO: this sh!t will backfire for sure when
		if GlobalVariables.current_interactable != null:
			GlobalVariables.current_interactable.stop_interaction()
		GlobalVariables.current_interactable = null
		target.x = get_global_mouse_position().x


func _physics_process(_delta: float) -> void:
	velocity = position.direction_to(target) * speed
	
	if position.distance_to(target) > 16:
		if velocity.x > 0:
			sprite.flip_h = false
			sprite.position.x = 16
		else:
			sprite.flip_h = true
			sprite.position.x = -16
		move_and_slide()


func _on_interactable_area_area_entered(interactable: Interactable) -> void:
	if interactable == GlobalVariables.current_interactable:
		print("Arrived to the object, so interaction can take place")
		interactable.interact()
