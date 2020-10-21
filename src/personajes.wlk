import wollok.game.*
import movimientos.*
import objetos.*

object carpincho{
	var position = game.center()
	
	var property image = "Carpincho50.png"
	
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	method perdiste(){
	}
}

object yaguarete{
	var position = game.at (0,0)
	var property image = "imagenYaguarete50.png"
	method position() = position
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
			   self.moverseA(self.position().right(1))
			   self.image("imagenYaguarete50.png")} 
			
		         else{
			      self.moverseA(self.position().left(1))
			      self.image("imagenYaguarete50 girado.png")} 
	          }				
	}
	
	
	method chocasteConCarpincho(){
		//Termina juego
		carpincho.perdiste()
		game.schedule(1000,{game.stop()})
		game.say(self, "¡Perdiste!")
	}
}

object puntos {
	var property puntos = 0
	// Contador en pantalla ?
	method suma(puntosObtenidos){
		puntos = puntos + puntosObtenidos
	}
}

