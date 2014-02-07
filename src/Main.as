package
{
	import org.flixel.FlxGame;
	import screens.GameScreen;
	[SWF(width="640", height="360", backgroundColor="#666666")]
	
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(640, 360, GameScreen, 1.0, 60, 60, true);
			forceDebugger = true;
		}
	}
}