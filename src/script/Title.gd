extends Node2D


func _ready():
	$Button.connect("pressed", self, "intro")
	$AudioStreamPlayer2D.play()

func intro():
	get_tree().change_scene_to(load("res://scenes/Intro.tscn"))

