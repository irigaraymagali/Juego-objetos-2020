import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*

object modoCarpincho{
	method configurarTeclas(){
		keyConfig.jugador1(carpincho)
	}

method configurarAcciones(){
	spawner.spawnPorTiempo()
	game.onTick(400, "mover yaguarete", {yaguarete.perseguirCarpincho()})                                                     
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	}		


method perder(){
	puntos.mostrarPuntaje()
 }

}

object dosJugadores{
	
	method configurarTeclas(){
		keyConfig.jugador1(carpincho)
		keyConfig.jugador2(yaguarete)
	}

method configurarAcciones(){
	spawner.spawnPorTiempo()                                                    
	game.onCollideDo(carpincho,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
	game.onCollideDo(yaguarete,{visualColisionado=>visualColisionado.chocasteConYaguarete()})
	}

	
	
method perder(){
	puntos.mostrarPuntaje()
 } 
}
object modoCazar{
	method configurarTeclas(){
		keyConfig.jugador1(yaguarete)
	}

method configurarAcciones(){
	spawner.spawnPorTiempo()
	game.onTick(200, "mover carpincho", {carpincho.huirDeyaguarete()})                                                     
	game.onCollideDo(yaguarete,{visualColisionado=>visualColisionado.chocasteConYaguarete()})
	}		

method perder(){
	game.addVisual(puntos)
	game.say(puntos, "¡Ganaste!")
 }
}
