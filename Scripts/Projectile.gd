extends Area2D

export var speed = 100
export var maxLifetime = 2.0
var dir = Vector2(0.0,1.0)
var lifetime = 0.0


func _ready():
	set_process(true)

func initialize(parent):
	self.transform = parent
	var rot = rotation
	dir = Vector2(cos(rot - 3.14/2), sin(rot - 3.14/2))
	

func _physics_process(delta):
	position += dir * speed * delta
	lifetime+=delta
	
	if(lifetime > maxLifetime):
		queue_free()


