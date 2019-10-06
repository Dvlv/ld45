extends Node2D

var sb_hp = 10
var player_hp = 10

onready var spawns = $sb_spawn.get_children()
var current_spawn = null
var next_spawn = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.JUMP_STRENGTH = -650
	$Player.can_laser = true

	$Showboater.connect("area_entered", $Showboater, "take_dmg_from_trident")

	$Showboater.connect("showboater_dmg", self, "showboater_dmg")
	$Player.connect("player_dmg", self, "player_dmg")


func showboater_dmg():
	sb_hp -= 1
	if sb_hp <= 0:
		print("sb dies")

	randomize()
	next_spawn = spawns[randi() % spawns.size()]
	while next_spawn == current_spawn:
		next_spawn = spawns[randi() % spawns.size()]

	$Showboater.global_transform.origin = next_spawn.get_global_transform().get_origin()
	current_spawn = next_spawn


	$CanvasLayer/sbhp.text = "Showboater HP: " + str(sb_hp)

func player_dmg():
	player_hp -= 1
	if player_hp <= 0:
		print("player dies")

	$CanvasLayer/php.text = "Player HP: " + str(player_hp)