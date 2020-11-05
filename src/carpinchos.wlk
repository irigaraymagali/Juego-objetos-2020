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
	}
 
 method agregarFondo(){
 	  game.addVisual(fondo)
 }
 
 method agregarPersonajes(){
 	  carpincho.position(game.center())
	  game.addVisual(carpincho)
	  game.addVisual(yaguarete)
    }

method perderJuego(){
	game.clear()
	self.modo().perder()
	game.schedule(3000,{game.stop()})
}

}