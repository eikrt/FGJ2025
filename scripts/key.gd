extends Area2D

@export var index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if index == 0:
		$RedKeySprite.visible = true
	if index == 1:
		$GreenKeySprite.visible = true
	if index == 2:
		$BlueKeySprite.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if index == 0:
		Globals.status_text = "You found the red key!"
		Globals.status_text_changed = true
		Globals.has_key_1 = true
		$PickupSound.play()
		self.visible = false
		$Area2D/CollisionShape2D.disabled = true
	if index == 1:
		Globals.status_text = "You found the green key!"
		Globals.status_text_changed = true
		Globals.has_key_2 = true
		$PickupSound.play()
		self.visible = false
		$Area2D/CollisionShape2D.disabled = true
	if index == 2:
		Globals.status_text = "You found the blue key!"
		Globals.status_text_changed = true
		Globals.has_key_3 = true
		$PickupSound.play()
		self.visible = false
		$Area2D/CollisionShape2D.disabled = true


func _on_pickup_sound_finished() -> void:
	self.queue_free()
