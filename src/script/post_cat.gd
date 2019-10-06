extends Node2D

signal finished_displaying

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Old Lady", "Oh, thank you kind stranger."]},
		{"target": DB, "method": "show_dialogue", "args": ["Old Lady", "What is your name, brave hero?"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "I am PlainMan! Greatest superhero in the universe!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Old Lady", "Cane Man? Oh, that's sweet."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "No, PlainMan. "]},
		{"target": DB, "method": "show_dialogue", "args": ["Old Lady", "Oh, I see. Well I'm sorry my cat scrathed you Rain Man. Good thing you already had super powers."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Err, yes. Good thing indeed."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Fairwell good citizen."]},
		{"target": self, "method": "change_bg", "args": ["res://assets/art/fmv/intro-pm-costume.png"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "The cat scratch had given PlainMan a superpower."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "However, it was only the power to earn other superpowers by working hard."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Unfazed, PlainMan headed to the location of Hero Well."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Luckily for him, there was a nearby farm where he could train to earn some powers."]},
		{"target": self, "method": "load_hub", "args": []},
	])

func change_bg(bg):
	$Sprite.texture = load(bg)
	emit_signal("finished_displaying")

func load_hub():
	get_tree().change_scene_to(load("res://scenes/GoingToTown.tscn"))