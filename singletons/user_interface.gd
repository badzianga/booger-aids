extends CanvasLayer

@export var _max_bar_value := 120.0
@export var _time_increase_multiplier := 4.0

@onready var _energy_bar := $Margin/EnergyBar


func _ready() -> void:
	_energy_bar.max_value = _max_bar_value
	_energy_bar.value = _max_bar_value


func set_enabled(enabled: bool) -> void:
	set_physics_process(enabled)


func increase_time(delta: float) -> void:
	_energy_bar.value = min(_energy_bar.value + delta * _time_increase_multiplier, _max_bar_value)
	#_light_level.energy = 1.0 - (_energy_bar.value / _max_bar_value)


func _physics_process(delta: float) -> void:
	_energy_bar.value = max(0.0, _energy_bar.value - delta)
	#_light_level.energy = 1.0 - (_energy_bar.value / _max_bar_value)
	if _energy_bar.value == 0.0:
		set_physics_process(false)
		print("Bardzo się starałeś ale przejebałeś!")
		TvLayer.enable_noise(3.0)
		await TvLayer.noise_finished
		get_tree().quit()
