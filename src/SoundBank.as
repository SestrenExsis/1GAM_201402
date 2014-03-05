package
{
	import com.increpare.bfxr.*;
	import com.increpare.bfxr.synthesis.Synthesizer.SfxrParams;
	
	import org.flixel.*;
	
	public class SoundBank
	{
		private var _bfxr:Bfxr;
		private var bfxrSoundBank:Array;
		private var _sfxrParams:com.increpare.bfxr.synthesis.Synthesizer.SfxrParams;
		//private var soundData:String = "2,0.5,,0.0988,0.3283,0.3543,0.3,0.5725,,,,,,,,,0.3636,0.5212,,,,,,,,1,,,,,,,masterVolume"
		
		public function SoundBank()
		{
			create();
		}
		
		public function create():void
		{
			bfxrSoundBank = new Array();
			
			_sfxrParams = new SfxrParams();
			
			for (var i:int = 0; i < 9; i++)
			{
				if ((int)(i / 3) == 0)
					_sfxrParams.generateHitHurt();
				else if ((int)(i / 3) == 1)
					_sfxrParams.generateLaserShoot();
				else
					_sfxrParams.generateExplosion();
				
				_bfxr = new Bfxr();
				_bfxr.Load(_sfxrParams.Serialize());
				_bfxr.Cache();
				bfxrSoundBank.push(_bfxr);
			}
			
		}
		
		public function update():void
		{	
			if (FlxG.keys.justPressed("NUMPADONE"))
				bfxrSoundBank[0].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADTWO"))
				bfxrSoundBank[1].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADTHREE"))
				bfxrSoundBank[2].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADFOUR"))
				bfxrSoundBank[3].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADFIVE"))
				bfxrSoundBank[4].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADSIX"))
				bfxrSoundBank[5].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADSEVEN"))
				bfxrSoundBank[6].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADEIGHT"))
				bfxrSoundBank[7].Play(0.5);
			else if (FlxG.keys.justPressed("NUMPADNINE"))
				bfxrSoundBank[8].Play(0.5);
		}
	}
}