package entities
{
	import org.flixel.*;
	
	public class Item extends Entity
	{
		[Embed(source="../assets/images/objects.png")] public var imgObjects:Class;
		
		public var walkSpeed:Number = 200;
		protected var _type:uint = 0;
		
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
		
		public function Item(X:Number, Y:Number, Name:String)
		{
			super(X, Y);
			
			loadGraphic(imgObjects, true, true, 64, 64);
			addAnimation("fox", [1]);
			addAnimation("beans", [2]);
			addAnimation("goose", [3]);
			
			acceleration.y = gravity;
			play(Name);
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