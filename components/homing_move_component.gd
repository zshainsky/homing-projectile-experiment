extends MoveComponent
class_name HomingMoveComponent

const MAX_FORCE: float = .75

@onready var target: Vector2 = get_global_mouse_position()
# Setting as class variable to make visualization easier
@onready var desired_velocity: Vector2 = (target - global_position).normalized() * MAX_SPEED
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target = get_global_mouse_position()
	update_sprite_direction()
	seek_target()
	move(delta)

func seek_target() -> void:
	desired_velocity = (target - global_position).normalized() * MAX_SPEED
	var steer = (desired_velocity - velocity).limit_length(MAX_FORCE)
	acceleration += steer
	
	
	
