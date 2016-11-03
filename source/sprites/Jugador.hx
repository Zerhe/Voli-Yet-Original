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
	public var barraEnergia:FlxSprite;
	private var barraLife:Int = 100;
	private var timerBarra:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 64);
		acceleration.y = 800;
		barraEnergia = new FlxSprite(16, 50);
		barraEnergia.makeGraphic(16, 100, 0xffff0000);
		barraEnergia.alpha = 0.5;
	}
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		timerBarra++;
		if (barraLife < 100 && timerBarra == 10){
			barraLife++;
			timerBarra = 0;
		}
		trace(barraLife);
		trace(timerBarra);
		switch(numeroJugador)
		{
			case true:
				if (FlxG.keys.pressed.A && x>0)
					velocity.x = -speed;
				if (FlxG.keys.pressed.D)
					velocity.x = speed;
				if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.W && !isTouching(FlxObject.FLOOR)){
					velocity.y = -200;
					barraLife -= 5;
				}
			default:
				barraEnergia.x = FlxG.width - barraEnergia.width * 2;
				if (FlxG.keys.pressed.J)
					velocity.x = -speed;
				if (FlxG.keys.pressed.L && x<FlxG.width-width)
					velocity.x = speed;
				if (FlxG.keys.justPressed.I && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.I && !isTouching(FlxObject.FLOOR))
					velocity.y = -200;
		}
		super.update(elapsed);
	}
	public function setearTeclas(a:Bool)
	{
		numeroJugador = a;
	}
}