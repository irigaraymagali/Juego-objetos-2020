import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*

object modoCarpincho{
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
	game.onTick(5000, "mover mate aleatoriamente", {spawner.spawnMate()})
	game.onTick(15000, "mover mate de oro aleatoriamente", {spawner.spawnMateDorado()})
	game.onTick(400, "mover yaguarete", {yaguarete.perseguirCarpincho()})
	game.onTick(30000, "mover alfajor aleatoriamente", {spawner.spawnAlfajor()})                                                     
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
	game.onTick(5000, "mover mate aleatoriamente", {spawner.spawnMate()})
	game.onTick(15000, "mover mate de oro aleatoriamente", {spawner.spawnMateDorado()})
	game.onTick(30000, "mover alfajor aleatoriamente", {spawner.spawnAlfajor()})                                                       
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}
}

object modoCazar{
	method configurarTeclas(){
		keyboard.w().onPressDo({yaguarete.moverseA(yaguarete.position().up(1))})
		keyboard.s().onPressDo({yaguarete.moverseA(yaguarete.position().down(1))})
		keyboard.a().onPressDo({yaguarete.moverseA(yaguarete.position().left(1))
			yaguarete.image("imagenYaguarete50 girado.png")})
		keyboard.d().onPressDo({yaguarete.moverseA(yaguarete.position().right(1))
			yaguarete.image("imagenYaguarete50.png")})
	}

method configurarAcciones(){
	game.onTick(5000, "mover manzana aleatoriamente", {manzana.movete() game.addVisual(manzana)})
	game.onTick(200, "mover carpincho", {carpincho.perseguirManzanaYHuir()})                                                     
	game.onCollideDo(yaguarete,{visualColisionado=>visualColisionado.chocasteConYaguarete()})
	}
		
}
