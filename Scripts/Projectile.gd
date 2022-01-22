extends Area2D

export var speed = 100
var dir = Vector2(0.0,1.0)


func _ready():
	set_process(true)

func initialize(parent):
	self.transform = parent
	var rot = rotation
	dir = Vector2(cos(rot - 3.14/2), sin(rot - 3.14/2))
	

func _physics_process(delta):
	position += dir * speed * delta


