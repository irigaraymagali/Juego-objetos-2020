import wollok.game.*
import personajes.*
import movimientos.*

object juegoCarpinchoGaucho  {     
	
method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		game.start()
	}
	
method configurarJuego(){
	game.title("CarpinchoGaucho")
	game.width(30)
	game.height(20)
	//game.cellSize(50)
	game.boardGround("campo.jpeg")
    }
 
method agregarPersonajes(){
	  game.addVisual(carpincho)
	  game.addVisual(yaguarete)
	  game.addVisual(mate)
    } 
  
method configurarTeclas(){
		keyboard.w().onPressDo({carpincho.moverseA(carpincho.position().up(1))})
		keyboard.s().onPressDo({carpincho.moverseA(carpincho.position().down(1))})
		keyboard.a().onPressDo({carpincho.moverseA(carpincho.position().left(1))})
		keyboard.d().onPressDo({carpincho.moverseA(carpincho.position().right(1))})
	}

method configurarAcciones(){
	game.onTick(5000, "mover mate aleatoriamente", {mate.movete()})
	game.onTick(15000, "mover mate de oro aleatoriamente", {mateDeOro.movete() 
	                                                     game.addVisual(mateDeOro)})
	game.onTick(500, "mover yaguarete", {yaguarete.perseguirCarpincho()})                                                     
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}
}
