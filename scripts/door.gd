extends StaticBody2D

@export var index = 0;
var open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if open:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if Globals.has_key_1 && index == 0:
		open = true
	if Globals.has_key_2 && index == 1:
		open = true
	if Globals.has_key_3 && index == 2:
		open = true	
