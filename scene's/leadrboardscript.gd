extends Control

var database : SQLite

@onready var first_label = $naam1
@onready var second_label = $naam2
@onready var third_label = $naam3

func _ready():
	database = SQLite.new()
	database.path = "res://data.db"
	database.open_db()

	load_leaderboard()

func load_leaderboard():
	var query = """
	SELECT name, score
	FROM playertest
	ORDER BY score DESC
	LIMIT 3;
	"""

	database.query(query)

	var results = database.query_result

	if results.size() > 0:
		first_label.text = "%s - %d" % [results[0]["name"], results[0]["score"]]

	if results.size() > 1:
		second_label.text = "%s - %d" % [results[1]["name"], results[1]["score"]]

	if results.size() > 2:
		third_label.text = "%s - %d" % [results[2]["name"], results[2]["score"]]
