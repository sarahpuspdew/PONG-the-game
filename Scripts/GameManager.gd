extends Node2D

signal toggle_game_paused(is_paused)
signal score_updated(player, score)
signal player_won(player)

enum Player{
	P1,
	P2,
}

var score = {
	Player.P1: 0,
	Player.P2: 0,
}

var max_score : int = 10

var game_started : bool = false
var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		toggle_game_paused.emit(game_paused)


func _input(event : InputEvent):
	if game_started:
		if event.is_action_pressed("pause"):
			game_paused = !game_paused


func start_game():
	game_started = true
	
	for child in score:
		score[child] = 0
		score_updated.emit(child, score[child])


func exit_game():
	game_started = false


func add_score(player : Player):
	score[player] += 1
	score_updated.emit(player, score[player])
	
	if score[player] == max_score:
		player_won.emit(player)
