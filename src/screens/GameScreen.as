package screens
{
	
	import entities.Item;
	import entities.Player;
	
	import org.flixel.*;
	
	public class GameScreen extends ScreenState
	{
		
		[Embed(source="../assets/images/backdrop.png")] protected var imgTiles:Class;
		[Embed(source="../assets/maps/testMap.csv", mimeType = "application/octet-stream")] protected var mapLevel1:Class;
		
		private var map:FlxTilemap;
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
			Item.group = new FlxGroup();
			Item.group = objects;
			
			var player:Player = new Player(0, 64);
			objects.add(player);
			
			var object:Item = new Item(48, 64, 1, player);
			objects.add(object);
			object = new Item(200, 64, 2, player);
			objects.add(object);
			object = new Item(400, 64, 3, player);
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