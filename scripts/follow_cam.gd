extends Camera3D

@export var player:CharacterBody3D
@export var lerp_power:float = 5
@export var offset:Vector3

func _physics_process(delta: float) -> void:
	var target_pos:Vector3 = player.global_position + offset
	
	global_position = global_position.lerp(target_pos,
						lerp_power * delta)
