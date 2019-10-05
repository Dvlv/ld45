extends Node2D

var num_chickens_left = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for chicken in $Chickens.get_children():
		chicken.connect("body_entered", chicken, "on_touch")

		chicken.connect("chicken_caught", self, "on_chicken_catch")

	num_chickens_left = $Chickens.get_child_count()

func on_chicken_catch():
	num_chickens_left = $Chickens.get_child_count() - 1

	if num_chickens_left == 0:
		end_scene()

func end_scene():
	global.give_power(global.JUMP)
	print("end")




