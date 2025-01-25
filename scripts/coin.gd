extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if "_get_name" in body:
		if body._get_name() == "Player":
			Globals.coins += 1
			$PickupSound.play()
			self.visible = false
			$CollisionShape2D.disabled = true


func _on_pickup_sound_finished() -> void:
	self.queue_free()
