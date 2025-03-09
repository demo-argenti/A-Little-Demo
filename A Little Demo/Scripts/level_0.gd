extends Node2D

@onready var transition = $CanvasLayer/Transition
var level1 = preload("res://Levels/Level 1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_scene_transition_area_entered(area: Area2D) -> void:
	transition.play("fade_out")


func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		get_tree().change_scene_to_packed(level1)
		pass
