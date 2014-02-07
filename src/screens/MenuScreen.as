package screens
{
	import org.flixel.*;
	
	public class MenuScreen extends ScreenState
	{		
		private var buttons:FlxGroup;
		private var playButton:FlxButton;
		
		public function MenuScreen()
		{
			super();
			FlxG.mouse.show();
			
			buttons = new FlxGroup();
			playButton = new FlxButton(FlxG.width / 2 - 40, 96, "Game", onButtonGame);
			playButton.centerOffsets(true);
			playButton.label.width = playButton.width;
			playButton.label.height = playButton.height;
			playButton.label.setFormat(null, 8, 0x000000, "center");
			
			buttons.add(playButton);
			
			add(buttons);
		}
		
		override public function update():void
		{	
			super.update();
			
			//if (FlxG.mouse.justPressed()) onButtonGame();
		}
		
		override public function create():void
		{
			
		}
	}
}