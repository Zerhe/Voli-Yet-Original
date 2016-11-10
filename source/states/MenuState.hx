package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class MenuState extends FlxState
{
	private var pantalla:FlxSprite = new FlxSprite();
	private var menuText:FlxText;
	private var timerText:Int = 0;
	override public function create():Void
	{
		super.create();
		pantalla.makeGraphic(640, 480, 0xFFFFFFFF);
		//pantalla.loadGraphic(AssetPaths.,false,640,480);
		menuText = new FlxText(FlxG.width / 2, FlxG.height / 2, 0, "Press Space", 30);
		menuText.x -= menuText.width / 2;
		menuText.y -= menuText.height / 2;
		menuText.color = 0xFF0000FF;
		add(pantalla);
		add(menuText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timerText++;
		if (timerText > 30)
		{
			timerText = 0;
			if(menuText.alpha !=0)
				menuText.alpha = 0;
			else
				menuText.alpha = 1;
		}
	
		if (FlxG.keys.justPressed.SPACE)
			FlxG.switchState(new PlayState());
	}
}
