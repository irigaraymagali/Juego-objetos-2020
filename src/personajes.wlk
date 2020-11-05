import wollok.game.*
import movimientos.*
import carpinchos.*
import objetos.*

object carpincho{
	var property position = game.at(4,8)
	
	const property imagenDerecha = "carpincho right.png"
	
	const property imagenIzquierda = "carpincho left.png"
	
	const property esAtravesable = true
	
	var orientacion = derecha
	
	var property image = imagenDerecha
	
	method position() = position
	
	method puedeMoverAl(unaOrientacion) {
  	return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion(self)).all {unObj => unObj.esAtravesable()}
}
	
	method moverseA(posicion, unaOrientacion){ 
    orientacion = unaOrientacion 
    self.actualizarImagen() 
    
    if(self.puedeMoverAl(unaOrientacion)){ 
      position = posicion
    } else {
        
        }
  }
  
   method actualizarImagen() {
    image = orientacion.imagenDelJugador(self)
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
			   } 
			
		         else{
			      self.moverseA(self.position().right(1), derecha)
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
	
	const property imagenDerecha = "yaguarete right.png"
	const property imagenIzquierda = "yaguarete left.png"
	
	var orientacion = derecha
	
	method position() = position
	
	method puedeMoverAl(unaOrientacion) {
  		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion(self)).all {unObj => unObj.esAtravesable()}
}
	
	method moverseA(posicion, unaOrientacion){ 
    
    orientacion = unaOrientacion 
    self.actualizarImagen() 
    
    if(self.puedeMoverAl(unaOrientacion)){ 
      position = posicion
    } else {
        
        }
  }
	method perseguirCarpincho(){
		
     	if(self.position().x() == carpincho.position().x()){ 
			
		    if(carpincho.position().y() > self.position().y()){
			 self.moverseA(self.position().up(1), arriba)} 
			
		       else{
			     self.moverseA(self.position().down(1), abajo)}
		  }else{
			
		      if(carpincho.position().x() > self.position().x()){
			   self.moverseA(self.position().right(1), derecha)} 
			
		         else{
			      self.moverseA(self.position().left(1), izquierda)} 
	          }				
	}
	
	   method actualizarImagen() {
    image = orientacion.imagenDelJugador(self)
  }
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.perderJuego()	
	}
}



