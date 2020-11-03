import wollok.game.*
import movimientos.*
import objetos.*

object carpincho{
	var position = game.center()
	
	const imagenDerecha = "carpincho right.png"
	
	const imagenIzquierda = "carpincho left.png"
	
	var property image = imagenDerecha
	
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method mirarIzquierda(){
		image = imagenIzquierda
	}
	
	method mirarDerecha(){
		image = imagenDerecha	
	}

	
	method perdiste() = true 
		
//	method perseguirManzanaYHuir(){
//		const mateNuevo = new Mate(posicion= aleatorio.nuevaPosicion())
//		
//		if(self.position().x() == mateNuevo.position().x()){ 
//			
//		    if(mateNuevo.position().y() > self.position().y()){
//			 self.moverseA(self.position().up(1))} 
//			
//		       else{
//			     self.moverseA(self.position().down(1))}
//		  }else{
//			
//		      if(mateNuevo.position().x() > self.position().x()){
//			   self.moverseA(self.position().right(1))
//			   self.image("carpincho right.png")
//			   } 
//			
//		         else{
//			      self.moverseA(self.position().left(1))
//			      self.image("carpincho left.png")
//			      } 
//	          }	
//	          
//	          self.huirDeyaguarete()
//	}

		method huirDeyaguarete(){
		if(self.position().x() == yaguarete.position().x()){ 
			
		    if(yaguarete.position().y() > self.position().y()){
			 self.moverseA(self.position().down(1))} 
			
		       else{
			     self.moverseA(self.position().up(1))}
		  }else{
			
		      if(yaguarete.position().x() > self.position().x()){
			   self.moverseA(self.position().left(1))
			   self.image("carpincho right.png")
			   } 
			
		         else{
			      self.moverseA(self.position().right(1))
			      self.image("carpincho right.png")
			      } 
	          }	
	}	
	
	method chocasteConYaguarete() {
		var puntaje = puntos.puntos()
		//Termina juego
		self.perdiste()
		game.schedule(3000,{game.stop()})
		game.say(self, "¡Me atrapaste!")
		game.say(self, "Puntos obtenidos: ")
		game.sound("ganaste.mp3").play()

			
}


}

object yaguarete {
	var position = game.at (0,0)
	var property image = "yaguarete right.png"
	
	const imagenDerecha = "yaguarete right.png"
	const imagenIzquierda = "yaguarete left.png"
	
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method mirarIzquierda(){
		image = imagenIzquierda
	}
	
	method mirarDerecha(){
		image = imagenDerecha	
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
			   self.image("yaguarete right.png")} 
			
		         else{
			      self.moverseA(self.position().left(1))
			      self.image("yaguarete left.png")} 
	          }				
	}
	
	method chocasteConCarpincho(){
		//Termina juego
		carpincho.perdiste()
		game.schedule(3000,{game.stop()})
		game.say(self, "¡Perdiste! Tus puntos son: " )
		game.say(puntos,"TUS PUNTOS:   ")
		game.sound("perdiste.mp3").play()
	}
}

object puntos {
	var property puntos = 0
	
	method suma(puntosObtenidos){
		puntos = puntos + puntosObtenidos
	}
}

