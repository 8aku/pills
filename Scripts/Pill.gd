extends Node2D

onready var micro_shader = get_node("/root/PillShader")
onready var shader_script = preload("res://Scripts/PillShader.shader")
onready var player = get_parent().get_node("Player")
var _time_length = 6
var _fade_in_time = 2
var _fade_out_time = 5

func eat_pill():
	print('ate a pill!')
	micro_shader.micro_effect(shader_script, _time_length, _fade_in_time, _fade_out_time)
	if (player.health == 0):
		print('you are dead. show dealth screen menu')
	else:
		player.health -= 2

func _on_Area2D_body_entered(body):
	if (body.get_name() == 'Player'):
		eat_pill()
		queue_free()


