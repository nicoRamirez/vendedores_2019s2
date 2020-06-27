import geografia.*
import vendedores.*
import distribucion.*
class Cliente {
	method puedeSerAtendido(vend)
	
}
class Inseguro inherits Cliente{
	override method puedeSerAtendido(vend){
		return vend.versatil() and vend.esFirme()
	}
}
class Detallista inherits Cliente{
	override method puedeSerAtendido(vend){
		return vend.certificadosProd() >= 3 
	}
}
class Humanista inherits Cliente{
	override method puedeSerAtendido(vend){
		return vend.esFisica()
	}
}
