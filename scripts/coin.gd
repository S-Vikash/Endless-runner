extends Area3D

@export var rotate_speed:float = 5
var time:float = 0

func _ready() -> void:
	body_entered.connect(on_body_entered)
	
func on_body_entered(body:Node3D)->void:
	if(body.is_in_group("player")):
		GameManager.increment_coins_count()
		destroy_coin()

func destroy_coin()->void:
	queue_free()

func _process(delta: float) -> void:
	rotation.y += rotate_speed * delta
