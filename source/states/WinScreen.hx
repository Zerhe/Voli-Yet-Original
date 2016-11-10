package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
/**
 * ...
 * @author matias
 */
class WinScreen extends FlxState
{
	private var winText:FlxText;
	private var reiniciarText:FlxText;
	private var timerText:Int = 0;
	override public function create():Void
	{
		super.create();
		winText = new FlxText(FlxG.width / 2, FlxG.height / 2, 0, "El ganador es el jugador " + Reg.ganador, 30);
		reiniciarText = new FlxText(FlxG.width / 2, FlxG.height / 2, 0, "Presione Espacio para reiniciar", 20);
		winText.x -= winText.width / 2;
		winText.y -= winText.height / 2;
		winText.color = 0xFFFF0000;
		reiniciarText.color = 0xFF0000FF;
		reiniciarText.y -= winText.height / 2 + winText.height*2;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		timerText++;
		if (timerText > 30)
		{
			timerText = 0;
			if(reiniciarText.alpha !=0)
				reiniciarText.alpha = 0;
			else
				reiniciarText.alpha = 1;
		}
	
		if (FlxG.keys.justPressed.SPACE)
			FlxG.switchState(new MenuState());
	}
	
}