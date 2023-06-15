class Persona {
	var edad

	method inteligencia() { 
		if (edad.between(20,40)) { return 12 } else { return 8 } 
	}
	method potencia() { 
		return 20
	}
	method esDestacada() { 
		return edad == 25 or edad == 35
	}
	method contribuir(planeta){}
	
	method valor(){
		return self.potencia() + self.inteligencia()
	}
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property tecnicasQueConoce = 2 
	override method potencia() { return super() + masaMuscular * tecnicasQueConoce }
	override method esDestacada() { return super() || tecnicasQueConoce > 5 }
	method entrenar(dias) { masaMuscular += dias / 5 }
	method aprenderTecnica() { tecnicasQueConoce += 1 }
	override method contribuir(planeta) { 
		planeta.construirMurallas(2)
	}
	
	
}

class Docente inherits Persona {
	var property cantidadDeCursosQueDio = 0
	override method inteligencia() { 
		return super() + cantidadDeCursosQueDio * 2
	}
	override method esDestacada() { 
		return cantidadDeCursosQueDio > 3
	}
	override method contribuir(planeta) {
		planeta.fundarUnMuseo()
	}
	
	override method valor(){
		return super() + 5
	}
}

class Soldado inherits Persona{
	const armas = []
	override method potencia(){
		return super() + armas.sum({arma => arma.potencia()})
	}
	override method contribuir(planeta) { 
		planeta.construirMurallas(2)
	}
}

class Tecnico inherits Persona{
	const property publicaciones=[]
	
	override method inteligencia()=super()+ publicaciones.sum({publicacion=> publicacion.cantInteligencia()})
	override method potencia()=super()+publicaciones.count({publicacion=>publicacion.esUtilParaLaDefensa()})
	override method contribuir(planeta){planeta.construirEdificio()}
	override method esDestacada(){
		return super () && publicaciones.size()>=3
	}
}