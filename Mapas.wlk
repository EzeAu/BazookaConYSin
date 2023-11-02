import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Iniciador.*
import Activadores.*

class Mapas{
 method image(){}
 method iniciar(){}
 method set(){}
 method configuracionTeclas(){
	game.onTick(1100, "Detenerser", { Akai.spriteAnimacion(0) })
	//configuracion Tecla
	keyboard.up().onPressDo { 
		Akai.mover("Arriba")
		if(Akai.avanzarMapa(Akai.position().up(1))){
		Akai.position(Akai.position().up(1))
		}
	}
	keyboard.right().onPressDo { 
		Akai.mover("Derecha")	
		if(Akai.avanzarMapa(Akai.position().right(1))){
		Akai.position(Akai.position().right(1))
	}
	
	}
	keyboard.left().onPressDo { 
		Akai.mover("Izquierda")  
		if(Akai.avanzarMapa(Akai.position().left(1))){		
		Akai.position(Akai.position().left(1))
		
		}
	}
	keyboard.down().onPressDo { 
		
		Akai.mover("Abajo")
		if(Akai.avanzarMapa(Akai.position().down(1))){	 			
		Akai.position(Akai.position().down(1))
		}
	}
}
	method setObjetos(){}
}
object mapa1 inherits Mapas {
	 	
const property colisiones=#{ /*caasa 1*/game.at(2,5),game.at(2,6),game.at(3,4),game.at(3,7),game.at(3,8),game.at(4,4),game.at(5,4)
	,game.at(6,4),game.at(7,4),game.at(8,4),game.at(3,8),game.at(4,8),game.at(5,8),game.at(6,8),game.at(7,8),game.at(7,7),game.at(8,6)
	,game.at(7,5)
	//casa 2
	,game.at(2,15),game.at(2,14),game.at(3,14),game.at(4,14),game.at(5,14),game.at(6,13),game.at(7,13),game.at(8,15),game.at(8,18),
	game.at(3,17),game.at(3,16),game.at(4,17),game.at(5,17),game.at(6,17),game.at(7,17),game.at(7,14),game.at(7,16),game.at(3,12),game.at(8,18)
	//casa 3 y extras
	,game.at(15,16),game.at(15,15),game.at(15,14),game.at(16,14),game.at(16,17),game.at(16,18),game.at(17,18),game.at(18,18),
	game.at(19,18),game.at(20,18),game.at(21,18),game.at(21,17),game.at(21,16),game.at(22,15),game.at(21,14),game.at(17,14),
	game.at(18,14),game.at(19,14),game.at(20,14),game.at(21,14),game.at(17,8),game.at(27,19),game.at(27,18),game.at(27,17),game.at(27,16),
	game.at(27,15),game.at(27,14),game.at(27,13),game.at(27,7),game.at(27,6),game.at(27,5),game.at(27,4),game.at(27,3),game.at(26,8),
	game.at(27,12),game.at(26,12),game.at(28,12),game.at(29,12),game.at(30,12),game.at(31,12),game.at(27,8),game.at(28,9)
	,game.at(29,9),game.at(30,9),game.at(31,9),game.at(26,9)
}
	
	
	method iniciar(){
  		game.addVisual(fondo)
  		self.set()
  		activador1.colision()
	
	}	
	method set(){
		self.setObjetos()
		self.configuracionTeclas()
		
	}
	method setObjetos(){

		activador1.position(game.at(25,10))
		activador2.position(game.at(25,11))
		Akai.position(game.at(20,10))
		game.addVisual(activador1)
		game.addVisual(activador2)
		game.addVisual(Akai)
		game.addVisual(Pharsa)
		Pharsa.position(game.at(26,10))
	}

}

object mapa2 inherits Mapas{
		
	const property colisiones=#{game.at(5,5)}
	method image()="Mapas/Map002.png"
	method set(){
		game.width(1024/32)
  		game.height(768/32)
  		game.cellSize(32)
  		game.title("Bazooka")
		self.setObjetos()
		self.configuracionTeclas()
	}
	method setObjetos(){
	Akai.position(game.at(30,20))
	game.addVisual(Akai)

	}
}
object oscuridad{
	
	method image()="oscurida.png"
	method position() {
		return game.at(Akai.position().x()+60,Akai.position().y()+37)
	}
	
}



