 import plantas.*
 
 class Parcelas {
 	
 	var property ancho
 	var property largo
 	var property horasDeSol
 	var property plantas = []
 	
 	method superficie() = ancho * largo
 	
 	method cantidadMaxima() = if (ancho > largo) {self.superficie() / 5} else {self.superficie()/3 + largo}
 	
 	method tieneComplicaciones() = plantas.any{ p => p.horasDeSolQueTolera() < horasDeSol}
 	
 	method plantar(planta) {
 		return
 		if (plantas.size() == self.cantidadMaxima() || self.horasDeSol() > planta.horasDeSolQueTolera() + 2) {
 			self.error("No se puede plantar la planta.")
 		} else { plantas.add(planta)}
 	} 
 	method seAsociaBien(planta)
 	method bienAsociadas() = plantas.filter{ p => self.seAsociaBien(p)}.size()
 	method cantidadDePlantas() = plantas.size()
 }
 
 class ParcelasEcologicas inherits Parcelas{
 	override method seAsociaBien(planta) = !self.tieneComplicaciones() and planta.esIdeal(self)
 }
 
 class ParcelasIndustriales inherits Parcelas {
 	override method seAsociaBien(planta) = self.plantas().size() <= 2 and planta.esFuerte()
 	
 }