import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*
import carpinchos.*

object pantallaFinal{
	
}

object fondo{
	var property image = "fondocampo.png"
	var property position = game.at(1, 1)
	const property esAtravesable = true
	method chocasteConCarpincho(){}
}

class Boton{
	var property image
	var posicion
	var modo
	
	const property esAtravesable = true
	
	method position() = posicion
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(modo)
		game.clear()
		juegoCarpinchoGaucho.iniciar()
		game.sound("start.mp3").play()
	}	
}

const botonModoCarpincho = new Boton(
	image = "modo carpincho.png",
	posicion = game.at(12, 12),
	modo = modoCarpincho
)

const botonModoPvp = new Boton(
	image = "modo pvp.png",
	posicion = game.at(12, 8),
	modo = dosJugadores
)

const botonModoCazar = new Boton(
	image = "modo cazar.png",
	posicion = game.at(12, 4),
	modo = modoCazar
)

object start{
	
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		self.generarMuros()
		game.start()
		
	}
	
	method configurarJuego(){
	game.title("CarpinchoGaucho")
	game.width(20)
	game.height(20)
	game.cellSize(50)
	game.boardGround("fondocarpinchos2.png")
    }
	
	method configurarTeclas(){
		keyConfig.jugador1(carpinchoSelector)
	}
	
	method agregarPersonajes(){
	  	game.addVisual(carpinchoSelector)
	  	game.addVisual(botonModoCarpincho)
	  	game.addVisual(botonModoPvp)
	  	game.addVisual(botonModoCazar)
    }
    
    method configurarAcciones(){
    	game.onCollideDo(carpinchoSelector,{visualColisionado=>visualColisionado.chocasteConCarpincho()})
    }
    
  	method generarMuros() {
   		const ancho = game.width() - 1 
   		const alto = game.height() - 1 
   		const posicionesParaGenerarMuros = []
		
   		(0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(num, alto)))} // lado superior
   		(0 .. ancho).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(num, 0)))} // lado inferior
   		(0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(ancho, num)))} // lado derecho
   		(0 .. alto).forEach{ num => posicionesParaGenerarMuros.add(new Muro(position = game.at(0, num)))} // lado izquierdo
    
   		posicionesParaGenerarMuros.forEach {posicion => game.addVisual(posicion)}
}
    
}

object carpinchoSelector{
	var position = game.at(4, 10)
	const imagenIzquierda = "carpincho left.png"
	
	var property image = "carpincho right.png"
	
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
	method mirarDerecha(){
		image = "carpincho right.png"	
	}
	method mirarIzquierda(){
		image = imagenIzquierda
	}
}