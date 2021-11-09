import parcelas.*

class Plantas {
	var property anioDeObtencionDeSemilla = 0
	var property altura = 0
	
	method horasDeSolQueTolera()
	method esFuerte() = self.horasDeSolQueTolera() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacio()
	method esIdeal(parcela)
	
}

class Menta inherits Plantas {
	
	override method horasDeSolQueTolera() = 6
	override method daNuevasSemillas() = super() or self.altura() > 0.4
	override method espacio() = self.altura() * 3
	override method esIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Plantas {
	
	override method horasDeSolQueTolera() {
		return
		if (altura < 0.5) {
			 6
		} else if (altura >= 0.5 and altura <= 1) {
			 7
		} else if (altura > 1) {
			 9
		}
	}
	override method daNuevasSemillas() = super() or  anioDeObtencionDeSemilla > 2007 and altura > 1
	
	override method espacio() = altura/2
	
	override method esIdeal(parcela) = self.horasDeSolQueTolera() == parcela.horasDeSol()
}

class Quinoa inherits Plantas {
	var horasDeSolQueTolera
	
	override method horasDeSolQueTolera() = horasDeSolQueTolera
	override method daNuevasSemillas() = super() or anioDeObtencionDeSemilla < 2005
	override method espacio() = 0.5
	override method esIdeal(parcela) = parcela.plantas().all{p => p.altura() < 1.5}
} 

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false	
	override method esIdeal(parcela) = parcela.cantidadMaxima() == 1
}

class Hierbabuena inherits Menta {
	override method espacio() = super() * 2
}