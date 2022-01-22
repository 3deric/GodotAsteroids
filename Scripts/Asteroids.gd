extends RigidBody2D

export var maxAngularVel = 3.0
#xport var (sprite) sprites

func _ready():
	angular_damp = 0.0
	angular_velocity = rand_range(-maxAngularVel, maxAngularVel)
	set_process(true)


