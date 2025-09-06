extends Node2D

@onready var anim = get_node("AnimationPlayer")

func _on_animated_sprite_2d_animation_looped():
	anim.play("normal")
