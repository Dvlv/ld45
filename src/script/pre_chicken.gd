extends Node2D

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	if not global.has_caught_chickens:
		global.animated_scene([
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Gee, you gotta help me mister."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "My chickens are all over the place. I need to round them up."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "But they be flying, cuz they know I can't jump with my old knees."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Can you like, catch them all for me?"]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "This sounds like a job for PlainMan!"]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Fear not old farmer, I will catch all of your chickens for you."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "And I'll do a better job than Showboater ever could!"]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Gee, thanks mister."]},
			{"target": self, "method": "play_chicken", "args": []},
		])
	else:
		global.animated_scene([
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Alas citizen, I, PlainMan, have saved all of your valuable chickens."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Gee, thanks Plane Man. Must've been useful being an airplane and all."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "I'm not a... It's \"plain\" not \"plane\"... Oh nevermind."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "You are welcome, humble farming man. If you ever need anything more, call PlainMan (not Showboater)."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Gee, I sure will Plate Man."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "... Fairwell!"]},
			{"target": DB, "method": "show_dialogue", "args": ["Narrator", "PlainMan dashed off to find his next adventure."]},
			{"target": DB, "method": "show_dialogue", "args": ["Narrator", "All of that jumping seemed to have made his legs much stronger."]},
			{"target": DB, "method": "show_dialogue", "args": ["Narrator", "PlainMan had gained the ability to super jump. Now his leaps would be much higher."]},
			{"target": self, "method": "end_scene", "args": []},
		])

func play_chicken():
	get_tree().change_scene_to(load("res://scenes/chicken_game.tscn"))

func end_scene():
	get_tree().change_scene_to(load("res://scenes/GoingToTown.tscn"))