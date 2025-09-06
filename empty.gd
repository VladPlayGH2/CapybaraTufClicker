extends Node2D


var points = 0
var coins = 0
var remain = 1000

func _process(_delta):
	$Counter.text = str(points)
	$Coins.text = str(coins)
	$Remain.text = str(remain)
	
func back_button_pressed():
	get_tree().change_scene_to_file('res://main.tscn')
