extends KinematicBody2D

var GRAVITY = 19.8
var UP = Vector2(0, -1)
var JUMP_STRENGTH = -375
var ACCELERATION = 40
var MOVE_SPEED = 100

onready var SPRITE = get_node('Sprite')

var forced_anim = null
var is_facing_left = false
export var can_move = true
export var can_laser = false

var move = Vector2(0, GRAVITY)

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.has_power(global.SPEED):
		MOVE_SPEED = 200
	if global.has_power(global.JUMP):
		JUMP_STRENGTH = -750
	if global.has_power(global.LASER):
		can_laser = true
	if global.has_power(global.SUPER_STRENGTH):
		pass # TODO attacking

	if is_facing_left:
		SPRITE.flip_h = true


#warning-ignore:unused_argument
func _physics_process(delta):
	move.y += GRAVITY

	if is_on_floor():

		if Input.is_action_pressed("ui_jump"):
			ground_jump()

		if can_move:
			if Input.is_action_pressed("ui_left"):
				ground_move_left()

			elif Input.is_action_pressed("ui_right"):
				ground_move_right()

			else:
				ground_idle()

		if forced_anim:
			SPRITE.play(forced_anim)

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



func play_run_animation():
	forced_anim = "run"
	SPRITE.play("run")

func face_left():
	SPRITE.flip_h = true