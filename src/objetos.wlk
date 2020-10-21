import wollok.game.*
import movimientos.*
import personajes.*

class Mate {
	const movimiento = aleatoriomate

	method image() = "mate50.png"
	
	method position() = movimiento.posicion()
	
	method chocasteConCarpincho(){
		puntos.suma(50)
		game.removeVisual(self)
	}
	method movete(){
		movimiento.nuevaPosicion()
	}

}

class MateDeOro {
	const movimiento = aleatoriomatedorado

	method image() = "mateOro50.png"
	
	method position() = movimiento.posicion()
	
	method chocasteConCarpincho(){
		puntos.suma(150)
		game.removeVisual(self)
	}
	
	method movete(){
		movimiento.nuevaPosicion()
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