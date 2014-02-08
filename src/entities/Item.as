package entities
{
	import org.flixel.*;
	
	public class Item extends Entity
	{
		[Embed(source="../assets/images/objects.png")] public var imgObjects:Class;
		
		public static const NONE:int = -1;
		public static const FARMER:int = 0;
		public static const FOX:int = 1;
		public static const BEANS:int = 2;
		public static const GOOSE:int = 3;
		
		public static const itemNames:Array = ["Farmer","Fox","Beans","Goose"];
		public static const itemPreys:Array = [-1, 3, -1, 2];
		
		public var walkSpeed:Number = 200;
		protected var _type:uint = 0;
		protected var targetPos:FlxPoint;
		protected var farmer:Player;
		
		//Objects from Benjamine Soule's "The River"
		//http://benjaminsoule.fr/games/theriver/
		//--------------------------
		//goat eats cabbage
		//goat eats gun if hunter isn't nearby
		//wolf eats goat
		//wolf eats monkey if washing machine isn't nearby
		//hunter kills wolf if gun is nearby
		//hunter won't enter boat unless gun is nearby
		//monkey will destroy what's inside washing machine if cabbage isn't nearby
		//monkey will destroy cabbage if wolf is far away
		//washing machine won't enter boat unless hunter is nearby
		
		public function Item(X:Number, Y:Number, Type:int, Farmer:Player)
		{
			super(X, Y);
			
			type = Type;
			
			loadGraphic(imgObjects, true, true, 64, 64);
			addAnimation("Fox", [1]);
			addAnimation("Beans", [2]);
			addAnimation("Goose", [3]);
			
			acceleration.y = gravity;
			play(itemNames[type]);
			farmer = Farmer;
			
			targetPos = new FlxPoint(position.x, position.y);
		}
		
		public function get type():uint
		{
			return _type;
		}
		
		public function set type(Value:uint):void
		{
			_type = Value;
		}
		
		override public function reset(X:Number, Y:Number):void
		{
			super.reset(X - width / 2, Y - height / 2);
		}
		
		override public function update():void
		{	
			super.update();
			
			var _effectiveDistanceToFarmer:Number;
			var _distance:Number;
			var _distanceToClosestPrey:Number = Number.MAX_VALUE;
			for (var i:int = 0; i < group.members.length; i++)
			{
				if (group && group.members && group.members[i])
				{
					var _member:Entity = group.members[i];
					if (_member.alive)
					{
						_distance = FlxU.getDistance(position, _member.position);
						if (_member is Player)
						{ // See if the farmer is nearby
							if (_distance <= (_member as Player).safetyRadius)
								_effectiveDistanceToFarmer = 0;
							else
								_effectiveDistanceToFarmer = _distance;
						}
						else if (_member is Item)
						{ // Find the nearest valid prey
							if ((_member as Item).type == itemPreys[type])
							{
								if (_distance < _distanceToClosestPrey)
								{
									_distanceToClosestPrey = _distance;
									targetPos.x = _member.position.x;
									targetPos.y = _member.position.y;
								}
							}
						}
					}
				}
			}
			FlxG.log("---\n" + itemNames[type] + "\nPrey: " + _distanceToClosestPrey + "\nFarmer: " +  _effectiveDistanceToFarmer);
			if (_distanceToClosestPrey < _effectiveDistanceToFarmer)
			{
				if (position.x < targetPos.x)
					velocity.x = 20;
				else if (position.x > targetPos.x)
					velocity.x = -20;
				else
					velocity.x = 0;
			}
			else
			{
				velocity.x = 0;
			}
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