import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*

object unJugador{
	method configurarTeclas(){
		keyboard.w().onPressDo({carpincho.moverseA(carpincho.position().up(1))})
		keyboard.s().onPressDo({carpincho.moverseA(carpincho.position().down(1))})
		keyboard.a().onPressDo({carpincho.moverseA(carpincho.position().left(1))
			carpincho.image("carpincho50 girado.png")
		})
		keyboard.d().onPressDo({carpincho.moverseA(carpincho.position().right(1))
			carpincho.image("carpincho50.png")
		})
	}

method configurarAcciones(){
	game.onTick(5000, "mover mate aleatoriamente", {const mate = new Mate() game.addVisual(mate) mate.movete()})
	game.onTick(15000, "mover mate de oro aleatoriamente", {const mateDeOro = new MateDeOro() game.addVisual(mateDeOro) mateDeOro.movete()})
	game.onTick(500, "mover yaguarete", {yaguarete.perseguirCarpincho()})                                                     
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}
}

object dosJugadores{
	
	method configurarTeclas(){
		//movimientos carpincho
		
		keyboard.w().onPressDo({carpincho.moverseA(carpincho.position().up(1))})
		keyboard.s().onPressDo({carpincho.moverseA(carpincho.position().down(1))})
		keyboard.a().onPressDo({carpincho.moverseA(carpincho.position().left(1))
			carpincho.image("carpincho50 girado.png")
		})
		keyboard.d().onPressDo({carpincho.moverseA(carpincho.position().right(1))
			carpincho.image("carpincho50.png")
		})
		
		//movimientos yaguarete
		
		keyboard.up().onPressDo({yaguarete.moverseA(yaguarete.position().up(1))})
		keyboard.down().onPressDo({yaguarete.moverseA(yaguarete.position().down(1))})
		keyboard.left().onPressDo({yaguarete.moverseA(yaguarete.position().left(1))
			yaguarete.image("imagenYaguarete50 girado.png")
		})
		keyboard.right().onPressDo({yaguarete.moverseA(yaguarete.position().right(1))
			yaguarete.image("imagenYaguarete50.png")
		})
	}

method configurarAcciones(){
	game.onTick(5000, "mover mate aleatoriamente", {const mate = new Mate() game.addVisual(mate) mate.movete()})
	game.onTick(15000, "mover mate de oro aleatoriamente", {const mateDeOro = new MateDeOro() game.addVisual(mateDeOro) mateDeOro.movete()})                                                   
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}
}

