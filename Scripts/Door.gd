extends Node2D

export (String, FILE, "*.tscn") var level_scene

func _on_Area2D_body_entered(body):
	if(body.get_name() == "Player"):
		get_tree().change_scene(level_scene)
