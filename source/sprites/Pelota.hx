package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import states.MenuState;
import states.PlayState;

/**
 * ...
 * @author matias
 */
class Pelota extends FlxSprite
{
	public var sombra:FlxSprite = new FlxSprite();
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32, 0xFF0000FF);
		sombra.makeGraphic(32, 16, 0xFF999966);
		sombra.y = FlxG.height - sombra.height * 2;
		sombra.alpha = 0.5;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		sombra.x = x;
	}
	
}