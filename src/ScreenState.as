package
{
	//import com.increpare.bfxr.Bfxr;
	import com.increpare.bfxr.*;
	import com.increpare.bfxr.synthesis.Synthesizer.SfxrParams;
	
	import org.flixel.*;
	
	import screens.GameScreen;
	import screens.MenuScreen;
		
	public class ScreenState extends FlxState
	{
		public static var overlay:FlxSprite;
		public static var infoTextBackdrop:FlxSprite;
		public static var infoText:FlxText;
		
		private var soundBank:SoundBank;
		
		public function ScreenState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			FlxG.flash(0xff000000, 0.5);
			
			soundBank = new SoundBank();
			
		}
		
		override public function update():void
		{	
			super.update();
			
			soundBank.update();
		}
		
		public static function playRandomSound(Sounds:Array, VolumeMultiplier:Number = 1.0):void
		{
			var _seed:Number = Math.floor(Sounds.length * Math.random());
			FlxG.play(Sounds[_seed], VolumeMultiplier, false, false);
		}
		
		public function onButtonGame():void
		{
			fadeToGame();
		}
		
		public function fadeToGame(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToGame);
		}
		
		public function goToGame():void
		{
			FlxG.switchState(new GameScreen);
		}
		
		public function onButtonMenu():void
		{
			fadeToMenu();
		}
		
		public function fadeToMenu(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToMenu);
		}
		
		public function goToMenu():void
		{
			FlxG.switchState(new MenuScreen);
		}
	}
}