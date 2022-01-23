extends RigidBody2D

export var maxAngularVel = 3.0
export(Array, Texture) var sprites
export var health = 5

var player
var game

func _ready():
	angular_damp = 0.0
	randomize()
	set_process(true)
	
func initialize(pos, dir, p, g):
	add_to_group("Asteroids")
	randomize()
	var sprite = get_node("Sprite")
	var random = randi()%3+1
	sprite.texture = sprites[random]
	angular_velocity = rand_range(-maxAngularVel, maxAngularVel)
	self.position = pos
	applied_force = -dir * rand_range(100.0, 500.0)
	player = p
	game = g
	
func _physics_process(delta):
	deleteBounds()


	
func deleteBounds():
	if(self.position.distance_to(player.position) > 1000.0):
		destroyAsteroid()

func takeDamage(damage):
	health-=damage
	if(health <= 0):
		destroyAsteroid()
		
func destroyAsteroid():
	game.removeAsteroid()
	queue_free()
