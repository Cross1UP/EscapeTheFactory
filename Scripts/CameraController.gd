extends Camera2D

onready var player = get_node("/root/Level_" + str(int(get_tree().current_scene.name)) +"/Player");


#This function gets called every frame
func _process(delta):
	
	position.x = player.position.x
