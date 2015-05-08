#trata da fisica do pulo de personagens jogaveis e todos seus parametros

#constantes
const CHAO_ANGULO_MAXIMO = 45
const PARADA_FORCA = 1300
const PULO_FORCA = 400
const PULO_TEMPO_AEREO_MAXIMO = 0.2

#variaveis globais
var pulando = false #determina o estado pulando
var tempo_aereo = 100
var pulo_anteriormente_pressionado = false