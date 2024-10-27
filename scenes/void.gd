extends Sprite2D

const ROTATIONS_PER_SEC := 2.0 * PI

@onready var marker: Marker2D = get_parent()


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)


func _physics_process(delta: float) -> void:
	marker.rotation += delta * ROTATIONS_PER_SEC
