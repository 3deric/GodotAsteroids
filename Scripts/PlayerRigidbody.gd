extends RigidBody2D

var Projectile = preload("res://Prefabs/Projectile.tscn")

export var accFac = 200.0
export var steerFac = 0.05
export var maxSpeed = 300
export var cooldownTime = 0.25

var accInput = 0.0
var steerInput = 0.0
var shootInput = 0
var rot = 0.0

var cooldown = 0.0

var exhaustScale = 0
var exhaust

func _physics_process(delta):
	ApplyRotation(delta)
	ApplyEngineForce(delta)
	Shoot(delta)
	
func _ready():
	exhaust = get_node("Exhaust")
	set_process(true)

func _process(delta):
	InputConctroller()
	exhaustScale = lerp(exhaustScale, accInput, delta * 10.0)
	exhaust.scale = Vector2(1.0 ,exhaustScale)

func Shoot(delta):
	if(cooldown > 0):
		cooldown-=delta
	
	if(shootInput > 0 && cooldown < 0.1):	
		var p = Projectile.instance()
		owner.add_child(p)
		p.initialize(self.transform)
		cooldown = cooldownTime
		
func InputConctroller():
	accInput = int(Input.is_action_pressed("MovementAccelerate"))
	steerInput = int(Input.is_action_pressed("MovementLeft")) - int(Input.is_action_pressed("MovementRight"))
	shootInput = int(Input.is_action_pressed("Shoot"))

		
func ApplyRotation(delta):
	rot -= steerInput * steerFac
	self.rotation = rot

func ApplyEngineForce(delta):
	var velVsUp = -transform.y.dot(linear_velocity)

	var overspeed = false
	if velVsUp > maxSpeed && accInput > 0:
		overspeed = true

	if velVsUp < -maxSpeed * 0.5 && accInput < 0:
		overspeed = true
	
	if (!overspeed):
		var engineForce = -transform.y * accInput * accFac
		applied_force = engineForce
	
