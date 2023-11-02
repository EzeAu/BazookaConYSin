import wollok.game.*
import Batallas.*
import Personajes.*
import MenuBatalla.*
import MenuBatalla.*


class Enemigo inherits Personaje{
	
	
	
    method image() = sprite + estado + direccion + spriteAnimacion + ".png"
	method ataqueRecibido(_personaje){
			self.vida(self.vida() - _personaje.danioPersonaje())
			self.direccion("Danio")
			game.schedule(950,  { self.direccion("") })
    }
	
	method atacar(_personaje){
		
		game.schedule(100, {
            	spriteAnimacion=0
            	self.animacionAtaques("Ataque")  
            	game.schedule(800 ,{ 
            		self.calculoDanio(_personaje)
            		self.realizoAccion(true) 
            		if(contador==3){
    		 		game.removeTickEvent("AnimacionAtaque")
    		 		self.direccion("")
    		 		menuBatallaHp.setHp()
    		 		contador = 0
    			}})
    			
            })
		
	}
	
	method animacionAtaques(accion){
 		spriteAnimacion=0
    	self.direccion(accion)
    	game.onTick(200, "AnimacionAtaque", {contador++
    		self.animacion(0)
    	})
    }
		
		method calculoDanio(_personaje){
			_personaje.vida(_personaje.vida()-(self.danioPersonaje()-_personaje.modificadorDanio()))
		}
	
}

const Cavani = new Enemigo(sprite = "Cavani/Cavani", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(20,10),realizoAccion=false, danioPersonaje=15)
const Barco = new Enemigo(sprite = "Barco/Barco", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(24,8),realizoAccion=false, danioPersonaje=15)



