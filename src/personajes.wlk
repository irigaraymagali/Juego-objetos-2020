import wollok.game.*
import movimientos.*

object carpincho{
	var position = game.center()
	
	method image() = "Carpincho1.png"
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	method perdiste(){
	}
}

object yaguarete{
	var position = game.at (0,0)
	method position() = position
	method image() = "imagenYaguarete.jpg"
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	method perseguirCarpincho(){
		
     	if(self.position().x() == carpincho.position().x()){ 
			
		    if(carpincho.position().y() > self.position().y()){
			 self.moverseA(self.position().up(1))} 
			
		       else{
			     self.moverseA(self.position().down(1))}
		  }else{
			
		      if(carpincho.position().x() > self.position().x()){
			   self.moverseA(self.position().right(1))} 
			
		         else{
			      self.moverseA(self.position().left(1))} 
	          }				
	}
	
	
	method chocasteConCarpincho(){
		//Termina juego
		carpincho.perdiste()
		game.schedule(5000,{game.stop()})
		game.say(self, "¡Perdiste!")
	}
}

object mate {
	const movimiento = aleatorio

	method image() = "mate.png"
	
	method position() = movimiento.posicion()
	
	method chocasteConCarpincho(){
		puntos.suma(50)
	}
	method movete(){
		movimiento.nuevaPosicion()
	}
}

object mateDeOro {
	const movimiento = aleatorio

	method image() = "mateOro.png"
	
	method position() = movimiento.posicion()
	
	method movete() {
		movimiento.nuevaPosicion()
	}
	
	method chocasteConCarpincho(){
		puntos.suma(150)
	}
}

object puntos {
	var puntos = 0
	// Contador en pantalla ?
	method suma(puntosObtenidos){
		puntos = puntos + puntosObtenidos
	}
}
