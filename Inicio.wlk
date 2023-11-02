import wollok.game.*
import Mapas.*


object inicio {
		
	var property sprite = "Inicio/inicio"
	var property spriteAnimacion = 1
	var property compruebaInicioSong = false
	var property position = game.origin()
	method image() =  sprite + spriteAnimacion + ".png"
	
	method set(){
		//Parametros Ventana
		game.width(1024/32)
  		game.height(768/32)
  		game.cellSize(32)
  		game.title("Bazooka")
  		
		game.addVisual(self)
		game.addVisual(titulo)
		game.addVisual(enter)
		
		game.onTick(50, "InicioAnimacion", { self.animacion() })
		self.compruebaInicioSong(true)
		keyboard.enter().onPressDo{
			game.removeTickEvent("InicioAnimacion")
			sprite= "Cargando/cargando"
			spriteAnimacion=3
			game.onTick(300, "inicioAnimacion2" ,{ self.animacion(3) } )
			game.schedule(4500, { 
				sprite="invisible0"
				mapa1.iniciar()
				game.removeTickEvent("inicioAnimacion2")
			} )
		}
		
		game.start()
	}
	
	method animacion(){
        if (spriteAnimacion!=18){
            spriteAnimacion++
        }else{
            spriteAnimacion=1
        }
    }
    
    method animacion(incicial){
        if (spriteAnimacion!=1){
            spriteAnimacion--
        }else{
            spriteAnimacion=incicial//0
        }
    }
}

object titulo{
	var property sprite = "Inicio/titulo"
	var property position = game.origin()
	method image() = sprite + ".png"
}
object enter{
	var property sprite = "Inicio/Enter"
	var property position = game.at(28,1)
	method image() = sprite + ".png"
}
