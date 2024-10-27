extends ColorRect

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
	},
	"goulash": {
		"text": "
DELICIOUS
STEW

",
		"level": 100,
		"connected": 0,
	},
}


func random_text() -> void:
	var r: String = texts.keys().pick_random()
	#print("Picked random key for scary text: ", r)
	set_text(r)


func set_text(id: String) -> void:
	#print("Text content: ", texts[id]["text"])
	$Margin/Text.text = "[shake rate=20.0 level=%d connected=%d][center]%s[/center][/shake]" % [
		texts[id]["level"], texts[id]["connected"], texts[id]["text"]
	]
