package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class MenuState extends FlxState
{
	private var pantalla:FlxSprite = new FlxSprite();
	override public function create():Void
	{
		super.create();
		pantalla.makeGraphic(640, 480, 0xFFFFFFFF);
		//pantalla.loadGraphic(AssetPaths.,false,640,480);
		add(pantalla);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
