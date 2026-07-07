extends Node

var coin_counter = 0
var player_name = ""
var current_player_id = -1
var cookie_counter = 0
var key_counter = 0
var max_keys = 1
var set_max_keys = clamp(key_counter + 1, 0,max_keys)
