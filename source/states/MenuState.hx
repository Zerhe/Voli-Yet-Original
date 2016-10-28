package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var pantalla:FlxSprite = new FlxSprite;
	override public function create():Void
	{
		super.create();
		pantalla.makeGraphic(640,480, 0xFFFFFFFF)
		//pantalla.loadGraphic(AssetPaths.);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
