extends Node2D

signal chicken_caught

var direction_mod = 1
var move_speed = 8
export var max_move = 400
var position_diff_total = 0



func _physics_process(delta):
	var position_delta = move_speed * direction_mod
	position.x = position.x + position_delta
	position_diff_total += position_delta

	if abs(position_diff_total) > max_move:
		swap_dir()
		position_diff_total = 0


func catch():
	emit_signal("chicken_caught")
	self.queue_free()

func swap_dir():
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	direction_mod *= -1

func on_touch(body):
	if body.name == "Player":
		catch()