extends Node2D

onready var player = get_parent().get_node("Player")
var MAX_WIDTH = 20.0

func _process(delta):
	var health_ratio = float(player.health) / float(player.MAX_HEALTH)
	get_node("ColorRect").rect_size.x = health_ratio * MAX_WIDTH
