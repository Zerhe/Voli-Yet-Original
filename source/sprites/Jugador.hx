package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
/**
 * ...
 * @author ...
 */
class Jugador extends FlxSprite
{
	private var speed:Float = 225;
	private var numeroJugador:Bool = true;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 64);
		acceleration.y = 800;
	}
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		switch(numeroJugador)
		{
			case true:	
				if (FlxG.keys.pressed.A && x>0)
					velocity.x = -speed;
				if (FlxG.keys.pressed.D)
					velocity.x = speed;
			default:
				if (FlxG.keys.pressed.J)
					velocity.x = -speed;
				if (FlxG.keys.pressed.L && x<FlxG.width-width)
					velocity.x = speed;
		}
			
		super.update(elapsed);
	}
	public function setearTeclas(a:Bool)
	{
		numeroJugador = a;
	}
}