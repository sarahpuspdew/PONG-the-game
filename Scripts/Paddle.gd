extends CharacterBody2D
class_name Paddle

@export var player : GameManager.Player

# movement
@export var max_speed : float = 350
@export var acceleration : float = 50
@export var decceleration : float = 60
var current_speed : float = 0
var direction


func _physics_process(delta):
	if player == GameManager.Player.P1 :
		direction = Input.get_action_strength("P1_down") - Input.get_action_strength("P1_up")
	elif player == GameManager.Player.P2:
		direction = Input.get_action_strength("P2_down") - Input.get_action_strength("P2_up")
	
	if direction:
		current_speed = move_toward(current_speed, max_speed, acceleration)
		velocity.y = current_speed * direction
	else:
		velocity.y = move_toward(velocity.y, 0, decceleration)

	move_and_collide(velocity * delta)
