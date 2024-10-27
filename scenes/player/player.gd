class_name Player
extends CharacterBody2D

@export var speed := 400

var target: Vector2
var arrived := false
var just_arrived := false
var mouse_in_room := false  # set in room script

@onready var sprite := $Sprite
@onready var animation_player := $AnimationPlayer
@onready var step_brother_is_stepping := $StepBrotherIsStepping

var autistic_case: Interactable = null


func _ready() -> void:
	GlobalVariables.player = self
	target = position
	animation_player.play("idle")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"click"):
		if not mouse_in_room:
			return
		print("Clicked, so moving to position: ", global_position)
		# TODO: this sh!t will backfire for sure when
		if GlobalVariables.current_interactable != null:
			GlobalVariables.current_interactable.stop_interaction()
		GlobalVariables.current_interactable = null
		target.x = get_global_mouse_position().x


func _physics_process(_delta: float) -> void:
	velocity = position.direction_to(target) * speed
	
	if position.distance_to(target) > 8:
		animation_player.play("walk")
		if velocity.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
		move_and_slide()
	else:
		if Input.is_action_just_pressed("click") and autistic_case != null:
			if position.distance_to(target) < 32:
				autistic_case.interact()
				GlobalVariables.current_interactable = null
			#target.x = get_global_mouse_position().x
		animation_player.play("idle")


func step_sound() -> void:
	step_brother_is_stepping.pitch_scale = randf_range(0.9, 1.2)
	step_brother_is_stepping.play()


func stop() -> void:
	target = global_position
	velocity = Vector2.ZERO


func teleport_to(target_position: Vector2) -> void:
	target = target_position
	velocity = Vector2.ZERO
	global_position = target_position


func _on_interactable_area_area_entered(interactable: Interactable) -> void:
	print("Autistic case will be ", interactable.name, " now")
	if interactable == GlobalVariables.current_interactable:
		print("Arrived to the object, so interaction can take place")
		interactable.interact()
	autistic_case = interactable


func _on_interactable_area_area_exited(area: Interactable) -> void:
	print("Autistic case was ", area.name, ", now it will be null")
	if autistic_case == null:
		return  # I don't know what I am doing here
	autistic_case.stop_interaction()
	if autistic_case.name == area.name:
		autistic_case = null
