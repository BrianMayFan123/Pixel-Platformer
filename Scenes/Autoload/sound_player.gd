extends Node

const HURT = preload("res://Assets/SFX/Hit_Hurt.wav")
const JUMP = preload("res://Assets/SFX/Jump2.wav")
const COIN = preload("res://Assets/SFX/Pickup_Coin3.wav")

@onready var audioPlayers = $AudioPlayers


func play_sound(sound):
	for audioStreamPlayer in audioPlayers.get_children():
		if not audioStreamPlayer.playing:
			audioStreamPlayer.stream = sound
			audioStreamPlayer.play()
			break

