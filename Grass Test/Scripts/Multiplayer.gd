extends Node

const PORT = 4433

# Called when the node enters the scene tree for the first time.
func _ready():
	# Start paused
	get_tree().paused = true
	# Save bandwidth by "disabling server relay and peer notifications"?
	multiplayer.server_relay = false
	
	# Start server in headless mode
	if DisplayServer.get_name() == "headless":
		print("Automatically starting dedicated server.")
		_on_host_pressed.call_deferred()

func _on_host_pressed():
	# Start as server.
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer server.")
		return
	multiplayer.multiplayer_peer = peer
	start_game()

func on_connect_pressed():
	# Start as client.
	var txt: String = $UI/Net/Options/Remote.text
	if txt == "":
		OS.alert("Need a remote to connect to.")
		return
	var peer= ENetMultiplayerPeer.new()
	peer.create_client(txt, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer client.")
		return
	multiplayer.multiplayer_peer = peer
	start_game()

func start_game():
	$UI.hide()
	get_tree().paused = false
