extends Label

@export var player_point : GameManager.Player


func _ready():
	GameManager.score_updated.connect(_on_score_updated)


func _on_score_updated(player : GameManager.Player, score : int):
	if player == player_point:
		text = str(score)
