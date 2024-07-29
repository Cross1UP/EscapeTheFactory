extends Control

onready var scoreText = get_node("ScoreText");
onready var imp = get_node("Impression");

func _ready():
	scoreText.text = "0";
	
func set_score_text (score):
	scoreText.text = str(score);
	
func set_impression_text (score):
	if score >= 0:
		imp.text = "Bad.";
	if score >= 10:
		imp.text = "Good.";
	if score >= 20:
		imp.text = "Great.";
	if score >= 30:
		imp.text = "Awesome!";
	if score >= 40:
		imp.text = "Outstanding!";
	if score >= 55:
		imp.text = "Perfection!";
	if score >= 64:
		imp.text = "You just couldnt let that last one go.";
