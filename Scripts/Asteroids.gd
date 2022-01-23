extends RigidBody2D

export var maxAngularVel = 3.0
export(Array, Texture) var sprites

func _ready():
	angular_damp = 0.0
	randomize()
	
	set_process(true)
	
func initialize(pos, dir):
	randomize()
	var sprite = get_node("Sprite")
	var random = randi()%3+1
	sprite.texture = sprites[random]
	angular_velocity = rand_range(-maxAngularVel, maxAngularVel)
	self.position = pos
	applied_force = -dir * rand_range(100.0, 500.0)


