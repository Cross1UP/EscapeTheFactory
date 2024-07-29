extends Area2D

# The export keyword allows the variables to appear in the inspector.
export var speed : int = 100;
export var moveDist : int = 100;


# onready keyword is used here to make sure that the value stores the position information before the variable is initialized.
onready var startY : int = position.y;
onready var targetY : int = position.y  + moveDist;

var rotationSpeed : float = 360.0


func _process(delta):
	#Passing position.x to 'current' / targetX to 'to' / and speed*delta to 'step'.
	position.y = move_to(position.y, targetY, speed * delta);
	
	#is out position equal to the target?
	if position.y == targetY:
		if targetY == startY:
			targetY = position.y + moveDist;
		else:
			targetY = startY;
	
	rotation_degrees += rotationSpeed * delta;

#The function takes in three parameters: current position, destination, and how much it moves in this function call.
#moves 'current' towards 'to' at a rate of 'step'
func move_to (current, to, step):
	
	#We will use the new variable to store and modify the current position.
	var new = current;
	
	#If we haven't reached the destination yet
	if new < to:
		#Move positively by step
		new += step;
		#If we've gone over the destination
		if new > to:
			#Cap it out at the destination
			new = to;
	#If we've reached the destination
	else:
		#Move negatively by step
		new -= step;
		#If we've returned to our starting position
		if new < to:
			#Cap it out at the starting position
			new = to;
	return new;


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
