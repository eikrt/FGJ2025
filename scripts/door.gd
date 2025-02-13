extends StaticBody2D

@export var index = 0;
var open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if open:
		$DoorSound.play()
		self.visible = false
		$CollisionShape2D.disabled = true
		open = false
	if index == 0:
		$Red.visible = true
	if index == 1:
		$Green.visible = true
	if index == 2:
		$Blue.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:

	if Globals.has_key_1 && index == 0:
		Globals.status_text = "You opened the red door!"
		Globals.status_text_changed = true
		open = true
	if Globals.has_key_2 && index == 1:
		Globals.status_text = "You opened the green door!"
		Globals.status_text_changed = true
		open = true
	if Globals.has_key_3 && index == 2:
		Globals.status_text = "You opened the blue door!"
		Globals.status_text_changed = true
		open = true	


func _on_audio_stream_player_finished() -> void:
	queue_free()
