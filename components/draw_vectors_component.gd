extends Node2D
class_name DrawVectorsComponent

@export var move_component: MoveComponent

func _draw():
	draw_vectors()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()

func draw_vectors() -> void:
	draw_line(Vector2.ZERO, move_component.velocity * move_component.speed, Color.DARK_GREEN, 5)
	draw_line(Vector2.ZERO, move_component.acceleration * 7.5, Color.YELLOW, 5)
	
	if move_component is HomingMoveComponent:
		draw_line(Vector2.ZERO, move_component.desired_velocity, Color.REBECCA_PURPLE, 5.0)
