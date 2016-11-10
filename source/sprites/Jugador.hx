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
		if (x > Reg.pelotaPosX)
			flipX = true;
		else
			flipX = false;
		if (timerBarra >= 100){
			if(isTouching(FlxObject.FLOOR)){
				barraLife+= 100;
				timerBarra = 0;
			}
		}
		if (barraLife > 100)
			barraLife = 100;
		switch(numeroJugador){
			case true:
				if (FlxG.keys.pressed.D && x <= FlxG.width/2 - width - 2)
					velocity.x = hSpeed;
				else if (FlxG.keys.pressed.A && x>0)
					velocity.x = -hSpeed;
				if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.W && !isTouching(FlxObject.FLOOR) && barraLife > 5.9){
					animation.play("fly");
					velocity.y = -200;
					barraLife -= 1.5;
				}
			default:
				if (FlxG.keys.pressed.LEFT && x >= FlxG.width/2 + 2)
					velocity.x = -hSpeed;
				if (FlxG.keys.pressed.RIGHT && x<FlxG.width-width)
					velocity.x = hSpeed;
				if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
					velocity.y = -450;
				if (FlxG.keys.pressed.UP && !isTouching(FlxObject.FLOOR) && barraLife > 5.9){
					animation.play("fly");
					velocity.y = -200;
					barraLife -= 1.5;
				}
		}
		if (isTouching(FlxObject.FLOOR))
			animation.play("quieto");
		super.update(elapsed);
	}
	public function setearJugador(a:Bool)
	{
		numeroJugador = a;
		if (a){
			loadGraphic(AssetPaths.Player01__png, true, 32, 64);
			animation.add("quieto", [0], 1, true);
			animation.add("fly", [1], 1, true);
		}
		else{
			loadGraphic(AssetPaths.Player02__png, true, 32, 64);
			animation.add("quieto", [0], true);
			animation.add("fly", [1], 1, true);
		}
	}
}