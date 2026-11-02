extends Node3D

@export var platforms: Array[PackedScene]

@export var next_spawn_point:Node3D


func _ready() -> void:
	for i in range(5):
		spawn_chunk()

func spawn_chunk()->void:
	var chunk_scene:PackedScene = select_random_chunk()
	var chunk:Node3D = chunk_scene.instantiate()
	add_child(chunk)
	
	chunk.global_position = next_spawn_point.global_position
	next_spawn_point = chunk.get_node_or_null("next_spawn_point")
	

func select_random_chunk()->PackedScene:
	var choice:int = randi_range(0,len(platforms)-1)
	return platforms[choice]
