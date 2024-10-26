extends CanvasLayer

@export var _max_bar_value := 100.0
@export var _time_increase_multiplier := 4.0

@onready var _energy_bar := $Margin/EnergyBar


func _ready() -> void:
	_energy_bar.max_value = _max_bar_value


func set_enabled(enabled: bool) -> void:
	set_physics_process(enabled)


func increase_time(delta: float) -> void:
	_energy_bar.value = max(_energy_bar.value + delta * _time_increase_multiplier, _max_bar_value)


func _physics_process(delta: float) -> void:
	_energy_bar.value -= delta
