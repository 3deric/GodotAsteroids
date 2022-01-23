extends RigidBody2D

export var maxAngularVel = 3.0
export var scaleModifier = 2.0
export(Array, Texture) var sprites

export var maxLifetime = 2.0
var lifetime = 0.0

func _ready():
	angular_damp = 0.0
	linear_damp = 0.0
	set_process(true)
	
func initialize(pos):
	randomize()
	var sprite = get_node("Sprite")
	var random = randi()%3+1
	sprite.texture = sprites[random]
	angular_velocity = rand_range(-maxAngularVel, maxAngularVel)
	self.position = pos
	var rot = randf() * 3.14 * 2.0
	var dir = Vector2(cos(rot), sin(rot))
	linear_velocity = -dir * rand_range(50.0, 200.0)

func _physics_process(delta):
	lifetime+=delta
	var s = (maxLifetime - lifetime) / maxLifetime * scaleModifier
	scale = Vector2(s,s)
	
	if(lifetime > maxLifetime):
		destroyDebris()
	
func destroyDebris():
	queue_free()
