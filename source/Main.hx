package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
import states.PlayState;
import states.MenuState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
