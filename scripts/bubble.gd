extends CharacterBody2D


const SPEED = 3.0
var vel = Vector2()
var x = 0.0
var force_rotation = 0.0
var force_amount = 0
var f_rot = false
var death_anim_playing = false
var won = false
func _ready():
	Globals.player_pos = self.global_position
	$BirthSound.play()
	
func _physics_process(delta: float) -> void:
	Globals.player_pos = self.global_position
	if f_rot:
		self.velocity.x += sin(self.force_rotation) * force_amount
		self.velocity.y += cos(self.force_rotation) * force_amount
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_pressed("click_main") and mouse_pos.distance_to(global_position) > 8 and not Globals.game_won:
		x = lerp(x, 1.0/sqrt(mouse_pos.distance_to(global_position)) * SPEED, 0.06)
		var direction = (mouse_pos - global_position).normalized()
		velocity = lerp(velocity, direction * SPEED, 0.10)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.03)
	if mouse_pos.distance_to(global_position) < 96:
		var direction = (mouse_pos - global_position).normalized()
		var ang = self.get_angle_to(mouse_pos)
		if Input.is_action_pressed("click_main") and not $MetamorphosisAnimation.is_playing():
			if ang > 0.0 and ang < 1.2:
				$Idle.visible = false
				$LeftCorner.visible = true
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = false
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
			if ang > 1.2 and ang < 1.8:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = false
				$Up.visible = true
				$Down.visible = false
				$Idle.visible = false
			if ang > 1.8 and ang < 2.4:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = true
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = false
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
			if ang > 2.4 and ang < 3.2:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = true
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
			if ang > -PI and ang < -1.6:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = true
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = false
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
			if ang < -1.4 and ang > -2.2:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = false
				$Up.visible = false
				$Down.visible = true
				$Idle.visible = false
			if ang > -0.9 and ang < -0.2:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = false
				$Right.visible = false
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
			if ang > -0.9 and ang < -0.0:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = true
				$Left.visible = false
				$Right.visible = false
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
			if ang > -0.2 and ang < 0.3:
				$Idle.visible = false
				$LeftCorner.visible = false
				$RightCorner.visible = false
				$DownRightCorner.visible = false
				$DownLeftCorner.visible = false
				$Left.visible = true
				$Right.visible = false
				$Up.visible = false
				$Down.visible = false
				$Idle.visible = false
	if (not Input.is_action_pressed("click_main") or mouse_pos.distance_to(global_position) > 96) and not $MetamorphosisAnimation.is_playing():
		$Idle.visible = false
		$LeftCorner.visible = false
		$RightCorner.visible = false
		$DownRightCorner.visible = false
		$DownLeftCorner.visible = false
		$Left.visible = false
		$Right.visible = false
		$Up.visible = false
		$Down.visible = false
		if not death_anim_playing:
			$Idle.visible = true
		else:
			$Idle.visible = false
		
	self.position -= velocity * x
	if Globals.game_over and not $MetamorphosisAnimation.is_playing():
		$Idle.visible = false
		$LeftCorner.visible = false
		$RightCorner.visible = false
		$DownRightCorner.visible = false
		$DownLeftCorner.visible = false
		$Left.visible = false
		$Right.visible = false
		$Up.visible = false
		$Down.visible = false
		$Idle.visible = false
		$DeathAnimation.visible = true;
		$DeathAnimation.play()
		death_anim_playing = true
		$DeathSound.play()
		Globals.game_over = false
		Globals.game_game_over = false
	if Globals.game_game_over:
		$DeathAnimation.visible = false
		$Idle.visible = false
		$LeftCorner.visible = false
		$RightCorner.visible = false
		$DownRightCorner.visible = false
		$DownLeftCorner.visible = false
		$Left.visible = false
		$Right.visible = false
		$Up.visible = false
		$Down.visible = false
		$Idle.visible = false
		Globals.game_game_over = false
	if death_anim_playing:
		$Idle.visible = false
		$DeathAnimation.visible = true
		$Idle.visible = false
		$LeftCorner.visible = false
		$RightCorner.visible = false
		$DownRightCorner.visible = false
		$DownLeftCorner.visible = false
		$Left.visible = false
		$Right.visible = false
		$Up.visible = false
		$Down.visible = false
		$Idle.visible = false
	if $MetamorphosisAnimation.is_playing() and $MetamorphosisAnimation.visible:
		$Idle.visible = false
		$DeathAnimation.visible = false
		$Idle.visible = false
		$LeftCorner.visible = false
		$RightCorner.visible = false
		$DownRightCorner.visible = false
		$DownLeftCorner.visible = false
		$Left.visible = false
		$Right.visible = false
		$Up.visible = false
		$Down.visible = false
		$Idle.visible = false
	if Globals.game_won:
		$Idle.visible = false
		$DeathAnimation.visible = false
		$Idle.visible = false
		$LeftCorner.visible = false
		$RightCorner.visible = false
		$DownRightCorner.visible = false
		$DownLeftCorner.visible = false
		$Left.visible = false
		$Right.visible = false
		$Up.visible = false
		$Down.visible = false
		$Idle.visible = false

		
		if not won:
			$WinAnimation.visible = true
			$WinAnimation.play()
			won = true
	move_and_slide()
	
func _get_name():
	return "Player"


func _on_death_animation_animation_finished() -> void:
	Globals.game_game_over = true
	death_anim_playing = false
	if Globals.current_checkpoint:
		self.global_position = Globals.current_checkpoint.global_position
		$MetamorphosisAnimation.visible = true
		$MetamorphosisAnimation.play()
		$BirthSound.play()
	


func _on_death_animation_animation_looped() -> void:
	Globals.game_game_over = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)


func _on_metamorphosis_animation_animation_finished() -> void:
	$MetamorphosisAnimation.visible = false
