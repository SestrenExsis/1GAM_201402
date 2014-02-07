package
{
	import org.flixel.FlxGame;
	import screens.MenuScreen;
	[SWF(width="640", height="360", backgroundColor="#666666")]
	
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(640, 360, MenuScreen, 1.0, 60, 60, true);
			forceDebugger = true;
		}
	}
}