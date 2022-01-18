extends Node2D

const acc_force = .05
const rot_force = .05

var dir = Vector2(0.0, 1.0)
var rot = 0
var pos = Vector2(0.0, 0.0)
var speed = 0

func _ready():
	set_process(true)


func _process(delta):
	pos = self.position
	rot = self.rotation
	

	
	
	if(Input.is_action_pressed("MovementAccelerate")):
		print("accelerate")
		
	
	if(Input.is_action_pressed("MovementLeft")):
		print("left")
		rot-=1 * rot_force
	
	if(Input.is_action_pressed("MovementRight")):
		print("right")
		rot+=1 * rot_force
		
	self.position+= dir * speed
	self.rotation = rot
	
	print(pos)
	print(rot)
