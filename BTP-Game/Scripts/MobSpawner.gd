extends Node2D

export (PackedScene) var Mob
onready var mob_timer : Timer = $"MobTimer"

func _ready():
	randomize()

func _process(delta):
	#Fixme: if it starts getting heavy on memory or we want to keep developing the game move this to a proper signal
	match get_tree().get_nodes_in_group('turrets').size():
		0:
			mob_timer.wait_time = 10
		2:
			mob_timer.wait_time = 4
		4:
			mob_timer.wait_time = 3
		6:
			mob_timer.wait_time = 3
		8:
			mob_timer.wait_time = 2
		10:
			mob_timer.wait_time = 1
		12:
			mob_timer.wait_time = .5
		14:
			mob_timer.wait_time = .5
		16:
			mob_timer.wait_time = .5
		18:
			mob_timer.wait_time = .4
		20:
			mob_timer.wait_time = .4
		22:
			mob_timer.wait_time = .4
		24:
			mob_timer.wait_time = .4

	
func _on_MobTimer_timeout():
	#Choose Random Location
	$MobPath/MobSpawnLocation.set_offset(randi())
	#Create Mob at location
	var mob = Mob.instance()
	add_child(mob)
	mob.position = $MobPath/MobSpawnLocation.position