extends Node2D

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Ouch!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Come now PlainMan, let us stop this pointless fighting!"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Actually, my name's not Pl..."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Hey, you got my name correct."]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Of course. Come now, we used to be such good friends. Where did it all go wrong?"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "I guess I got jealous of your success. Will you ever forgive me?"]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Of course. You know, you're pretty strong. I could use a partner in crime (prevention)."]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "What do you say? Like old times?"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "How could I refuse?"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "And so Showboater and PlainMan became friends again, and continued to fight crime as the world's most powerful superheros."]},
		{"target": self, "method": "end", "args": []},
	])

func end():
	get_tree().change_scene_to(load("res://scenes/thanks.tscn"))