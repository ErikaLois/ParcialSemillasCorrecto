import plantas.*
import parcelas.*

object inta {
	var property parcelas = []
	
	method plantasTotales() = parcelas.sum{ p => p.plantas().size()}
	method promedioDePlantasPorParcela() = self.plantasTotales() / parcelas.size()
	method parcelaMasSustentable() = parcelas.filter({ p => p.cantidadDePlantas() > 4}).max({p => p.bienAsociadas()}) 
	method agregarParcela(parcela){ parcelas.add(parcela) }
}