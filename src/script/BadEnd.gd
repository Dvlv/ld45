extends Node2D

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Ahahahaha. AHAHAHAHAHA!!"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Now who's the greatest superhero in the world, Showboater?"]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Y-You're no hero. You're a stone-cold villain... *cough*"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Hush puny mortal! You bow to PlainMan now! Beg for mercy!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "And so, PlainMan accomplished his goal of besting Showboater."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "However, in the process, he lost sight of his goal to become a hero, and instead became"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "PainMan - World's Deadliest Supervillain!"]},
		{"target": self, "method": "end", "args": []},
	])

func end():
	get_tree().change_scene_to(load("res://scenes/end.tscn"))