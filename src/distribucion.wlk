import geografia.*
import vendedores.*
class Distribucion {
	var property origen=null
	var property vendedores=[]
	method agregarVendedor(vend){
		if(not self.estaElVendedor(vend)){
			vendedores.add(vend)
		}
		else{self.error("el vendedor ya esta trabajando aca")}
	}
	method estaElVendedor(vend){
		return vendedores.contains(vend)
	}
	method vendEstrella(){
		return vendedores.max({vendedor=>vendedor.certificadosPunt()})
	}
	
	method cubrir(lugar){
		return vendedores.any({vendedor=>vendedor.trabajarEn(lugar)})
	}
	method genericos(){
		return vendedores.all({vendedor=>vendedor.certificadosNoProd()>=1})
	}
	method robusto(){
		return vendedores.count({vendedor=>vendedor.esFirme()}) >=3
	}
	method repartirCert(cert){
		vendedores.forEach({vendedor=>vendedor.agregarCertificado(cert)})
	}
	method esCandidato(vend){
		return vend.versatil() and vend.afinidad(self)
	}
	
}
class Certificado{
	var property puntos=0
	method prod()
	method noProd()

}
class DeProducto inherits Certificado{
	override method prod(){
		return true
	}	
	override method noProd(){
		return false
	}
}
class NoProducto inherits Certificado{
	override method prod(){
		return false
	}	
	override method noProd(){
		return true
	}
}

