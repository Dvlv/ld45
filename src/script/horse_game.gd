extends Node2D

# Declare member variables here. Examples:
var POSSIBLE_KEYS = [KEY_K, KEY_J, KEY_L, KEY_H, KEY_I, KEY_O]

var KEYS_TO_IMG = {
	KEY_K: "res://assets/art/key_k.svg",
	KEY_J: "res://assets/art/key_j.svg",
	KEY_L: "res://assets/art/key_l.svg",
	KEY_H: "res://assets/art/key_h.svg",
	KEY_I: "res://assets/art/key_i.svg",
	KEY_O: "res://assets/art/key_o.svg",
}

onready var ks = get_node("KeySwitch")
onready var rb = get_node("RoundBegin")
onready var ck = get_node("CurrentKey")

var current_key = null
var correct_counter = 0
var correct_limit = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	rb.connect("timeout", self, "begin")
	set_process_input(true)


func _input(event):
	if event is InputEventKey:
		if event.scancode == current_key:
			correct_counter += 1
			# play animation
		else:
			correct_counter -= 1
			# play animation

func begin():
	randomize()
	set_current_key()
	ks.connect("timeout", self, "set_current_key")

func set_current_key():
	current_key = POSSIBLE_KEYS[randi() % POSSIBLE_KEYS.size()]
	ck.texture = load(KEYS_TO_IMG[current_key])




