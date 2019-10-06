extends Node2D

signal finished_displaying

onready var DB = $CanvasLayer/DialogueBox


func _ready():
	if not global.has_moved_boulder:
		$Boulder/Area2D.connect("body_entered", self, "on_boulder")
	else:
		$Boulder.queue_free()


func on_boulder(body):
	if body.name == "Player":
		if global.has_power(global.SUPER_STRENGTH):
			move_boulder()
		else:
			blocked_by_boulder()


func blocked_by_boulder():
	$Player.can_move = false
	$Player/Sprite.play("idle")

	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "I need to go to Hero Well, but I'm not strong enough to move that boulder."]},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Guess I'll have to look around for more training opportunities first."]},
		{"target": self, "method": "player_can_move", "args": []},
	])


func move_boulder():
	$Player.can_move = false
	$Player/Sprite.play("idle")
	global.has_moved_boulder = true
	global.animated_scene([
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Now I'm super strong, I can move this boulder."]},
		{"target": self, "method": "hide_boulder", "args": []},
		{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Woohoo, off to Hero Well."]},
		{"target": self, "method": "player_can_move", "args": []},
	])


func hide_boulder():
	$Boulder.queue_free()
	emit_signal("finished_displaying")

func player_can_move():
	$Player.can_move = true