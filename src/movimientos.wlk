import wollok.game.*

class Aleatorio {
	var posicion = game.at(8, 8)

	method posicion() = posicion

	method nuevaPosicion() {
		// calculo coordenadas aleatorias dentro la pantalla
		const x = 0.randomUpTo(game.width())
		const y = 0.randomUpTo(game.height())
		// cambio a nueva posicion
		posicion = game.at(x, y)
	}
}

const aleatoriomate = new Aleatorio()
const aleatoriomatedorado = new Aleatorio()