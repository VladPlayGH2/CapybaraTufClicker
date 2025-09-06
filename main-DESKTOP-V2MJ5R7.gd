extends Node2D


var points = 0
var coins = 0
var remain = 500
var username = "DEBUG"

# Exported variable for bounce intensity. Adjust in the editor.
@export var bounce_intensity = 20

# Duration of the bounce animation in seconds.
@export var bounce_duration = 0.1

# Store the initial position
var initial_position : Vector2

func _ready():
	# Get initial position of character, ensure to replace "YourCharacterSprite" with 
	# the name of your Sprite or other Node2D that represents the character
	initial_position = get_node("Tuf").position 

func _process(_delta):
	$Counter.text = str(points)
	$Coins.text = str(coins)
	$Remain.text = str(remain)
	$Username.text = str(username)

func _on_char_pressed():
	points += 1
	coins += 1
	remain -= 1
	$ProgressBar.value += 1
	$ClickSound.play()
	_bounce_character() # Call the bounce function

func _bounce_character():
	# Create a tween to move the character up and down.  Ensure to replace "YourCharacterSprite"
	#  with the name of your sprite.
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.set_ease(Tween.EASE_IN)

	# Move the character upwards
	tween.tween_property(get_node("Tuf"), "position", initial_position - Vector2(0, -bounce_intensity), bounce_duration / 2)

	# Move the character back to its initial position
	tween.tween_property(get_node("Tuf"), "position", initial_position, bounce_duration / 2)


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

func save_button_pressed():
	var file = FileAccess.open("save.dat", FileAccess.WRITE)
	file.store_var(coins)
	file.store_var(points)
	file.store_var(remain)
	file.store_var(username)
	print("Saved!")


func kapituf_button_pressed() -> void:
	get_tree().change_scene_to_file('res://characters/kapituf.tscn')
