extends Area2D

signal returned

var amt_moved = 0
var speed = 50
var max_move = 800
var dir_mod = 1
var returning = false

func _physics_process(delta):
	var move_amt = (speed * dir_mod)
	position.x = position.x + move_amt
	amt_moved += abs(move_amt)
	if amt_moved > max_move:
		if returning:
			emit_signal("returned")
			self.queue_free()
		else:
			returning = true
			amt_moved = 0
			dir_mod *= -1


func set_dir_mod(dm):
	dir_mod = dm
	if dm == 1:
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false