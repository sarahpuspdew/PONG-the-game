extends Area2D
class_name Goal

@export var for_player_point : GameManager.Player


func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if body is Ball:
		var ball : Ball = body
		
		GameManager.add_score(for_player_point)
		await get_tree().create_timer(1).timeout
		ball.reset()
