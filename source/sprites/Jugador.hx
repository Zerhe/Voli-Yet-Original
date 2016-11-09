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
	public var barraEnergia:FlxSprite;
	private var barraLife:Int = 1000;
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
		trace(barraLife);
		trace(timerBarra);
		
		if (timerBarra == 100){
			barraLife+= 1000;
			timerBarra = 0;
		}
		if (barraLife > 1000)
			barraLife = 1000;
		/*for (i in 0...100)
			if (barraLife == i * 10)
				barraEnergia.makeGraphic(16, i, 0xffff0000);
		*/
		switch(numeroJugador)
		{
			case true:
				if (FlxG.keys.pressed.A && x>0)
					velocity.x = -hSpeed;
				if (FlxG.keys.pressed.D)
					velocity.x = hSpeed;
				if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.W && !isTouching(FlxObject.FLOOR) && barraLife > 59){
					velocity.y = -200;
					barraLife -= 25;
				}
			default:
				barraEnergia.x = FlxG.width - barraEnergia.width * 2;
				if (FlxG.keys.pressed.LEFT)
					velocity.x = -hSpeed;
				if (FlxG.keys.pressed.RIGHT && x<FlxG.width-width)
					velocity.x = hSpeed;
				if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.UP && !isTouching(FlxObject.FLOOR) && barraLife > 59){
					velocity.y = -200;
					barraLife -= 25;
				}
		}
		super.update(elapsed);
	}
	public function setearTeclas(a:Bool)
	{
		numeroJugador = a;
	}
}