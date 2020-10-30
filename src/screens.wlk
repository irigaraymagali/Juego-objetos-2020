import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*
import carpinchos.*

object carpinchoSelector{
	var position = game.at(4, 10)
	
	var property image = "carpincho right.png"
	
	method position() = position
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
}

object botonModoCarpincho{
	var property image = "modo carpincho.png"
	
	method position() = game.at (10, 16)
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(modoCarpincho)
		game.clear()
		juegoCarpinchoGaucho.iniciar()
		game.sound("start.mp3").play()
	}
	
}

object botonModoPvp{
	var property image = "modo pvp.png"
	
	method position() = game.at (10, 10)
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(dosJugadores)
		game.clear()
		juegoCarpinchoGaucho.iniciar()
		game.sound("start.mp3").play()
	}
	
}

object botonModoCazar{
	var property image = "modo cazar.png"
	
	method position() = game.at (10, 4)
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(modoCazar)
		game.clear()
		juegoCarpinchoGaucho.iniciar()
		game.sound("start.mp3").play()
	}
	
}





object start{
	
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		//self.configurarBorde()
		game.start()
	}
	
	method configurarJuego(){
	game.title("CarpinchoGaucho")
	game.width(20)
	game.height(20)
	game.cellSize(50)
	game.boardGround("campo.jpeg")
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
}