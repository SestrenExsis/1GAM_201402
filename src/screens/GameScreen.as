package screens
{
	
	import org.flixel.*;
	import entities.Player;
	import entities.Item;
	
	public class GameScreen extends ScreenState
	{
		
		[Embed(source="../assets/images/backdrop.png")] protected var imgTiles:Class;
		[Embed(source="../assets/maps/testMap.csv", mimeType = "application/octet-stream")] protected var mapLevel1:Class;
		
		private var map:FlxTilemap;
		private var object:Entity;
		private var objects:FlxGroup;
		
		public function GameScreen()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			FlxG.mouse.hide();
			FlxG.bgColor = 0xff5c94fc;
			
			objects = new FlxGroup();
			object = new Player(0, 64);
			objects.add(object);
			object = new Item(48, 64, "fox");
			objects.add(object);
			object = new Item(96, 64, "beans");
			objects.add(object);
			object = new Item(144, 64, "goose");
			objects.add(object);
			
			map = new FlxTilemap();
			map.loadMap(new mapLevel1, imgTiles, 32, 32, FlxTilemap.OFF, 0, 0, 60);
			
			add(map);
			add(objects);
			FlxG.worldBounds.x = map.x;
			FlxG.worldBounds.y = map.y;
			FlxG.worldBounds.width = map.width;
			FlxG.worldBounds.height = map.height;
			FlxG.camera.bounds = FlxG.worldBounds;
		}
		
		override public function update():void
		{	
			super.update();
			
			FlxG.collide(map, objects);
		}
	}
}