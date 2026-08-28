extends Node

# Number of players in the game
# Must be between 2 and 4
export(int, 2, 4) var player_count = 2


func _ready():
	print("Players: ", player_count)

	$P1_hand.visible = true
	$P2_hand.visible = true
	$P3_hand.visible = player_count >= 3
	$P4_hand.visible = player_count >= 4
