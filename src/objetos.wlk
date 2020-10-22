import wollok.game.*
import movimientos.*
import personajes.*

class Mate {
	const property posicion

	method image() = "mate50.png"
	
	method position() = posicion
	
	method chocasteConCarpincho(){
		puntos.suma(50)
		game.removeVisual(self)
	}
}

class MateDeOro {
	const property posicion

	method image() = "mateOro50.png"
	
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