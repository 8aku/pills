extends Node

var on_micro = false
var micro_timer
var micro_canvas
var micro_shader
var _fade_out_time
var _fade_in_time
var _amount

func _ready():
	pass

func _process(_delta):
	if (on_micro):
		_amount = min((micro_timer.wait_time - micro_timer.time_left) / _fade_in_time, 1.0)
		micro_shader.material.set_shader_param("amount", _amount)
		
		if (micro_timer.time_left <= _fade_out_time):
			_amount = micro_timer.time_left / _fade_out_time
			micro_shader.material.set_shader_param("amount", _amount)
	
func micro_effect(micro_shader_script, time_length, fade_in_time, fade_out_time):
	if (!on_micro):
		micro_shader = ColorRect.new()
		micro_canvas = CanvasLayer.new()
		micro_timer = Timer.new()
		_fade_in_time = fade_in_time
		_fade_out_time = fade_out_time
		micro_shader.rect_size = OS.get_window_size()
		micro_shader.material = ShaderMaterial.new()
		micro_shader.material.shader = micro_shader_script
		micro_canvas.add_child(micro_shader)
		add_child(micro_canvas)
		init_micro_timer(time_length)

func micro_timer_timeout():
	micro_timer.stop()
	on_micro = false
	micro_canvas.queue_free()

func init_micro_timer(time_length):
	on_micro = true
	add_child(micro_timer)
	micro_timer.connect("timeout", self, "micro_timer_timeout")
	micro_timer.set_wait_time(time_length)
	micro_timer.set_one_shot(false)
	micro_timer.start()
