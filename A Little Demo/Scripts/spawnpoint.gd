extends Node2D
class_name Spawnpoint

var activated = false

func activate():
	GameManager.current_spawnpoint = self
	activated = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player && !activated:
		activate()
