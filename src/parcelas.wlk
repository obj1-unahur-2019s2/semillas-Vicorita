class Parcela {
var property ancho
var property largo
var property horasDeSol
var property plantas = #{}	
	
	method superficie(){
		return ancho * largo
	}
	method cantidadMaxima(){
		return if(self.ancho()>self.largo()){self.superficie()/5}
		else{self.superficie()}
	}
	method tieneComplicaciones(){
		return plantas.any({p=> p.horasDeSol()< self.horasDeSol()})
	}
	method plantar(planta){
		planta.add(plantas)
		if(plantas.size()>self.cantidadMaxima() || self.horasDeSol()-planta.horasDeSol()>=2){
			self.error("Error")
		}
	}
	
}
