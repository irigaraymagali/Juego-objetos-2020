import wollok.game.*
import objetos.*

object aleatorio {
	var posicion = game.at(8, 8)

	method posicion() = posicion

	method nuevaPosicion() {
		// calculo coordenadas aleatorias dentro la pantalla
		const x = 0.randomUpTo(game.width())
		const y = 0.randomUpTo(game.height())
		// cambio a nueva posicion
		posicion = game.at(x, y)
		return posicion
	}
}


object spawner{
	method spawnMate(){
		game.addVisual(new Mate(posicion = aleatorio.nuevaPosicion()))
	}
	
	method spawnMateDorado(){
		game.addVisual(new MateDeOro(posicion = aleatorio.nuevaPosicion()))
	}
	
	method spawnAlfajor(){
		game.addVisual(new Alfajor(posicion = aleatorio.nuevaPosicion()))
	}
}