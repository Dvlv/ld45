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

onready var frame1 = preload("res://assets/art/horse-1.png")
onready var frame2 = preload("res://assets/art/horse-2.png")

var current_key = null
var correct_counter = 0
var anim_change_thresh = 5
var anim_change_step = 0
var correct_limit = 50

var current_horse_anim = "horse-1"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CurrentKey.visible = false
	rb.connect("timeout", self, "begin")
	set_process_input(true)
	rb.start()


func _input(event):
	if event is InputEventKey and event.pressed and not event.is_echo():
		if event.scancode == current_key:
			correct_counter += 1
			anim_change_step += 1
			if anim_change_step >= anim_change_thresh:
				anim_change_step = 0
				$background.position.x = $background.position.x - 10
				$AudioStreamPlayer2D.play()

				if current_horse_anim == "horse-1":
					$PlayerAndHorse.texture = frame2
					current_horse_anim = "horse-2"
				else:
					$PlayerAndHorse.texture = frame1
					current_horse_anim = "horse-1"

		else:
			correct_counter -= 1
			if correct_counter < 0:
				correct_counter = 0

		$ProgressBar.value = 2 * correct_counter
		if correct_counter > correct_limit:
			end_scene()

func begin():
	randomize()
	$CurrentKey.visible = true
	set_current_key()
	ks.connect("timeout", self, "set_current_key")
	ks.start()

func set_current_key():
	current_key = POSSIBLE_KEYS[randi() % POSSIBLE_KEYS.size()]
	ck.texture = load(KEYS_TO_IMG[current_key])

func end_scene():
	global.give_power(global.SUPER_STRENGTH)
	global.has_pulled_horse = true
	get_tree().change_scene_to(load("res://scenes/pre_horse.tscn"))


