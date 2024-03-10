extends BaseWeapon

@export var hitbox_comp: HitboxComponent

var using_trap := false

func _ready():
	super()

func _process(delta):
	if Input.is_action_pressed("LClick"):
		hitbox_comp.process_mode = Node.PROCESS_MODE_INHERIT
		if not using_trap:
			using_trap = true
		
			
	else:
		hitbox_comp.process_mode = Node.PROCESS_MODE_DISABLED
		if using_trap:
			using_trap = false
