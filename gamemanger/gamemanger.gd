#extends Node

#var coin_counter : int = 0

#func add_coin(amount : int = 1) -> void:
	#coin_counter += amount
	#print("Coins: ", coin_counter)

#func lose_coin(amount : int) -> void:
	#coin_counter = max(0, coin_counter - amount)

#func get_coins() -> int:
	#return coin_counter
