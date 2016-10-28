package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Jugador;
import flixel.FlxObject;

class PlayState extends FlxState
{
	private var piso:FlxSprite;
	private var player1:Jugador;
	private var player2:Jugador;
	private var net:FlxSprite = new FlxSprite(FlxG.width/2 -1 , 240);
	
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
		add(player1);
		add(player2);
		add(piso);
		add(net);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player1, piso);
		FlxG.collide(player2, piso);
		if (player1.x >= FlxG.width/2 - player1.width)
			player1.x = FlxG.width/2 - player1.width;
		if (player2.x <= FlxG.width/2)
			player2.x = FlxG.width/2;
		
	}
}
