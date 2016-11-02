package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Pelota;

class MenuState extends FlxState
{
	private var pantalla:FlxSprite = new FlxSprite();
	//private var pelota:Pelota;
	override public function create():Void
	{
		super.create();
		pantalla.makeGraphic(640, 480, 0xFFFFFFFF);
		//pantalla.loadGraphic(AssetPaths.);
		add(pantalla);
		//pelota = new Pelota(100, 100);
		//add(pelota);
		//add(pelota.sombra);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
