extends Node2D

signal finished_displaying

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Albert had always wanted to be a superhero."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "The problem was, he was just a plain man."]},
		{"target": self, "method": "change_bg", "args": ["res://assets/art/fmv/intro-pm-sb.png"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Albert's best friend had grown up with superpowers, and one day became a wordwide icon."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Albert was jealous, and called him \"Showboater\", as he was always showing off his powers."]},
		{"target": self, "method": "change_bg", "args": ["res://assets/art/fmv/intro-pm.png"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "One day, Albert read about a place called the Hero Well, which could multiply superpowers in anybody who sat inside its waters."]},
		{"target": DB, "method": "show_dialogue", "args": ["Albert", "In order to take down Showboater, I need to give myself superpowers somehow, then visit this well."]},
		{"target": DB, "method": "show_dialogue", "args": ["Albert", "Well, if I'm gonna be a superhero, I need a hero name."]},
		{"target": DB, "method": "show_dialogue", "args": ["Albert", "Since I'm a plain man, I guess I'll be PlainMan!"]},
		{"target": self, "method": "change_bg", "args": ["res://assets/art/fmv/intro-pm-costume.png"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Alright. Now, how can I get myself some superpowers?"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Perhaps if I visit Radioactive city and get bitten by a radioactive animal, my powers will awaken."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "It works in comic books..."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "And so Albert set out to Radioactive city."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "As his luck would have it, upon entering he heard a lady cry for help."]},
		{"target": self, "method": "change_bg", "args": ["res://assets/art/fmv/intro-pm-tree.png"]},
		{"target": DB, "method": "show_dialogue", "args": ["Old Lady", "You there, have you seen Showboater? I need a hero."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Showboater? Pfft, I'm ten times the hero he'll ever be!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Old Lady", "Oh that's wonderful! My radioactive cat is stuck in this radioactive tree. Please rescue her."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "That sounds within my capabilities. I can just jump on those dark branches to reach the top of the tree."]},
		{"target": self, "method": "load_cat_scene", "args": []}
	])

func change_bg(path):
	$bg.texture = load(path)
	emit_signal("finished_displaying")


func load_cat_scene():
	get_tree().change_scene_to(load("res://scenes/cat_game.tscn"))