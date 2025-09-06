extends Node2D


var points = 0
var coins = 0
var pb = "$ProgressBar"

func _process(_delta):
	$Coins.text = str(coins)
func on_char_pressed():
	coins += 1
	$ProgressBar.value += 1
	$ClickSound.play()


func capybara_button_pressed():
	get_tree().change_scene_to_file('res://capybara.tscn')


func tuf_button_pressed():
	get_tree().change_scene_to_file('res://main.tscn')


func games_button_pressed():
	get_tree().change_scene_to_file('res://games.tscn')


func back_button_pressed():
	get_tree().change_scene_to_file('res://main.tscn')


func math_tuf_button_pressed() -> void:
	get_tree().change_scene_to_file('res://games/mathtuf/level/level.tscn')
