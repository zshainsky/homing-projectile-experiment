extends Node2D
class_name Projectile

const MAX_SPEED: float = 400.0
const MAX_FORCE: float = 0.75

@onready var sprite_2d: Sprite2D = $Sprite2D as Sprite2D

@onready var velocity: Vector2 = Vector2.RIGHT
@onready var acceleration: Vector2 = Vector2.RIGHT
@onready var desired_velocity: Vector2 = Vector2.RIGHT
@onready var target: Vector2 = get_global_mouse_position()
func _draw():
	draw_vectors()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target = get_global_mouse_position()
	
	update_sprite_directin()
	seek_target(target)
	move(delta)

func move(delta) -> void:
	velocity += acceleration
	velocity = velocity.limit_length(MAX_SPEED)
	global_position += velocity * delta
	queue_redraw()
	
func update_sprite_directin() -> void:
	#var angle_to_target = sprite_2d.global_position.angle_to_point(target) + deg_to_rad(90)
	sprite_2d.global_rotation = velocity.angle() + deg_to_rad(90)

func seek_target(target: Vector2) -> void:
	desired_velocity = (target - global_position).normalized() * MAX_SPEED
	var steer = (desired_velocity - velocity).limit_length(MAX_FORCE)
	acceleration += steer
	
func draw_vectors() -> void:
	draw_line(Vector2.ZERO, velocity, Color.DARK_GREEN, 5)
	draw_line(Vector2.ZERO, desired_velocity, Color.BLUE, 5)
	draw_line(Vector2.ZERO, acceleration * 10, Color.YELLOW, 5)
