import planeta.*

class Persona {
	var edad
	
	method inteligencia() = if(edad.between(20,40)) 12 else 8
	method potencia() = 20
	method esDestacada() = edad == 25 || edad == 35
	method ofrecerTributoA(planeta) {}
	method valor() = self.potencia() + self.inteligencia()
}

class Atleta inherits Persona {
	var masaMuscular = 4
	var cantDeTecnicas = 2
	
	override method potencia() = super() + masaMuscular*cantDeTecnicas
	override method esDestacada() = super() || cantDeTecnicas >5
	override method ofrecerTributoA(planeta) { planeta.construirMurallas(2)}
	
	method entrenar(dias) { masaMuscular+= dias*0.2 }
	method aprenderTecnica() { cantDeTecnicas++ }
}

class Docente inherits Persona {
	var cantCursosDados = 0
	
	override method inteligencia() = super() + 2* cantCursosDados
	override method esDestacada() = cantCursosDados>3
	override method ofrecerTributoA(planeta) { planeta.fundarMuseo()}
	override method valor() = super()+5
}

class Soldado inherits Persona {
	const armas = []
	
	override method potencia() = super()+ self.potenciaPorArmas()
	method potenciaPorArmas() = armas.sum{a=>a.potencia()}
	override method ofrecerTributoA(planeta) { planeta.construirMurallas(5)}
}

class Pistolete {
	const largo
	
	method potenciaPara(soldado) =
		if(soldado.edad()>30) largo*3
		else largo*2
}

class Espadon {
	const peso
	
	method potenciaPara(soldado) =
		if(soldado.edad()<40) peso*0.5
		else 6
}