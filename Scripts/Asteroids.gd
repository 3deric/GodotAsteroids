extends RigidBody2D

export var maxAngularVel = 3.0
export(Array, Texture) var sprites

func _ready():
	angular_damp = 0.0
	var sprite = get_node("Sprite")
	randomize()
	var random = randi()%3+1
	sprite.texture = sprites[random]
	angular_velocity = rand_range(-maxAngularVel, maxAngularVel)
	set_process(true)


