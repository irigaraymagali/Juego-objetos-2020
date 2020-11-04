import wollok.game.*
import movimientos.*
import carpinchos.*
import objetos.*

object carpincho{
	var position = game.center()
	
	const imagenDerecha = "carpincho right.png"
	
	const imagenIzquierda = "carpincho left.png"
	
	const property esAtravesable = true
	
	var orientacion = derecha
	
	var property image = imagenDerecha
	
	method position() = position
	
	method puedeMoverAl(unaOrientacion) {
  	return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion(self)).all {unObj => unObj.esAtravesable()}
}
	
	method moverseA(posicion, unaOrientacion){ 
    
    orientacion = unaOrientacion 
//    self.actualizarImagen() 
    
    if(self.puedeMoverAl(unaOrientacion)){ 
      position = posicion
    } else {
        
        }
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
			 self.moverseA(self.position().down(1), abajo)} 
			
		       else{
			     self.moverseA(self.position().up(1), arriba)}
		  }else{
			
		      if(yaguarete.position().x() > self.position().x()){
			   self.moverseA(self.position().left(1), izquierda)
			   self.image("carpincho right.png")
			   } 
			
		         else{
			      self.moverseA(self.position().right(1), derecha)
			      self.image("carpincho right.png")
			      } 
	          }	
	}	
	
	method chocasteConYaguarete(){
		juegoCarpinchoGaucho.perderJuego()
	}
}

object yaguarete {
	var position = game.at (1,1)
	var property image = "yaguarete right.png"
	
	const property esAtravesable = true
	
	const imagenDerecha = "yaguarete right.png"
	const imagenIzquierda = "yaguarete left.png"
	
	var orientacion = derecha
	
	method position() = position
	
	method puedeMoverAl(unaOrientacion) {
  		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion(self)).all {unObj => unObj.esAtravesable()}
}
	
	method moverseA(posicion, unaOrientacion){ 
    
    orientacion = unaOrientacion 
//    self.actualizarImagen() 
    
    if(self.puedeMoverAl(unaOrientacion)){ 
      position = posicion
    } else {
        
        }
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
			 self.moverseA(self.position().up(1), arriba)} 
			
		       else{
			     self.moverseA(self.position().down(1), abajo)}
		  }else{
			
		      if(carpincho.position().x() > self.position().x()){
			   self.moverseA(self.position().right(1), derecha)
			   self.image("yaguarete right.png")} 
			
		         else{
			      self.moverseA(self.position().left(1), izquierda)
			      self.image("yaguarete left.png")} 
	          }				
	}
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.perderJuego()	
	}
}

object puntos {
	var property puntaje = 0
	
	const property position = game.center()
	
	const property image = "carpincho right.png"	
	
	method mostrarPuntaje(){
		game.addVisual(self)
		game.say(self, "¡Perdiste! Tus puntos son: " + puntaje)
		game.sound("perdiste.mp3").play()
	}
	
	method suma(puntosObtenidos){
		puntaje = puntaje + puntosObtenidos
	}
}

