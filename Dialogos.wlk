import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Mapas.*
import Inicio.*
import Iniciador.*
import Activadores.*
class Dialogos {
	var property position=game.at(0,0)	
	var property image = "invisible0.png"
}
object dialogosMapa1 inherits Dialogos{
	method animar(){
		game.schedule(1000,{image="Dialogos/Cavanidialogo1.png"})
		game.schedule(3000,{image="Dialogos/AkaiDialogo1.png"})
		game.schedule(5000,{image="Dialogos/Barcodialogo1.png"})
		game.schedule(7000,{image="Dialogos/Barcodialogo2.png"})
		game.schedule(9000,{image="Dialogos/Cavanidialogo2.png"})
	}
}
