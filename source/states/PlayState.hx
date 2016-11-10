package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxBar;
import flixel.text.FlxText;
import sprites.Jugador;
import flixel.FlxObject;
import sprites.Pelota;

class PlayState extends FlxState
{
	private var piso:FlxSprite;
	private var player1:Jugador;
	private var player2:Jugador;
	private var net:FlxSprite = new FlxSprite(FlxG.width/2-1, 260);
	private var pelota:Pelota;
	private var scoreText:FlxText;
	private var energiaPlayer1:FlxBar;
	private var energiaPlayer2:FlxBar;
	private var fondo:FlxSprite = new FlxSprite();
	
	override public function create():Void
	{
		super.create();
		net.makeGraphic(3, 240);
		FlxG.mouse.visible = false;
		scoreText = new FlxText(300, 20, 0, Reg.score01 + "  |  " + Reg.score02, 20);
		player1 = new Jugador(FlxG.width/4, FlxG.height);
		player2 = new Jugador(FlxG.width / 2 + FlxG.width / 4, FlxG.height);
		player1.setearJugador(true);
		player2.setearJugador(false);
		piso = new FlxSprite(0,FlxG.height-20);
		piso.loadGraphic(AssetPaths.Piso__png, FlxG.width, 20);
		piso.immovable = true;
		net.immovable = true;
		pelota = new Pelota(FlxG.width / 2 - 16, 100);
		energiaPlayer1 = new FlxBar(10, 10);
		energiaPlayer2 = new FlxBar(10, 10);
		energiaPlayer2.flipX = true;
		energiaPlayer2.x = (FlxG.width - energiaPlayer2.width - 10);
		energiaPlayer1.parent = player1;
		energiaPlayer2.parent = player2;
		energiaPlayer1.parentVariable = "barraLife";
		energiaPlayer2.parentVariable = "barraLife";
		fondo.loadGraphic(AssetPaths.Fondo__png,false, 640, 480);
		add(fondo);
		add(energiaPlayer1);
		add(energiaPlayer2);
		add(piso);
		add(scoreText);
		add(pelota);
		add(net);
		add(pelota.sombra);
		add(player1);
		add(player2);
		add(energiaPlayer1);
		add(energiaPlayer2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		scoreText.destroy();
		scoreText = new FlxText(FlxG.width/2, 20, 0, Reg.score01 + " | " +Reg.score02, 20);
		scoreText.x -= scoreText.width / 2;
		add(scoreText);
		FlxG.collide(player1, piso);
		FlxG.collide(player2, piso);
		colisionesPelota();
		if (player1.y + player1.height > piso.y)
			player1.y = piso.y - player1.height;
		if (player2.y + player2.height > piso.y)
			player2.y = piso.y - player2.height;
		if (FlxG.keys.pressed.R)
			FlxG.resetState();
		if (Reg.score01 > 9)
		{
			Reg.ganador = 1;
			Reg.score01 = 0;
			Reg.score02 = 0;
			FlxG.switchState(new WinScreen());
		}
		else if (Reg.score02 > 9)
		{
			Reg.ganador = 2;
			Reg.score01 = 0;
			Reg.score02 = 0;
			FlxG.switchState(new WinScreen());
		}
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
			FlxG.resetState();
		}
		if (FlxG.collide(player1, pelota) && player1.y > pelota.y - player1.height/2)
			pelota.velocity.y = -350;
		if (FlxG.collide(player2, pelota) && player2.y > pelota.y - player2.height/2)
			pelota.velocity.y = -350;
		if (FlxG.collide(pelota, net))
		{
			if (pelota.y + pelota.height < net.y+1)
				pelota.velocity.y = -200;
			if (pelota.x < net.x - pelota.width + 1)
				pelota.velocity.x = -150;
			else if (pelota.x > net.x)
				pelota.velocity.x = 150;
		}
	}
}
