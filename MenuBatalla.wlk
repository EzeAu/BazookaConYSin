import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*

object menuBatallaBase{
	
	var property sprite = "AkaiMenu"
	var property position = game.at(0,1)
	method image() = "MenuBatalla/" + sprite  + ".png"
	
}
class MenuBatalla{
	
	var property sprite = "menuAtacar"
	var property fijado = true
	var property seleccionado = "" 
	var property position = game.at(20,2)
	method image() = "MenuBatalla/" + sprite  + seleccionado + ".png"
	
	method comprobarFijado(){
		if(fijado){
			self.seleccionado("Seleccionado")
		}else{
			self.seleccionado("")
		}
	}
	method cambioFijado(){
		fijado = !fijado
	}
}
const menuBatalla1 = new MenuBatalla(sprite="AkaiAtaque", fijado = true, seleccionado = "Seleccionado", position = game.at(18,3))
const menuBatalla2 = new MenuBatalla(sprite="AkaiProteger", fijado = false, seleccionado = "", position = game.at(25,3))

object menuBatallaCara{
	var property sprite = "Akai/AkaiCara"
	var property position = game.at(1,2)
	method image() = sprite + ".png"
}

object menuBatallaHp{
	var property sprite = 100
	var property position = game.at(9,4)
	method image() = "HP/HP" + sprite + ".png"
	
	method setHp(){
		self.sprite(controlesBatalla.personajeObjeto().vida())
	}
}


object menuBatallaEp{
	var property sprite = 10
	var property position = game.at(9,2)
	method image() = "EP/EP" + sprite + ".png"
	
	method setEp(){
		self.sprite(controlesBatalla.personajeObjeto().energia())
	}
}




object controlesBatalla{
	
	var property ataque2 = true
	var property fases = 0
	var property enemigo1 = Barco
	var property enemigo2 = Barco
	var property personaje = "Akai"
	var property personajeObjeto = Akai
	var property controles = true
	
	method aplicar(aplicado){
		keyboard.left().onPressDo{if(self.controles()){self.controlesMenuMovimiento()}}
  		keyboard.right().onPressDo{if(self.controles()){self.controlesMenuMovimiento()}}
  		keyboard.a().onPressDo{
  			if(self.controles()){
  			if(menuBatalla2.fijado() and self.fases()==0){
  				self.faseProteger(personajeObjeto)	
  			}else{
  				if(self.fases()==1){
  					if(menuBatalla2.fijado()){
  						self.ataque2(true)
  						self.controlesMenuAceptar()	
  					}else{
  						self.ataque2(false)
  						self.controlesMenuAceptar()	
  					}
  				}else{
  					self.controlesMenuAceptar()	
  					}
  				}
  			}
  		}
  		keyboard.s().onPressDo{if(self.controles()){self.controlesMenuSalir()}}

	}
	
	method controlesMenuMovimiento(){
		menuBatalla1.cambioFijado()
  		menuBatalla2.cambioFijado()
  		menuBatalla2.comprobarFijado()
  		menuBatalla1.comprobarFijado()
  		flecha.elegido(!flecha.elegido())
  		flecha.cambioElegido()
	}
	method controlesMenuAceptar(){
		if (self.fases()>=0 and self.fases()<=3){//VER
			self.fases(self.fases()+1)
			self.controlFases(self.fases())
		}
	}
	method controlesMenuSalir(){
		if (self.fases()>0){
			self.fases(self.fases()-1)
			self.controlFases(self.fases())
		}
	}
	method controlFases(_fase){
		if(_fase==0){self.fase0(personaje)}
		if(_fase==1){self.fase1(personaje)}
		if(_fase==2){self.fase2(personaje)}
		if(_fase==3){self.fase3(personajeObjeto)}
		if(_fase==4){self.fase4(personajeObjeto)}
	}
	method correccionFases(){
		if(self.fases()<0){self.fases(0)}
		if(self.fases()>4){self.fases(0)}
	}
	method faseProteger(_personaje){
		_personaje.proteger()
		flecha.instanciar()
		flecha.reinicio()
		self.fase4(personajeObjeto)
	}
	method fase0(_personaje){
		menuBatalla1.sprite(_personaje+"Ataque")
		menuBatalla2.sprite(_personaje+"Proteger")
		flecha.instanciar()
		flecha.reinicio()
	}
	method fase1(_personaje){
		menuBatalla1.sprite(_personaje+"AtaqueBasico")
		menuBatalla2.sprite(_personaje+"AtaqueFuerte")
		flecha.instanciar()
		flecha.reinicio()
	}
	method fase2(_personaje){
		menuBatalla1.sprite(_personaje+"ElegirObjetivo")
		menuBatalla2.sprite("invisible0")
		menuBatalla2.seleccionado("")
		flecha.instanciar()
	}
	method fase3(_personaje){
		if(ataque2){
			if(flecha.elegido()){
				_personaje.ataqueFuerte(enemigo1)
			}else{
				_personaje.ataqueFuerte(enemigo2)
			}
		}else{
			if(flecha.elegido()){
				_personaje.ataqueBase(enemigo1)
			}else{
				_personaje.ataqueBase(enemigo2)
			}
		}
		flecha.reinicio()
		self.fase4(personajeObjeto)
	}
	
	method fase4(_personaje){
		ataque2 = false
		self.controles(false)
		self.aplicar(self.controles())
		_personaje.realizoAccion(true)
		controlTurnos.turnoJugadores()	
		self.fases(0)
	}
}

object flecha{
	var property sprite = "invisible0"
	var property position = game.at(24,8)
	var property elegido = false
	var property spriteAnimacion
	method image() = sprite + spriteAnimacion + ".png"
	
	method instanciar(){
		self.spriteAnimacion(0)
		game.onTick(250,"FlechaAnimacion", { self.animacion(0)})
		self.sprite("MenuBatalla/Flecha")
	}
	
	method reinicio(){
		self.sprite("invisible0")
		self.spriteAnimacion("")
        game.removeTickEvent("FlechaAnimacion")
	}
	
	method cambioElegido(){
		if(elegido){
			self.position(game.at(20,10))
		}else{self.position(game.at(24,8))}
	}
	
	method animacion(incicial){
        if (spriteAnimacion!=2){
            spriteAnimacion++
        }else{
            spriteAnimacion=incicial//0
        }
}
}
