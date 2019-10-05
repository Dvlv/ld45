extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	var DB = $CanvasLayer/DialogueBox

	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "Welcome to Hero Well."]},
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "In order to bathe in the well, you will need to answer three tough riddles."]},
	])

func after_questions():
	$civ.visible = false
	$plainman.visible = false
	$bg.texture = load("res://assets/art/well-2.png")