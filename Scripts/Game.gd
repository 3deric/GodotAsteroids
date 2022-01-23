extends Node

var asteroid = preload("res://Prefabs/Asteroid.tscn")

export var asteroidSpawnTime = 2.0
export var maxAsteroids = 5

var player
var asteroids = []
var asteroidCooldown = 0.0
var viewportSize= Vector2(0.0, 0.0)

func _ready():
	player = get_node("Player")
	viewportSize = get_viewport().get_visible_rect().size
	print(viewportSize)
	set_process(true)

func _physics_process(delta):
	spawnAsteroids(delta)

func spawnAsteroids(delta):
	if(asteroidCooldown > 0):
		asteroidCooldown-=delta
		
	if(asteroidCooldown < 0.1):	
		var a = asteroid.instance()
		self.add_child(a)
		randomize()
		var posX = rand_range(-viewportSize.x / 2 * 1.2, viewportSize.x/2 *1.2)
		var pos = Vector2(posX, 0.0)
		var dir = (pos - player.position).normalized()
		a.initialize(pos, dir)
		asteroidCooldown = asteroidSpawnTime
		
