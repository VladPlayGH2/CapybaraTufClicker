extends Node2D

var points = 0
var coins = 0
var remain = 500

func _process(_delta):
	$Counter.text = str(points)
	$Coins.text = str(coins)
	$Remain.text = str(remain)
func on_char_pressed():
	points += 1
	coins += 1
	remain -= 1
	$ProgressBar.value += 1
	$ClickSound.play()


func capybara_button_pressed():
	get_tree().change_scene_to_file('res://characters/capybara.tscn')


func tuf_button_pressed():
	get_tree().change_scene_to_file('res://main.tscn')


func games_button_pressed():
	get_tree().change_scene_to_file('res://games.tscn')


func back_button_pressed():
	get_tree().change_scene_to_file('res://main.tscn')


func quit_button_pressed():
	get_tree().quit()


func settings_button_pressed():
	get_tree().change_scene_to_file('res://settings.tscn')

var save_path = "save.dat"

func save_button_pressed():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(coins)
	file.store_var(points)
	file.store_var(remain)
	file.store_var(file)
	file.close()
	print("Saved!")


func kapituf_button_pressed() -> void:
	get_tree().change_scene_to_file('res://characters/kapituf.tscn')


func import_button_pressed() -> void:
	var file = FileAccess.open(save_path, FileAccess.READ)
	coins = file.get_var()
	points = file.get_var()
	remain = file.get_var()
	file.close()


func _on_username_text_changed(new_text) -> void:
	var username = new_text


func leaderboard_pressed() -> void:
	pass # Replace with function body.
