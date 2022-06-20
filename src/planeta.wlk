import personas.*

class Planeta {
	const habitantes = []
	var cantMuseos
	var longitudMurallas =0
	
	method agregarHabitantes(habs) { habitantes.addAll(habs) }
	method delegacionDiplomatica() = habitantes.filter{h=>h.esDestacada()}.asSet()
	method valorInicialDefensa() = habitantes.count{h=>h.potencia()>= 30}
	method esCulto() = cantMuseos>=2 && habitantes.all{h=>h.inteligencia()>= 10}
	method potenciaReal() = habitantes.sum{h=>h.potencia()}
	method construirMurallas(cant) {longitudMurallas+=cant}
	method fundarMuseo() {cantMuseos++}
	method potenciaAparente() = self.potDelMasPotente() *habitantes.size()
	method potDelMasPotente() = habitantes.max({h=>h.potencia()}).potencia()
	method necesitaReforzarse() = self.potenciaAparente() >= self.potenciaReal()*2
	method recibirTributos() = habitantes.forEach{h=>h.ofrecerTributoA(self)} 
	method habitantesValiosos() = habitantes.filter{h=>h.valor()>=40}
	method apaciguar(planeta) = self.habitantesValiosos().forEach{h=>h.ofrecerTributoA(planeta)}
}