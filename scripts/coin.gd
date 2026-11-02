extends Area3D

@export var rotate_speed:float = 2

var time:float = 0
func _process(delta: float) -> void:
	time += delta
	rotation.y += sin(time * rotate_speed) * delta
