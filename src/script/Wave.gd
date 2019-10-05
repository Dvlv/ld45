extends Node2D

var moves = false
var dir_mod = 1

export var speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if not moves:
		return

	position.x = position.x + (speed * dir_mod)
	if position.x > 1200 or position.x < -200:
		self.queue_free()

func set_dir_mod(dm):
	dir_mod = dm
	if dm == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false