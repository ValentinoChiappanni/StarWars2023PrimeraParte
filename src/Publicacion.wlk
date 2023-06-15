class Manuales {
	var property tema
	var property esUtilParaDefensa
	method cantInteligencia(){
		return 5
	}
	method valorGlobal(){
		return if (esUtilParaDefensa){10}else {4}
	}
}

class Novelas{
	var property cantInteligencia
	method tema(){
		return "Literatura"
	}
	method esUtilParaDefensa(){
		return false
	}
	method valorGlobal(){
		return 2 * cantInteligencia
	}
}


