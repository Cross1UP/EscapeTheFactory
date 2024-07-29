extends KinematicBody2D

var score : int = 0;

var speed : int = 250;
var jumpForce : int = 575;
var gravity : int = 1300;

var vel : Vector2 = Vector2()

#onready var sprite :  Sprite = get_node("Sprite");
onready var ui : Node = get_node("/root/Level_" + str(int(get_tree().current_scene.name)) +"/CanvasLayer/UI")
onready var audioPlayer : Node = get_node("/root/Level_" + str(int(get_tree().current_scene.name)) +"/Camera2D/AudioPlayer")

func _physics_process(delta):
	
	vel.x = 0;
	
	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed;
		$Sprite.play("walk")
		$Sprite.flip_h = true;
		
	elif Input.is_action_pressed("move_right"):
		vel.x += speed;
		$Sprite.play("walk")
		$Sprite.flip_h = false
	
	else:
		$Sprite.play("idle")
		
	if not is_on_floor():
		$Sprite.play("air")
		
	# applying the velocity
	vel = move_and_slide(vel,Vector2.UP);
	
	# gravity
	vel.y += gravity * delta;
	
	# jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce;
	
	# sprite direction
#	if vel.x < 0:
#		sprite.flip_h = true;
#	elif vel.x > 0:
#		sprite.flip_h = false;
		
# We’re going to restart the scene when this function gets called.
# To do that, we can use get_tree(),
#which fetches the top parent node (‘MainScene’ in this case)
# Then, we can get it to reload by using the built-in function: .reload_current_scene().
func die():
	get_tree().reload_current_scene();
	
func collect_coin (value):
	score += value;
	ui.set_score_text(score);
	ui.set_impression_text(score);
	audioPlayer.play_coin_sfx();

