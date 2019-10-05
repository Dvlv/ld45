extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.JUMP_STRENGTH = -450

	$cat.connect("body_entered", self, "on_touch_cat")

func on_touch_cat(body):
	if body.name == "Player":
		print("Player touched cat")
	pass # play cutscene

