extends Node2D


onready var DB = $CanvasLayer/DialogueBox

func _ready():
	$Player.JUMP_STRENGTH = -475

	$cat.connect("body_entered", self, "on_touch_cat")

func on_touch_cat(body):
	if body.name == "Player":
		$Player.can_move = false
		$Player/Sprite.play("idle")
		$Player.force_stop = true

		global.animated_scene([
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Here kitty kitty"]},
			{"target": DB, "method": "show_dialogue", "args": ["Cat", "HISS!"]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Ouch! That cat scratched me."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "I guess that's what I wanted, although I didn't think it would hurt this much."]},
			{"target": DB, "method": "show_dialogue", "args": ["PlainMan", "Now, get out of this tree darned cat!"]},
			{"target": self, "method": "load_post_scene", "args": []}
		])


func load_post_scene():
	get_tree().change_scene_to(load("res://scenes/post_cat.tscn"))