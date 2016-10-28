package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Jugador extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 32);
	}
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		if (FlxG.keys.pressed.A)
			velocity.x 
		super.update(elapsed);
	}
}