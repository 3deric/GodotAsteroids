extends Node

var asteroid = preload("res://Prefabs/Asteroid.tscn")

export var asteroidSpawnTime = 2.0
export var maxAsteroids = 5

var player
var asteroidsAlive = 0
var asteroidCooldown = 0.0
var viewport= Vector2(0.0, 0.0)

func _ready():
	player = get_node("Player")
	viewport = get_viewport().get_visible_rect().size
	set_process(true)

func _physics_process(delta):
	spawnAsteroids(delta)

func spawnAsteroids(delta):
	if(asteroidCooldown > 0):
		asteroidCooldown-=delta
		
	if(asteroidCooldown < 0.1 && asteroidsAlive < maxAsteroids):
		var a = asteroid.instance()
		self.add_child(a)
		randomize()
		var rot = randf() * 3.14 * 2.0
		var dir = Vector2(cos(rot), sin(rot))
		var pos = player.position + dir * 800.0
		dir = (pos - player.position).normalized()
		a.initialize(pos, dir, player, self)
		asteroidCooldown = asteroidSpawnTime
		asteroidsAlive+=1
	
		
func removeAsteroid():
	asteroidsAlive-=1
		
