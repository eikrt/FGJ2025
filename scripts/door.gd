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
	if index == 0:
		$Red.visible = true
	if index == 1:
		$Green.visible = true
	if index == 2:
		$Blue.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	Globals.status_text = "You opened a door!"
	Globals.status_text_changed = true
	if Globals.has_key_1 && index == 0:
		open = true
	if Globals.has_key_2 && index == 1:
		open = true
	if Globals.has_key_3 && index == 2:
		open = true	
