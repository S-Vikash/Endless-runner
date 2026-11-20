extends Node

signal GAME_OVER
signal UPDATE_COIN_SCORE

var pform_start_speed:float = 4
var pform_acc: float = 2
var pform_maxspeed: float = 20
var _curr_speed:float = pform_start_speed

##Score
var _run_score:float = 0
var _no_coins_collected:int = 0

func _process(delta: float) -> void:
	update_pform_speed(delta)

func update_pform_speed(delta:float)->void:
	_curr_speed += pform_acc * delta
	_curr_speed = minf(_curr_speed, pform_maxspeed)
	
func increment_run_score()->void:
	pass
	
func get_run_score()->float:
	return _run_score

func increment_coins_count()->void:
	_no_coins_collected += 1
	UPDATE_COIN_SCORE.emit()

func get_no_coins_collected()->int:
	return _no_coins_collected

func get_pform_speed()->float:
	return _curr_speed
	
func game_over()->void:
	_no_coins_collected = 0
	_run_score = 0
	get_tree().paused = true
	GAME_OVER.emit()
	
func restart()->void:
	get_tree().reload_current_scene()
	get_tree().paused = false
	
func quit()->void:
	get_tree().quit()
 
