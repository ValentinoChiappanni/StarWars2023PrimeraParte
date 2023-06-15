class Armas{
	method potencia(soldado)
}

class Pistolete inherits Armas{
	var largo
	override method potencia(soldado){
		return if (soldado.edad() >= 30){largo*3}else {largo*2}
	}
}

class Espadon inherits Armas{
	var peso
	override method potencia(soldado){
		return if (soldado.edad()<40){peso/2}else{6}
	}
}