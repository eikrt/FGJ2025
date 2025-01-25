extends Area2D

@export var force_amount = 0.4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if "_get_name" in body:
		if body._get_name() == "Player":
			body.force_rotation = self.rotation
			body.force_amount = self.force_amount
			body.f_rot = true


func _on_body_exited(body: Node2D) -> void:
	if "_get_name" in body:
		if body._get_name() == "Player":
			body.force_rotation = self.rotation
			body.force_amount = self.force_amount
			body.f_rot = false
