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
			Globals.game_won = true
			Globals.status_text_changed = true
			Globals.status_text = "Congratulations! You are the master of the depths!"
