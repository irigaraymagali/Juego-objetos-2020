import wollok.game.*
import movimientos.*
import personajes.*

class Mate {
	const property posicion

	method image() = "mate.png"
	
	method position() = posicion
	
	method chocasteConCarpincho(){
		puntos.suma(50)
		game.removeVisual(self)
	}
}

class MateDeOro {
	const property posicion

	method image() = "mate de oro.png"
	
	method position() = posicion
	
	method chocasteConCarpincho(){
		puntos.suma(150)
		game.removeVisual(self)
	}
	
}

class Alfajor {
	const property posicion

	method image() = "alfajor.png"
	
	method position() = posicion
	
	method chocasteConCarpincho(){
		puntos.suma(300)
		game.removeVisual(self)
	}
}

object manzana {
	const movimiento = aleatorio
	var property position = movimiento.posicion()
	
	var property image = "manzana.png"
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	method movete(){
		movimiento.nuevaPosicion()
	}
	method chocasteConYaguarete(){
		game.removeVisual(self)
	}
}


class BordeMapa{
	
	var property position = game.at(0,0)
	
	var property image = "bordex.png"
	
	method image() = image
	
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	method perdiste(){
	}
	
	method chocasteConCarpincho(){
	}
}