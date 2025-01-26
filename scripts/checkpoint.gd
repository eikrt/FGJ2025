extends Area2D

@export var notify = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if "_get_name" in body:
		if body._get_name() == "Player" and notify:
			Globals.status_text_changed = true
			Globals.status_text = "Progress saved."
			Globals.current_checkpoint = self
