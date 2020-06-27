class Provincia{
	var property ciudades=[]
	
	method agregarCiudad(lugar){
		ciudades.add(lugar)
	}
	method cantTotalPob(){
		return ciudades.sum({lugar=>lugar.habitantes()})
	}
	method cantCiudad(){
		return ciudades.size()
	}
	method tieneCiudad(lugar){
		return ciudades.contains(lugar)
	}
	
	
}
class Ciudad{
	var property habitantes=0
}