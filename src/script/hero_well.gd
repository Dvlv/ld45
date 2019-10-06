extends Node2D
signal finished_displaying

onready var DB = $CanvasLayer/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	bind_buttons()

	if global.has_ans_r_2:
		tell_riddle_three()
	elif global.has_ans_r_1:
		tell_riddle_two()
	else:

		global.animated_scene([
			{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "Welcome to Hero Well."]},
			{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "In order to bathe in the fountain, you will need to answer three tough riddles."]},
			{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "Riddle One"]},
			{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "I have hands, but cannot eat a sandwich. \nI have a face but cannot wear lipstick\nI produce ticks, but I am not a bug factory.\nWhat am I?"]},
			{"target": self, "method": "show_riddle_one", "args": []},
		])

func bind_buttons():
	$Answers/Riddle1/VBoxContainer/Button2.connect("pressed", self, "tell_riddle_two")
	$Answers/Riddle2/VBoxContainer/Button.connect("pressed", self, "tell_riddle_three")
	$Answers/Riddle3/VBoxContainer/Button3.connect("pressed", self, "finished_riddles")

	var wrong_buttons = [
		$Answers/Riddle1/VBoxContainer/Button,
		$Answers/Riddle1/VBoxContainer/Button3,
		$Answers/Riddle2/VBoxContainer/Button2,
		$Answers/Riddle2/VBoxContainer/Button3,
		$Answers/Riddle3/VBoxContainer/Button,
		$Answers/Riddle3/VBoxContainer/Button2,
	]

	for button in wrong_buttons:
		button.connect("pressed", self, "on_wrong_answer")




func show_riddle_one():
	$Answers/Riddle1.visible = true

func show_riddle_two():
	$Answers/Riddle2.visible = true

func show_riddle_three():
	$Answers/Riddle3.visible = true


func tell_riddle_two():
	$Answers/Riddle1.visible = false
	global.has_ans_r_1 = true
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "Prepare for Riddle Two."]},
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "What is black and white, and cooler than ice?"]},
		{"target": self, "method": "show_riddle_two", "args": []},
	])

func tell_riddle_three():
	$Answers/Riddle2.visible = false
	global.has_ans_r_2 = true
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "Last one."]},
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "A boat hits a wave and two passengers fall overboard.\n The captain throws down a 3 meter rope and it barely touches the water.\n The first passenger climbs up, but the rope breaks.\n Another wave pushes the boat out to waters 4 meters deeper.\n How long a rope does the captain need to save the other passenger?"]},
		{"target": self, "method": "show_riddle_three", "args": []},
	])

func finished_riddles():
	$Answers/Riddle3.visible = false
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "You have correctly answered all riddles!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "You may now bathe in the fountain, Stain Man, and find your true power."]},
		{"target": self, "method": "after_questions", "args": []},
	])


func on_wrong_answer():
	$Answers.visible = false
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "That is incorrect! You are not cut out to be a super hero."]},
		{"target": DB, "method": "show_dialogue", "args": ["Wise Man", "Begone! But come back soon."]},
		{"target": self, "method": "load_main_scene", "args": []}
	])

func after_questions():
	$civ.visible = false
	$plainman.visible = false
	$bg.texture = load("res://assets/art/well-2.png")

	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "Sitting in the well, PlainMan began to mediate, focusing on finding his superpowers."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Wow, there's a lot of change at the bottom of this well. Finders keepers?"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "No. I'm supposed to be a hero, not a thief."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "After this realisation, a large glowing trident appeared in front of PlainMan."]},
		{"target": self, "method": "show_trident", "args": []},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Neat."]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "PlainMan picked up the trident, and felt a strong power surge through his body."]},
		{"target": self, "method": "close_up", "args": []},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "I feel so powerful!\nHaha, Hahaha, AHAHAHAHAHAHAHAHAH!!!"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Look out Showboater, here I come!"]},
		{"target": DB, "method": "show_dialogue", "args": ["Narrator", "You can now press the A button to throw your trident"]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "At Showboater! Press A to throw the trident at Showboater!"]},
		{"target": self, "method": "end_scene", "args": []},
	])

func show_trident():
	$civ.texture = load("res://assets/art/trident.png")
	$civ.visible = true
	$plainman.visible = true
	$bg.texture = load("res://assets/art/well-1.png")
	emit_signal("finished_displaying")

func close_up():
	$civ.visible = false
	$plainman.visible = false
	$bg.texture = load("res://assets/art/well-3.png")
	emit_signal("finished_displaying")

func load_main_scene():
	get_tree().change_scene_to(load("res://scenes/GoingToTown.tscn"))

func end_scene():
	global.give_power(global.LASER)
	get_tree().change_scene_to(load("res://scenes/pre_boss.tscn"))