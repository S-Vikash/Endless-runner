extends StaticBody3D

var spawner:Node3D

func _ready() -> void:
	spawner = get_tree().current_scene.get_node_or_null("spawner")

func _process(delta: float) -> void:
	position.z += GameManager.get_pform_speed() * delta


func _on_spawn_trigger_body_exited(body: Node3D) -> void:
	if(body.is_in_group("player")):
		spawner.spawn_chunk()
