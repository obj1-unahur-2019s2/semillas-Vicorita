class Planta {
	
	var property anioObtencion
	var property altura
	method horasDeSol()//{return self.horasDeSol()}
	method esFuerte(){
		return self.horasDeSol()>10
	}
	method daNuevasSemillas(){
		return self.esFuerte()
	}
}

class Menta inherits Planta{
	const property horasDeSol = 6
	override method daNuevasSemillas(){
		return super() && self.altura()>0.4
	}
	method espacioOcupa(){
		return self.altura() * 3
	}
	method esIdeal(parcela){
		return parcela.superficie()>6
	}
}

class Soja inherits Planta{
	const property horasDeSol = 6
	override method horasDeSol(){
		return if(self.altura()<0.5){6}else if(self.altura().between(0.5,1)){7}else{9}
	}
	override method daNuevasSemillas(){
		return super() && self.anioObtencion()>2007 && self.altura()>1
	}
	method espacioOcupa(){
		return self.altura()/2
	}
	method esIdeal(parcela){
		return parcela.horasDeSol() == self.horasDeSol()
	}
}

class Quinoa inherits Planta{
	const property horasDeSol
	override method daNuevasSemillas(){
		return super() && self.anioObtencion()<2005
	}
	method espacioOcupa(){
		return 0.5
	}
	method esIdeal(parcela){
		return parcela.plantas().all({p=> p.altura()<= 1.5})
	}
}

class SojaTransgnica inherits Soja{
	override method daNuevasSemillas(){
		return false
	}
	override method esIdeal(parcela){
		return parcela.cantidadMaxima() == 1
	}
}

class Hierbabuena inherits Menta{
	override method espacioOcupa(){
		return super()*2
	}
}

