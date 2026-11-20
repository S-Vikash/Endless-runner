extends CharacterBody3D

@export var pos_offset:float = 3
var target_pos:float

@export var g:float = 10
@export var jump_h:float = 5
var jump_speed:float

func _ready() -> void:
	jump_speed = sqrt(2 * g * jump_h)

func _physics_process(delta: float) -> void:
	move(delta)
	jump(delta)
	move_and_slide()
	
func move(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		target_pos -= pos_offset

	elif Input.is_action_just_pressed("right"):
		target_pos += pos_offset

	position.x = lerpf(position.x, target_pos,10 * delta)
		
func jump(delta:float)->void:
	if(not is_on_floor()):
		velocity.y -= g * delta
	else:
		velocity.y = 0
		if(Input.is_action_just_pressed("jump")):
			velocity.y = jump_speed
	
