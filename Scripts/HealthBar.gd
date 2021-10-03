extends Node2D

onready var player_stats = get_node("/root/PlayerStats")
var MAX_WIDTH = 20.0

func _process(delta):
	var health_ratio = float(player_stats.health) / float(player_stats.MAX_HEALTH)
	get_node("ColorRect").rect_size.x = float(health_ratio) * float(MAX_WIDTH)
