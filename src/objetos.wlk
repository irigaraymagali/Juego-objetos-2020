import wollok.game.*
import movimientos.*
import personajes.*

class ObjetoAleatorio {
	const property posicion
	
	method image() = ""
	method puntosQueDa() = 0

	method chocasteConCarpincho(){
		puntos.suma(self.puntosQueDa())
		game.removeVisual(self)
		game.sound("agarrarObjeto.mp3").play()

	}
}

class Mate inherits ObjetoAleatorio{
	
    override method puntosQueDa()= 50

	override method image() = "mate.png"
	
}

class MateDeOro inherits ObjetoAleatorio{

    override method puntosQueDa() = 150
    
	override method image() = "mate de oro.png"
	
}

class Alfajor inherits ObjetoAleatorio{

    override method puntosQueDa() = 300
    
	override method image() = "alfajor.png"
	
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
		game.sound("agarrarObjeto.mp3").play()
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