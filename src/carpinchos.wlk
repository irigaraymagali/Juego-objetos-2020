import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*

object juegoCarpinchoGaucho  {     
	var modo = modoCarpincho //MODOS: modoCarpincho, dosJugadores o modoCazar
method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		modo.configurarTeclas()
		modo.configurarAcciones()
		
		//self.configurarBorde()
		game.start()
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
  

/*method configurarBorde(){
	const borde1 = new BordeMapa(position = game.at(0,0))
	//const borde2 = new BordeMapa(position = game.at(0,1))
	
	game.addVisual(borde1)
	//game.addVisual(borde2)
	
}
*/
}