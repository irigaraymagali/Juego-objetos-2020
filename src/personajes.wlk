import wollok.game.*
import movimientos.*

object carpincho{
	var position = game.at (10,10)
	
	method image() = ""  //imagen carpincho
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
}

object yaguarete{
	//var position = game.at (20,0)
	method position() = game.at (10,0)
	method image() = "" //imagen yaguarete
	//method moverseA(nuevaPosicion){
	//	position = nuevaPosicion
	//}
	method chocasteConCarpincho(){
		//Termina juego
		//carpincho.perdiste()
		game.schedule(5000,{game.stop()})  //5000? 
	}
}

object mate {
	var movimiento = aleatorio

	method image() = "" //imagen mate
	
	method position() = movimiento.posicion()

}
