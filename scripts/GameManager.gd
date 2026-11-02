extends Node

var pform_start_speed:float = 4
var pform_acc: float = 2
var pform_maxspeed: float = 20
var _curr_speed:float = pform_start_speed

func _process(delta: float) -> void:
	update_pform_speed(delta)
	
func update_pform_speed(delta:float)->void:
	_curr_speed += pform_acc * delta
	_curr_speed = minf(_curr_speed, pform_maxspeed)

func get_pform_speed()->float:
	return _curr_speed
	
 
