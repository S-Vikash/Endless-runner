extends StaticBody3D

func _process(delta: float) -> void:
	position.z += GameManager.get_pform_speed() * delta
