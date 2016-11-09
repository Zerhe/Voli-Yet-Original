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
	private var net:FlxSprite = new FlxSprite(FlxG.width/2, 240);
	private var pelota:Pelota;
	//private var score01:Int = 0;
	//private var score02:Int = 0;
	private var scoreText:FlxText;
	

	
	override public function create():Void
	{
		super.create();
		net.makeGraphic(3, 240);
		scoreText = new FlxText(300, 20, 0, Reg.score01 + "|" + Reg.score02, 20);
		player1 = new Jugador(FlxG.width/4, 50);
		player2 = new Jugador(FlxG.width / 2 + FlxG.width / 4, 50);
		player2.setearTeclas(false);
		piso = new FlxSprite(0,FlxG.height-20);
		piso.makeGraphic(FlxG.width, 20);
		piso.immovable = true;
		net.immovable = true;
		pelota = new Pelota(FlxG.width/2-16, 100);
		add(piso);
		add(scoreText);
		add(pelota);
		add(pelota.sombra);
		add(player1);
		add(player1.barraEnergia);
		add(player2);
		add(player2.barraEnergia);
		add(net);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		scoreText.destroy();
		scoreText = new FlxText(300, 20, 0, Reg.score01 + " | " +Reg.score02, 20);
		add(scoreText);
		FlxG.collide(player1, piso);
		FlxG.collide(player2, piso);
		colisionesPelota();
		if (player1.x >= FlxG.width/2 - player1.width)
			player1.x = FlxG.width/2 - player1.width;
		if (player2.x <= FlxG.width/2)
			player2.x = FlxG.width/2;
		
		if (FlxG.keys.pressed.R)
			FlxG.resetState();
	}
	public function colisionesPelota()
	{
		if (FlxG.collide(pelota, piso))
		{
			if(pelota.x > net.x)
				Reg.score01++;
			else
				Reg.score02++;
			pelota.x = FlxG.width / 2 - 16;
			/*pelota.y = 100;
			pelota.velocity.x = 0;*/
			FlxG.resetState();
		}
		if(FlxG.collide(player1, pelota))
			pelota.velocity.y = -350;
		if(FlxG.collide(player2, pelota))
			pelota.velocity.y = -350;
		if (FlxG.collide(pelota, net))
		{
			pelota.velocity.y = -200;
			pelota.velocity.x *= -1;
		}
	}
}
