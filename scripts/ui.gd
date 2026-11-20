extends Control

@onready var coins_label: Label = $Coins_Label
@onready var score_label: Label = $Score_Label
@onready var game_over_panel: Panel = $Panel

func _ready() -> void:
	game_over_panel.hide()
	GameManager.GAME_OVER.connect(show_game_over)
	GameManager.UPDATE_COIN_SCORE.connect(update_coins_collected)
	
func update_run_score()->void:
	score_label.text = "Score: " + str(GameManager.get_run_score())
	
func update_coins_collected()->void:
	coins_label.text = "Score: " + str(GameManager.get_no_coins_collected())


func show_game_over()->void:
	game_over_panel.show()

func _on_retry_btn_pressed() -> void:
	GameManager.restart()

func _on_quit_btn_pressed() -> void:
	GameManager.quit()
