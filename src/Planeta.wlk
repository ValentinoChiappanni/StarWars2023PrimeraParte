import galaxia.*

class Planeta {
	const habitantes = []
	var cantidadMuseos = 0
	var longitudMurallas = 0
	var edificiosConstruido = 0
	
	method delegacionDiplomatica() { 
		return habitantes.filter({ hab => hab.esDestacada() })
	}
	
	method valorInicialDeDefensa() { 
		return habitantes.count({ hab => hab.potencia() >= 30 })
	}
	
	method esCulto() { 
		return cantidadMuseos > 2 and habitantes.all({ hab => hab.inteligencia() > 10 })
	}
	
	method potenciaReal() { 
		return habitantes.sum({ hab => hab.potencia() })
	}
	
	method construirMurallas(cantidad) { 
		longitudMurallas += cantidad
	}
	
	method fundarUnMuseo() { 
		cantidadMuseos += 1
	}
	
	method potenciaAparente() { 
		return self.maximaPotencia() * habitantes.size()
	}
	method maximaPotencia() { 
		return habitantes.max({ hab => hab.potencia() }).potencia()
	}
	
	method necesitaReforzarse() { 
		return 2 * self.potenciaAparente() >= self.potenciaReal()
	}
	
	method recibirTributos() { 
		habitantes.forEach({hab => hab.contribuir(self)})
	}
	
	method habitantesValiosos() { 
		return habitantes.filter({ hab => hab.valor() >= 40 })
	}
	
	method apaciguar(otroPlaneta){
		self.habitantesValiosos().forEach({habitante => habitante.contribuir(otroPlaneta)})
	}
	
	method indiceConstruccion(){
		return longitudMurallas + cantidadMuseos * 30 + edificiosConstruido * 10
	}
	
	method esCopado(){
		return self.esCulto() && habitantes.size() > 4
	}
	
	method estaBienDefendido(){
		return self.valorInicialDeDefensa() + galaxia.nivelBasicoEnergia() >= 8
	}
	
	method construirEdificio(){
		edificiosConstruido ++
	}
}