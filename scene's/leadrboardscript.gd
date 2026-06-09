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
	SELECT ps.player_id, pd.name, ps.score, ps.datum
	FROM player_scoreB ps
	JOIN playerdata pd ON ps.player_id = pd.id
	ORDER BY ps.score DESC
	LIMIT 3;
	"""

	database.query(query)

	var results = database.query_result

	if results.size() > 0:
		first_label.text = "%s - %d - %s" % [results[0]["name"], results[0]["score"],results[0]["datum"],]

	if results.size() > 1:
		second_label.text = "%s - %d - %s" % [results[1]["name"], results[1]["score"],results[1]["datum"]]

	if results.size() > 2:
		third_label.text = "%s - %d -%s" % [results[2]["name"], results[2]["score"],results[2]["datum"]]
