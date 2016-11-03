package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import sprites.Jugador;
import flixel.FlxObject;
import sprites.Pelota;

class PlayState extends FlxState
{
	private var piso:FlxSprite;
	private var player1:Jugador;
	private var player2:Jugador;
	private var net:FlxSprite = new FlxSprite(FlxG.width/2 -1 , 240);
	private var pelota:Pelota;

	
	override public function create():Void
	{
		super.create();
		net.makeGraphic(3, 240);
		player1 = new Jugador(FlxG.width/4, 50);
		player2 = new Jugador(FlxG.width / 2 + FlxG.width / 4, 50);
		player2.setearTeclas(false);
		piso = new FlxSprite(0,FlxG.height-20);
		piso.makeGraphic(FlxG.width, 20);
		piso.immovable = true;
		net.immovable = true;
		pelota = new Pelota(FlxG.width/2-16, 100);
		add(piso);
		add(player1);
		add(player1.barraEnergia);
		add(player2);
		add(player2.barraEnergia);
		add(net);
		add(pelota);
		add(pelota.sombra);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player1, piso);
		FlxG.collide(player2, piso);
		colisionesPelota();
		if (player1.x >= FlxG.width/2 - player1.width)
			player1.x = FlxG.width/2 - player1.width;
		if (player2.x <= FlxG.width/2)
			player2.x = FlxG.width/2;
		
	}
	public function colisionesPelota()
	{
		if (FlxG.collide(pelota, piso))//aunque este como condicion de un if tambien hace el collide.
			trace("Punto!");//Y aca despues ponemos que haga algo segun la posicion en X de la pelota xD
		if(FlxG.collide(player1, pelota))
			pelota.velocity.y = -350;
		if(FlxG.collide(player2, pelota))
			pelota.velocity.y = -350;
		if (FlxG.collide(pelota, net))
			pelota.velocity.x *= -1;
	}
}
