extends Node2D

onready var DB = $CanvasLayer/DialogueBox
# Called when the node enters the scene tree for the first time.
func _ready():
	if not global.has_pulled_horse:
		global.animated_scene([
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Hey there jumpy fella."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Howdy good citizen. Can I be of assistance?"]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Maybe. Are ya that Brain Man people be talkin' about?"]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Erm, Maybe I might be. It's actually Plai..."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "That's good enough fer me. Ma horse has run over there, and he's super strong."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "I need one of dem super heros to pull him back over here, see."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Hahaha, such a simple task for the great and powerful PLAINMAN!"]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Rest assured I will have that horse back here faster than you can say \"neigh\"."]},
			{"target": self, "method": "play_horse", "args": []},
		])
	else:
		global.animated_scene([
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Woah now, Betty. Der's a good horsey."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "There's your horse, safe and sound, thanks to the great and powerful PlainMan."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "Much obliged, sir."]},
			{"target": DB, "method": "show_dialogue", "args": ["Farmer", "You want some of my wheat as a reward, Grain Man?"]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Erm, no thank you citizen, and it's \"plain\", I have a P on my costume and..."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Nevermind, I'm off to Hero Well to realise my true potential."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Good day!"]},
			{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Pulling such a strong horse gave PlainMan immeasurable strength increases."]},
			{"target": DB, "method": "show_dialogue", "args": ["Narrator", "He had gained the power of super strength!"]},
			{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Now he was strong enough to move even the heaviest of boulders."]},
			{"target": self, "method": "end_scene", "args": []},
		])

func play_horse():
	get_tree().change_scene_to(load("res://scenes/horse_game.tscn"))

func end_scene():
	get_tree().change_scene_to(load("res://scenes/GoingToTown.tscn"))