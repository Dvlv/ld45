extends Node2D

var moves = false
var dir_mod = 1

export var speed = 10


func _physics_process(delta):
	if not moves:
		return

	position.x = position.x + (speed * dir_mod)
	var gp = get_global_transform().get_origin()
	if gp.x > 1900 or gp.x < -1200:
		self.queue_free()

func set_dir_mod(dm):
	dir_mod = dm
	if dm == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false