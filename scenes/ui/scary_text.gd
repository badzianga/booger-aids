extends ColorRect

@onready var text := $Margin/Text

const texts := {
	"me": {
		"text": "IT'S ME.",
		"level": 100,
		"connected": 0,
	},
	"basement": {
		"text": "TO THE BASEMENT
TO THE BASEMENT
TO THE BASEMENT
TO THE BASEMENT",
		"level": 80,
		"connected": 0,
	},
	"deserve": {
		"text": "THEY DESERVED IT.",
		"level": 40,
		"connected": 0,
	},
	"why": {
		"text": "WHY?",
		"level": 100,
		"connected": 0,
	},
	"game": {
		"text": "
IT'S JUST A GAME

",
		"level": 160,
		"connected": 1,
	}
}


func _ready() -> void:
	set_text("game")


func set_text(id: String) -> void:
	text.text = "[shake rate=20.0 level=%d connected=%d][center]%s[/center][/shake]" % [
		texts[id]["level"], texts[id]["connected"], texts[id]["text"]
	]
