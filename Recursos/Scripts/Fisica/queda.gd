#aplica queda a um objeto

extends KinematicBody2D

#variaveis
var forcas = get_node("root/forcasGlobais") #o script forcasGlobais devera ser carregado no auto load com o nome forcasGlobais!!!
var gravidade_forca #valor atual da gravidade
var parent = get_parent() #pega o parente onde serpa aplicado a queda

func _ready():

	set_fixed_process(true)

	pass
	
func _fixed_process(delta):
	
	gravidade_forca = forcas.gravidade_get()
	parent.move(0,gravidade_forca)