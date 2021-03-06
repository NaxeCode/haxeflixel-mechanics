package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxVirtualPad;

class PlayState extends FlxState
{
	
	private var status:FlxText;
	private var pad:FlxVirtualPad;
	private var lastInput:Int = -1;
	
	override public function create():Void
	{
		bgColor = 0;
		super.create();
		
		status = new FlxText(0,12,FlxG.width,"",12);
		status.alignment = FlxTextAlign.CENTER;
		status.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xff333333);
		status.text = "Released";
		add(status);
		
		pad = new FlxVirtualPad(FlxDPadMode.NONE, FlxActionMode.A);
		add(pad);
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (pad.buttonA.justPressed || FlxG.keys.justPressed.X)
		{
			if (lastInput != 0)
			{
				status.text += "\nJust Pressed";
				lastInput = 0;
			}
		}
		else if (pad.buttonA.pressed || FlxG.keys.pressed.X)
		{
			if (lastInput != 1)
			{
				status.text += "\nPressed";
				lastInput = 1;
			}
		}
		else if (pad.buttonA.justReleased || FlxG.keys.justReleased.X)
		{
			if (lastInput != 2)
			{
				status.text += "\nJust Released";
				lastInput = 2;
			}
		}
		else if (pad.buttonA.released || !FlxG.keys.pressed.X)
		{
			if (lastInput != -1)
			{
				status.text += "\nReleased";
				lastInput = -1;
			}
		}
		if (status.y + status.height > FlxG.height)
		{
			status.y = FlxG.height - status.height;
		}
		
	}
}
