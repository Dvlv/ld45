extends Node2D

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "SHOWBOATER! We meet at last."]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Ugh, if you want an autograph you have to see me at an event..."]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "... Wait a sec, I know you."]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "I went to school with you. I heard you were trying to become a superhero."]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "What is it you call yourself? Pain Man?"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "No it's... actually, that's quite a fitting name for the guy who's about to defeat you once and for all!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Woah now, those are fighting words. Remember who you're dealing with."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Silence! I will deck you so hard you will sail off into the sun. Water terrible defeat it will be.\nYou can wave goodbye to your career. We will never sea you again!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Showboater", "Wow, you've been saving up those boat puns for a while now. I guess you're serious."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Let's do this!"]},
		{"target": self, "method": "load_fight", "args": []},
	])

func load_fight():
	get_tree().change_scene_to(load("res://scenes/bossfight.tscn"))