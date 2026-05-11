#extends Panel

#signal LoginUser(user, password)
#signal CreateUser(user, password)

#@export var CreateUserWindow : PackedScene

#func _on_cancel_button_down() -> void:
#	queue_free()
#	pass # Replace with function body.



#func _on_create_user_button_down() -> void:
#	var createUserWindow = CreateUserWindow.instantiate()
#	add_child(createUserWindow)
#	createUserWindow.CreateUser.connect()
#	pass # Replace with function body.

#func createUser(name, password):
#	CreateUser.emit(name, password)

#func _on_login_button_down() -> void:
#	LoginUser.emit($Username.text, $Password.text)
#	pass # Replace with function body.
