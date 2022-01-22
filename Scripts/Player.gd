extends Node2D



const acc_multi = .05
const rot_multi = .05

var dir = Vector2(0.0, 1.0)
var force = Vector2(0.0, 0.0)
var rot = 0
var pos = Vector2(0.0, 0.0)
var speed = 0
var exhaustScale = 0

var exhaust

func _ready():
	exhaust = get_node("Exhaust")
	set_process(true)


func _process(delta):
	pos = self.position
	rot = self.rotation
	
	var exhaustGoal = 0.0
	dir = Vector2(cos(rot - 3.14/2), sin(rot - 3.14/2))
	
	
	
	if(Input.is_action_pressed("MovementAccelerate")):
		print("accelerate")
		force+= dir * acc_multi
		exhaustGoal = 1.0
	else:
		exhaustGoal = 0.0
	
	if(Input.is_action_pressed("MovementLeft")):
		print("left")
		rot-=1 * rot_multi
	
	if(Input.is_action_pressed("MovementRight")):
		print("right")
		rot+=1 * rot_multi
		
	self.position+= force
	self.rotation = rot
	
	exhaustScale = lerp(exhaustScale, exhaustGoal, delta * 10.0)
	
	exhaust.scale = Vector2(1.0 ,exhaustScale)
	
	print(dir)
