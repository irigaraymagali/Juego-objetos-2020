import wollok.game.*
import movimientos.*
import personajes.*
import screens.*

class ObjetoAleatorio {
	const property posicion
	
	const property esAtravesable = true
	
	method position() = posicion
	method image() = ""
	method puntosQueDa() = 0

	method chocasteConCarpincho(){
		puntos.suma(self.puntosQueDa())
		game.removeVisual(self)
		game.sound("agarrarObjeto.mp3").play()

	}
	method chocasteConYaguarete(){
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

class Hielo inherits ObjetoAleatorio{ 
    override method image() = "hielo.png"
	override method chocasteConCarpincho(){
		self.congelar(carpincho)
	}
	override method chocasteConYaguarete(){
		self.congelar(yaguarete)
	}
	
	method congelar(personaje){
	game.removeVisual(self)
	personaje.estaCongelado(true)
	game.schedule(3000, {personaje.estaCongelado(false)})
	}
}

class Manzana inherits ObjetoAleatorio{ 
    override method image() = "manzana.png"

}

class Muro{
	
	var property position = game.at(0,0)
	
	var property image = "madera.png"
	
	var property esAtravesable = false
	
	method image() = image
	
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method chocasteConCarpincho(){
	}
}

class Arbusto inherits Muro{
	override method image() = "arbusto.png"
}

