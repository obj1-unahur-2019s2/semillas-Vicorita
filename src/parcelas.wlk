import plantas.*

class Parcela {
var property ancho
var property largo
var property horasDeSol
var property plantas = #{}
var property tipoParcela
	
	method superficie(){
		return ancho * largo
	}
	method cantidadMaxima(){
		return if(ancho>largo){self.superficie()/5}
		else{self.superficie()}
	}
	method tieneComplicaciones(){
		return plantas.any({p=> p.horasDeSol()< horasDeSol})
	}
	method plantar(planta){
		plantas.add(planta)
		if(plantas.size()>self.cantidadMaxima() || horasDeSol- planta.horasDeSol()>=2){
			self.error("Error")
		}
	}
	method seAsociaBien(planta){
		if (tipoParcela == "ecologica"){
			return !self.tieneComplicaciones() && planta.esIdeal(self)
		}else{
			return plantas.size()>2 && planta.esFuerte()
		}
	}
	method cantidadBienAsociadas(){
		return plantas.count({p=> self.seAsociaBien(p)})
	}
	method porcentajeBienAsociadas(){
		return self.cantidadBienAsociadas()/ plantas.size() * 100
	}
	
}

object inta{
	var property parcelas = #{}
	method promedioPlantas(){
		return parcelas.sum({p=> p.plantas().size()}) / parcelas.size()
	}
	method tieneVariasPlantas(){
		return parcelas.filter({p=> p.plantas().size() > 4})
	}
	method masAutosustentable(){
		return self.tieneVariasPlantas().max({p=> p.porcentajeBienAsociadas()})
	}
}