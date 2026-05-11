#extends CanvasLayer

#@onready var coin_label = $Label

#func _process(_delta):
	#coin_label.text = "Coin Count: " + str(Gamemanger.get_coins())
