extends Node2D
class_name MoveComponent

const MAX_SPEED: float = 400.0
@export var speed: float = 200.0
@export var actor: Node2D
@onready var velocity: Vector2 = Vector2.RIGHT
@onready var acceleration: Vector2 = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_sprite_direction()
	move(delta)

func move(delta) -> void:
	velocity += acceleration
	velocity = velocity.limit_length(MAX_SPEED)
	actor.global_position += velocity * speed * delta 

func update_sprite_direction() -> void:
	if actor is ProjectileComposition:
		var projectile: ProjectileComposition = actor as ProjectileComposition
		projectile.sprite_2d.global_rotation = velocity.angle() + deg_to_rad(90)

