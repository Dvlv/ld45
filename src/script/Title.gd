extends Node2D


func _ready():
	$Button.connect("pressed", self, "intro")

func intro():
	get_tree().change_scene_to(load("res://scenes/Intro.tscn"))

