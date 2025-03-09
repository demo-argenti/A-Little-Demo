extends Node

var current_spawnpoint : Spawnpoint

var player : Player

func respawn_player():
	if current_spawnpoint != null: 
		player.position = current_spawnpoint.global_position
