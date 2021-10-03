extends Node2D

onready var micro_shader = get_node("/root/PillShader")
onready var shader_script = preload("res://Scripts/PillShader.shader")
onready var player = get_parent().get_node("Player")
onready var player_stats = get_node("/root/PlayerStats")
var _time_length = 6
var _fade_in_time = 1
var _fade_out_time = 2

func eat_pill():
	print('ate a pill!')
	if (player_stats.health == 0):
		micro_shader.micro_effect(shader_script, 20, _fade_in_time, _fade_out_time)
		player.die()
	else:
		micro_shader.micro_effect(shader_script, _time_length, _fade_in_time, _fade_out_time)
		player_stats.health -= 2

func _on_Area2D_body_entered(body):
	if (body.get_name() == 'Player'):
		eat_pill()
		queue_free()


