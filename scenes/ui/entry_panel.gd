class_name EntryPanel
extends Panel


func _ready() -> void:
	update_title()


func update_title() -> void:
	var title: String = GlobalVariables.descriptions[name]["name"]
	if GlobalVariables.fuck_up_level >= GlobalVariables.fuck_ups_for_descriptions[name]:
		title += "_fuck"
	$Label.text = title
