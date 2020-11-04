import wollok.game.*
import movimientos.*
import personajes.*
import objetos.*
import modos.*
import screens.*

object juegoCarpinchoGaucho  {     
	var property modo = modoCarpincho //MODOS: modoCarpincho, dosJugadores o modoCazar
	
	method iniciar() {
		self.agregarFondo()
		self.agregarPersonajes()
		start.generarMuros()
		modo.configurarTeclas()
		modo.configurarAcciones()
		
		//game.start()
	}
 
 method agregarFondo(){
 	  game.addVisual(fondo)
 }
 
 method agregarPersonajes(){
	  game.addVisual(carpincho)
	  game.addVisual(yaguarete)
    }

}