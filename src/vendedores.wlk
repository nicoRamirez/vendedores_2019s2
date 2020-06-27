import geografia.*
import distribucion.*
class Vendedor {
	var property certificados=[]
	method trabajarEn(lugar)
	method agregarCertificado(cert){
		certificados.add(cert)
	}
	method versatil(){
		return self.cantCertificados() >=3 and
		self.certificadosProd() >=1 and 
		self.certificadosNoProd() >= 1
 	}	
	method cantCertificados(){
		return certificados.size()
	}
	method certificadosProd(){
		return certificados.count({certificado=>certificado.prod()})
	}
	method certificadosNoProd(){
		return certificados.count({certificado=>certificado.noProd()})
	}
	method esFirme(){
		return self.certificadosPunt() >= 30
	}
	method certificadosPunt(){
		return certificados.sum({certificado=>certificado.puntos()})
	}
	method influyente()
	method afinidad(centro){
		return self.trabajarEn(centro.origen())
	}
	method esFisica(){
		return fisica.fisic()
	}
	method esCandidato(cent){
		return self.versatil() and self.afinidad(cent)
	}
}
class VendedorFijo inherits Vendedor{
	var property lugTrabajo=null
	override method trabajarEn(lugar){
		return self.lugTrabajo() == lugar
	}
	override method influyente(){
		return false
	}
}
class Viajante inherits Vendedor{
	var property lugHabilitados=[]
	
	method agregarProvincia(lugar){
		lugHabilitados.add(lugar)
	}
	override method trabajarEn(lugarComparar){
		return lugHabilitados.any({lugar=>lugar.tieneCiudad(lugarComparar)})
	}
	override method influyente(){
		return self.totalPobCiudades() >= 10000000
	}
	method totalPobCiudades(){
		return lugHabilitados.sum({lugar=>lugar.cantTotalPob()})
	}
}	
class Corresponsal inherits Viajante{
	override method influyente(){
		return self.cantCiudades() >= 5 or 
		self.cantProvincia() >= 3 
	}
	method cantCiudades(){
		return lugHabilitados.sum({lugar=>lugar.cantCiudad()})
	}
	method cantProvincia(){
		return lugHabilitados.size()
	}
	override method afinidad(centro){
	return	super(centro) and not centro.cubrir(centro.origen())
	}
	override method esFisica(){
		return not fisica.fisic()
	}
}
object fisica{
	const property fisic=true
}
