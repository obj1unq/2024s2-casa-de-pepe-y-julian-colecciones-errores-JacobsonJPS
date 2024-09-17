import cosas.*
import cuentas.*

object casa {
	var property cosas = []
	var ultimaCompra = null
	var property cuenta = cuentaCorriente
	
	method comprar(cosa) {
		cuenta.extraer(cosa.precio()) 
		cosas.add(cosa)
		ultimaCompra = cosa
	}

	method cantidadDeCosasCompradas() {
		return cosas.size()
	}
	
	method tieneAlgun(categoria) {
		return cosas.any({ cosa => cosa.categoria() == categoria })
	}
	
	method vieneDeComprar(categoria) {
		return ultimaCompra.categoria() == categoria
	}
	
	method esDerrochona() {
		return cosas.sum({ cosa => cosa.precio() }) >= 9000
	}
	
	method compraMasCara() {
		return cosas.max({ cosa => cosa.precio() })
	}
	
	method comprados(categoria) {
		return cosas.filter({ cosa => cosa.categoria() == categoria })
	}
	
	method malaEpoca() {
		return cosas.all({ cosa => cosa.categoria() == "comida" })
	}

	method queFaltaComprar(lista){ 
		return lista.filter({ cosa => !cosas.contains(cosa) })
	}
	
	method faltaComida() {
		return cosas.count({ cosa => cosa.categoria() == "comida" }) < 2
	}
	
	method categoriasCompradas() {
		return cosas.map({ cosa => cosa.categoria() }).withoutDuplicates()
		// Hacer un set para sacar los elementos duplicados directamente
		//return cosas.map({ cosa => cosa.categoria() }).asSet()
	}
	
	

}
