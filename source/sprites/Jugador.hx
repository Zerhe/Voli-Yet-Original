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
	private var hSpeed:Float = 225;
	private var numeroJugador:Bool = true;
	private var barraLife:Float = 100;
	private var timerBarra:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 64);
		acceleration.y = 800;
	}
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		if(barraLife < 100)
			timerBarra++;
		//trace(barraLife);
		//trace(timerBarra);
		
		if (timerBarra >= 100){
			if(isTouching(FlxObject.FLOOR)){
				barraLife+= 100;
				timerBarra = 0;
			}
		}
		if (barraLife > 100)
			barraLife = 100;
		switch(numeroJugador)
		{
			case true:
				if (FlxG.keys.pressed.D && x <= FlxG.width/2 - width - 2)
					velocity.x = hSpeed;
				else if (FlxG.keys.pressed.A && x>0)
					velocity.x = -hSpeed;
				if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.W && !isTouching(FlxObject.FLOOR) && barraLife > 5.9){
					velocity.y = -200;
					barraLife -= 1.5;
				}
			default:
				//barraEnergia.x = FlxG.width - barraEnergia.width * 2;
				if (FlxG.keys.pressed.LEFT && x >= FlxG.width/2 + 2)
					velocity.x = -hSpeed;
				if (FlxG.keys.pressed.RIGHT && x<FlxG.width-width)
					velocity.x = hSpeed;
				if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.UP && !isTouching(FlxObject.FLOOR) && barraLife > 5.9){
					velocity.y = -200;
					barraLife -= 1.5;
				}
		}
		super.update(elapsed);
	}
	public function setearTeclas(a:Bool)
	{
		numeroJugador = a;
	}
}