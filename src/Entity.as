package
{
	import org.flixel.*;
	import flash.display.Graphics;
	
	public class Entity extends FlxSprite
	{	
		[Embed(source="../assets/images/objects.png")] protected var imgSprites:Class;
		
		public var gravity:Number = 800;
		
		public function Entity(X:Number, Y:Number)
		{
			super(X, Y);
			
		}
		
		public function drawCircleToCamera(X:Number, Y:Number, Radius:Number, Color:uint, Thickness:uint=1):void
		{
			//Draw line
			var gfx:Graphics = FlxG.flashGfx;
			gfx.clear();
			gfx.lineStyle(Thickness, Color);
			gfx.drawCircle(X - FlxG.camera.scroll.x, Y - FlxG.camera.scroll.y, Radius);
			
			//Cache line to bitmap
			FlxG.camera.buffer.draw(FlxG.flashGfxSprite);
		}
		
		override public function reset(X:Number, Y:Number):void
		{
			super.reset(X - width / 2, Y - height / 2);
			
		}
		
		override public function update():void
		{	
			super.update();
			
		}
		
		override public function destroy():void
		{
			super.destroy();
			
		}
		
		override public function draw():void
		{
			super.draw();
			
		}
		
		override protected function calcFrame():void
		{	
			super.calcFrame();
			
		}
	}
}