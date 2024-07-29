extends Node


var battle_music = load("res://Audio/Tech_Live.mp3")

func _ready():
	pass
	
func play_music():
	
	$Music.stream = battle_music
	$Music.play();
	
func stop_music():
	
	$Music.stop();
