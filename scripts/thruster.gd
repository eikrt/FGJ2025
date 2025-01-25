extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.thr_pos = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#self.position = lerp(self.position, get_global_mouse_position(), 0.1)
	Globals.thr_pos = self.global_position
	self.position = get_global_mouse_position()
	var rot = atan2(Globals.player_pos.y - self.position.y, Globals.player_pos.x - self.position.x) + PI / 2
	self.rotation = rot


func _on_body_entered(body: Node2D) -> void:
	if "_get_name" in body:
		if body._get_name() == "Player":
			body.velocity += self.rotation
