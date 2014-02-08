package entities
{
	import org.flixel.*;
	
	public class Player extends Entity
	{	
		public var walkSpeed:Number = 200;
		public var safetyRadius:Number = 256;
		public var carriedEntity:Entity;
		
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
			else if (FlxG.keys.justPressed("S") && isTouching(FlxObject.FLOOR))
			{
				play("pickup");
				if (carriedEntity)
					carriedEntity = null;
				else
					pickup();
			}
			
			if (carriedEntity)
			{
				carriedEntity.x = position.x - 0.5 * carriedEntity.width;
				carriedEntity.y = position.y - 0.5 * carriedEntity.height;
				carriedEntity.velocity.x = carriedEntity.velocity.y = 0;
			}
		}
		
		private function pickup():void
		{
			var _pickupDistance:Number = 32;
			var _distance:Number;
			var _distanceToClosestItem:Number = Number.MAX_VALUE;
			for (var i:int = 0; i < group.members.length; i++)
			{
				if (group && group.members && group.members[i])
				{
					var _member:Entity = group.members[i];
					if (_member.alive)
					{
						_distance = FlxU.getDistance(position, _member.position);
						if (_member is Item)
						{ // Find the nearest item.
							if (_distance < _distanceToClosestItem)
							{
								_distanceToClosestItem = _distance;
								carriedEntity = _member;
							}
						}
					}
				}
			}
			if (_distanceToClosestItem > _pickupDistance)
			{
				carriedEntity = null;
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