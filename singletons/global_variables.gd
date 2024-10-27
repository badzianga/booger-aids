extends Node

signal item_collected

const dialogs := {
	"wig": "A frizzy, dusty-gray wig with thinning curls, looking like it’s seen a few too many decades on an old hag's head."
}

const fuck_ups_for_descriptions := {
	"casette": 3,
	"wig": 3,
	"finger": 4,
	"stew": 5,
	"leg": 5,
	"puppet": 99,
	"doll": 5,
}

const descriptions := {
	"casette": {
		"name": "\"Let's play a game\" casette",
		"text": "This weird game is in... game?",
	},
	"casette_fuck": {
		"name": "Let's play a game",
		"text": "Are you enjoying your game? Make sure to subsKILLbe and not leave any evidence.",
	},
	"wig": {
		"name": "Granny's wig",
		"text": "A soft, silvery-gray wig styled in gentle curls, reminiscent of Granny's classic look and comforting presence.",
	},
	"wig_fuck": {
		"name": "Old Hag's wig",
		"text": "A frizzy, dusty-gray wig with thinning curls, looking like it’s seen a few too many decades on an old hag's head.",
	},
	"leg": {
		"name": "Grandpa's peg? leg",
		"text": "A well-worn prosthetic, sturdy and crafted with care, representing Grandpa's resilience and journey through the years.",
	},
	"leg_fuck": {
		"name": "Geezer's leg",
		"text": "A symbol of the old man's strange preferences.",
	},
	"puppet": {
		"name": "You",
		"text": "You danced to their tune. It's good that in the end you danced on their grave.",
	},
	"doll": {
		"name": "Broken doll",
		"text": "A cherished, timeworn doll with a sweet, faded smile. Unfortunately, her original, beautiful eyes are missing.",
	},
	"doll_fuck": {
		"name": "Not-Anymore-Eyeless doll",
		"text": "This old man destroyed your precious treasure. So you destroyed him to ger your treasure a new eyes.",
	},
	"finger": {
		"name": "Severed finger",
		"text": "A small, preserved finger with softened lines and a curious stillness, holding the quiet memory of a once-busy hand.",
	},
	"finger_fuck": {
		"name": "Her finger",
		"text": "Her finger.",
	},
	"stew": {
		"name": "The Big Stew",
		"text": "This huge hole in the ground contains lots of chemicals... and some organic matter?",
	},
	"stew_fuck": {
		"name": "The Big Human Goulash",
		"text": "This huge hole in the ground contains a culinary masterpiece with very unique meat.",
	},
}

var collected: Array[String] = []

func collect(collectable_name: String, scary: bool = false) -> void:
	if collectable_name in collected:
		return
	if scary:
		DialogSystem.display_dialog_cursed(collectable_name)
	else:
		DialogSystem.display_dialog(collectable_name)
	DialogSystem.wait_timer.start()
	await DialogSystem.closed
	print("Dialog window closed, noise goes brrr")
	TvLayer.random_noise()
	collected.append(collectable_name)
	fuck_up_level += 1
	print("Collected: ", collectable_name, ", fuck_up_level increased to ", fuck_up_level)
	item_collected.emit()

var current_interactable: Interactable = null
var fuck_up_level := 0  # a.k.a. collectibles found
var player: Player = null
