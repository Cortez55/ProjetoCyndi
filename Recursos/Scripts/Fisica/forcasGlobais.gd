#cria e gerencia forças globais como a gravidade e o empuxo, o ideal é ser colocado no nó principal do jogo

#futuramente aplicar forças regiionais e individuais. Forças regionais se aplicam a uma area2d enquanto forças individuais
#se aplicam a um único nó. As forças regionais se sobrepõem as globais e as individuais se sobrepões as regionais

# constantes de forças, além dos valores padrões podem ser criados valores especiais
# como a gravidade na lua, tais valores são usados com força_set(valor)
# onde força é uma das forças existentes

extends Node2D

const GRAVIDADE_PADRAO = 500.0
const EMPUXO_PADRAO = 1

#switchs das forças, podem ativa-las ou desativa-las 
export var gravidade_ativa = true # verifica se a gravidade está ativa, senão estiver então GRAVIDADE = 0
export var empuxo_ativo = false # verifica se o empuxo está  ativo, senão estiver então EMPUXO = 1

# variaveis das forças
export var gravidade_forca = GRAVIDADE_PADRAO # força da gravidade, se não estiver sendo utilizada devera ser 0
export var empuxo_forca = EMPUXO_PADRAO # força de empuxo, se não estiver sendo utilizado devera ser 1

# soma as forças e cria uma resultante em x e em y
var forcaY = gravidade_forca * empuxo_forca
var forcax = 0.0
var forca_total = Vector2()

func _ready():

	set_fixed_process(true)
	
	pass

func _fixed_process(delta):

	# verifica se a gravidade esta ativada, se falso seta como 0
	if(gravidade_ativa == false):
		gravidade_forca = 0
	# verifica se o empuxo esta ativada, se falso seta como 1
	if(empuxo_ativo == false):
		empuxo_forca = 1
	
	# aplica as forças em x e y
	forca_total = Vector2(forcax,forcaY)

# funcões relacionadas a gravidade >

func gravidade_ativar(estado = true): # ativa ou desativa a gravidade

	assert(typeof(estado) == TYPE_BOOL)
	gravidade_ativa = estado

func gravidade_aumentar(valor = 0.0): # aumenta a força da gravidade
	assert(typeof(valor) == TYPE_INT)
	gravidade_forca += valor

func gravidade_reduzir(valor = 0.0): # reduz a força da gravidade
	assert(typeof(valor) == TYPE_INT)
	gravidade_forca -= valor
	
func gravidade_set(valor = GRAVIDADE_PADRAO): # seta um valor especifico para gravidade
	assert(typeof(valor) == TYPE_INT)
	gravidade_forca = valor
	
func gravidade_get(): #retorna valor da gravidade
	return gravidade_forca
	
func gravidade_reset(): #reseta a gravidade ao valor definido em GRAVIDADE_PADRAO
	gravidade_forca = GRAVIDADE_PADRAO
	
func gravidade_reverter(): #reverte o sentido da gravidade, mantendo o valores
	gravidade_forca = -gravidade_forca

#funções relaciondas a gravidade <


#funções relaciondas ao empuxo >

func empuxo_ativar(estado = false): # ativa ou desativa o empuxo
	assert(typeof(estado) == TYPE_BOOL)
	empuxo_ativo = estado
	
func empuxo_aumentar(valor = 0.0): # aumenta a força do empuxo
	assert(typeof(valor) == TYPE_INT)
	empuxo_forca += valor
	
func empuxo_reduzir(valor = 0.0): # reduz a força do empuxo
	assert(typeof(valor) == TYPE_INT)
	empuxo_forca += valor
	
func empuxo_set(valor = EMPUXO_PADRAO): #seta um valor especifico para gravidade
	assert(typeof(valor) == TYPE_INT)
	empuxo_forca = valor
	
func empuxo_get(): #retorna o valor do emppuxo
	return empuxo_forca
		
func empuxo_reset(): #reseta o empuxo ao valor definido em EMPUXO_PADRAO
	empuxo_forca = EMPUXO_PADRAO
	
#funções relaciondas ao empuxo <