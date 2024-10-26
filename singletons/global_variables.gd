extends Node

const dialogs := {
	
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
		"name": "Grandpa's peg leg",
		"text": "A well-worn prosthetic, sturdy and crafted with care, representing Grandpa's resilience and journey through the years.",
	},
	"leg_fuck": {
		"name": "Geezer's leg",
		"text": "A symbol of the old man's strange preferences.",
	},
	"puppets": {
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
}

var current_interactable: Interactable = null
var fuck_up_level := 0  # a.k.a. collectibles found
var player: Player = null
