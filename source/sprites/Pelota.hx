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
		sombra.makeGraphic(32, 16, 0xFF999966);
		loadGraphic(AssetPaths.Pelota__png, true, 32, 32);
		animation.add("quieto", [0, 1, 2, 3], 4, true);
		animation.play("quieto");
		sombra.y = FlxG.height - sombra.height;
		sombra.alpha = 0.5;
		acceleration.y = 800;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		sombra.x = x;
		if (x <= 0 && velocity.x < 0)
			velocity.x = 150;
		else if (x > FlxG.width - width && velocity.x>0)
			velocity.x = -150;
		rotar();
		Reg.pelotaPosX = x;
	}
	private function rotar()
	{
		if(velocity.x > 0)
			angle+= 2;
		else if(velocity.x < 0)
			angle-= 2;
		if (velocity.x > 200)
			angle+= 2;
		else if (velocity.x < -200)
			angle-= 2;
	}
	
}