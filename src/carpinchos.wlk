import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*
import screens.*

object juegoCarpinchoGaucho  {     
	var property modo = modoCarpincho //MODOS: modoCarpincho, dosJugadores o modoCazar
	
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		start.generarMuros()
		modo.configurarTeclas()
		modo.configurarAcciones()
		
		//game.start()
	}
	
method configurarJuego(){
	game.title("CarpinchoGaucho")
	game.width(20)
	game.height(20)
	game.cellSize(50)
	game.boardGround("campo.jpeg")
    }
 
method agregarPersonajes(){
	  game.addVisual(carpincho)
	  game.addVisual(yaguarete)
    }



}