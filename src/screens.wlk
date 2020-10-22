import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*
import carpinchos.*

object carpinchoSelector{
	var position = game.at(4, 10)
	
	var property image = "Carpincho50.png"
	
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
	}
	
}

object botonModoPvp{
	var property image = "modo pvp.png"
	
	method position() = game.at (10, 10)
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(dosJugadores)
		game.clear()
		juegoCarpinchoGaucho.iniciar()
	}
	
}

object botonModoCazar{
	var property image = "modo cazar.png"
	
	method position() = game.at (10, 4)
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.modo(modoCazar)
		game.clear()
		juegoCarpinchoGaucho.iniciar()
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
		keyboard.w().onPressDo({carpinchoSelector.moverseA(carpinchoSelector.position().up(1))})
		keyboard.s().onPressDo({carpinchoSelector.moverseA(carpinchoSelector.position().down(1))})
		keyboard.a().onPressDo({carpinchoSelector.moverseA(carpinchoSelector.position().left(1))
			carpinchoSelector.image("carpincho50 girado.png")
		})
		keyboard.d().onPressDo({carpinchoSelector.moverseA(carpinchoSelector.position().right(1))
			carpinchoSelector.image("carpincho50.png")
		})
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