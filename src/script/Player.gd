extends KinematicBody2D

signal player_dmg

var GRAVITY = 19.8
var UP = Vector2(0, -1)
var JUMP_STRENGTH = -450
var ACCELERATION = 40
var MOVE_SPEED = 300

onready var SPRITE = get_node('Sprite')
onready var TRIDENT = preload("res://scenes/Trident.tscn")

var has_trident = false
var is_facing_left = false
export var can_move = true
export var can_laser = false

var move = Vector2(0, GRAVITY)

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.has_power(global.JUMP):
		JUMP_STRENGTH = -650
	if global.has_power(global.LASER):
		can_laser = true

	if is_facing_left:
		SPRITE.flip_h = true

	$Area2D.connect("area_entered", self, "on_area_enter")
	$colourtimer.connect("timeout", self, "revert_colour")


#warning-ignore:unused_argument
func _physics_process(delta):
	move.y += GRAVITY

	if is_on_floor():

		if can_move:

			if Input.is_action_pressed("ui_jump"):
				ground_jump()

			elif Input.is_action_pressed("ui_left"):
				ground_move_left()

			elif Input.is_action_pressed("ui_right"):
				ground_move_right()

			elif Input.is_action_pressed("ui_attack") and can_laser:
				if not has_trident:
					trident()

			else:
				ground_idle()


	else:
		if can_move:
			if Input.is_action_pressed("ui_left"):
					air_move_left()
			elif Input.is_action_pressed("ui_right"):
				air_move_right()

		if SPRITE.animation != "jump":
			SPRITE.play("jump")

	move = move_and_slide(move, UP)




func ground_jump():
	move.y = JUMP_STRENGTH
	SPRITE.play("jump")
	#JUMP.play()

func ground_move_left():
	move.x = max(move.x - ACCELERATION, -MOVE_SPEED)
	SPRITE.flip_h = true
	is_facing_left = true
	SPRITE.play("run")

func ground_move_right():
	move.x = min(move.x + ACCELERATION, MOVE_SPEED)
	SPRITE.flip_h = false
	is_facing_left = false
	SPRITE.play("run")

func ground_idle():
	move.x = lerp(move.x, 0, 0.2)
	SPRITE.play("idle")

func air_move_left():
	move.x = max(move.x - ACCELERATION, -MOVE_SPEED)
	SPRITE.flip_h = true
	is_facing_left = true

func air_move_right():
	move.x = min(move.x + ACCELERATION, MOVE_SPEED)
	SPRITE.flip_h = false
	is_facing_left = false

func trident():
	var trident = TRIDENT.instance()
	trident.position = Vector2(0,0)
	if is_facing_left:
		trident.set_dir_mod(-1)
	else:
		trident.set_dir_mod(1)

	trident.connect("returned", self, "on_trident_return")

	self.add_child(trident)
	has_trident = true

func on_trident_return():
	has_trident = false

func face_left():
	SPRITE.flip_h = true


func on_area_enter(area):
	if area.name == "Wave" or area.name == "Showboater":
		emit_signal("player_dmg")
		$Sprite.modulate = "808000"
		$colourtimer.start()

func revert_colour():
	$Sprite.modulate = "ffffff"

