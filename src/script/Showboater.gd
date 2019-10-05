extends Node2D

var attack_dir_mod = 1

var wave = preload("res://scenes/Wave.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$attacktimer.connect("timeout", self, "attack")

func attack():
	#var player_pos = global.get_player_position()
	var my_pos = get_global_transform().get_origin()

	#if my_pos.x < player_pos.x:
	#	attack_dir_mod = 1
	#else:
	#	attack_dir_mod = -1

	var new_wave = wave.instance()
	new_wave.set_dir_mod(attack_dir_mod)
	new_wave.position = Vector2(0, 0)
	self.add_child(new_wave)
	new_wave.moves = true
