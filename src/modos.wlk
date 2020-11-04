import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*

object modoCarpincho{
	method configurarTeclas(){
		keyConfig.jugador1(carpincho)
	}

method configurarAcciones(){
	game.onTick(5000, "spawn mate aleatoriamente", {spawner.spawnMate()})
	game.onTick(15000, "spawn mate de oro aleatoriamente", {spawner.spawnMateDorado()})
	game.onTick(400, "mover yaguarete", {yaguarete.perseguirCarpincho()})
	game.onTick(30000, "spawn alfajor aleatoriamente", {spawner.spawnAlfajor()})                                                     
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}		


method perder(){
	game.removeVisual(carpincho)
	game.removeVisual(yaguarete)
	puntos.mostrarPuntaje()
	game.schedule(3000,{game.stop()})
	return carpincho.perdiste()
 }

}

object dosJugadores{
	
	method configurarTeclas(){
		//movimientos carpincho
		keyConfig.jugador1(carpincho)
		//movimientos yaguarete
		keyConfig.jugador2(yaguarete)
	}

method configurarAcciones(){
	game.onTick(5000, "spawn mate aleatoriamente", {spawner.spawnMate()})
	game.onTick(15000, "spawn mate de oro aleatoriamente", {spawner.spawnMateDorado()})
	game.onTick(30000, "spawn alfajor aleatoriamente", {spawner.spawnAlfajor()})                                                       
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}
	
method perder(){
	game.removeVisual(carpincho)
	game.removeVisual(yaguarete)
	puntos.mostrarPuntaje()
	game.schedule(3000,{game.stop()})
 }
 
}

object modoCazar{
	method configurarTeclas(){
		keyConfig.jugador1(yaguarete)
	}

method configurarAcciones(){
	game.onTick(5000, "spawn mate aleatoriamente", {spawner.spawnMate()})
	game.onTick(5000, "spawn manzana aleatoriamente", {manzana.movete() game.addVisual(manzana)})
	game.onTick(200, "mover carpincho", {carpincho.huirDeyaguarete()})                                                     
	game.onCollideDo(yaguarete,{visualColisionado=>visualColisionado.chocasteConYaguarete()})
	}		

method perder(){
	game.removeVisual(carpincho)
	game.removeVisual(yaguarete)
	game.say(puntos, "¡ganaste!")
	game.schedule(3000,{game.stop()})
 }
}
