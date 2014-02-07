package entities
{
	import org.flixel.*;
	
	public class Player extends Entity
	{	
		public var walkSpeed:Number = 200;
		public var safetyRadius:Number = 256;
		
		public function Player(X:Number, Y:Number)
		{
			super(X, Y);
			
			loadGraphic(imgSprites, true, true, 64, 64);
			addAnimation("idle", [0]);
			addAnimation("walk", [0]);
			addAnimation("jump", [0]);
			
			acceleration.y = gravity;
			play("idle");
			
			FlxG.camera.follow(this, FlxCamera.STYLE_TOPDOWN);
		}
		
		override public function reset(X:Number, Y:Number):void
		{
			super.reset(X - width / 2, Y - height / 2);
			
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys["A"])
			{
				play("walk");
				facing = FlxObject.LEFT;
				velocity.x = -walkSpeed;
			}
			else if (FlxG.keys["D"])
			{
				play("walk");
				facing = FlxObject.RIGHT;
				velocity.x = walkSpeed;
			}
			else
			{
				play("idle");
				velocity.x = 0;
			}
			
			if (FlxG.keys.justPressed("W") && isTouching(FlxObject.FLOOR))
			{
				play("jump");
				velocity.y = -300;
			}
		}
		
		override public function destroy():void
		{
			super.destroy();
			
		}
		
		override public function draw():void
		{
			drawCircleToCamera(position.x, position.y, safetyRadius, 0xff0000, 0.5, 1);
			super.draw();
		}
		
		override protected function calcFrame():void
		{	
			super.calcFrame();
			
		}
	}
}