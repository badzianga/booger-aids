class_name EntryPanel
extends Panel

signal custom_mouse_entered(panel_name: String)


func _ready() -> void:
	update_title()


func update_title() -> void:
	var key := name
	if GlobalVariables.fuck_up_level >= GlobalVariables.fuck_ups_for_descriptions[name]:
		key += "_fuck"
	var title: String = GlobalVariables.descriptions[key]["name"]
	$Label.text = title


func _on_mouse_entered() -> void:
	custom_mouse_entered.emit(name)
