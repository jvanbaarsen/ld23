/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.levels
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Level.as
 */

package nl.logiconline.tinydroplet.levels {
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	
	import nl.logiconline.tinydroplet.entities.pickups.CoinPickup;
	import nl.logiconline.tinydroplet.states.GameState;
	import nl.logiconline.tinydroplet.tiles.FinishTile;
	import nl.logiconline.tinydroplet.tiles.GrassTile;
	import nl.logiconline.tinydroplet.tiles.LavaTile;
	import nl.logiconline.tinydroplet.tiles.SandTile;
	import nl.logiconline.tinydroplet.tiles.SpikeTile;
	import nl.logiconline.tinydroplet.tiles.Tile;
	import nl.logiconline.tinydroplet.tiles.background.Ground;
	import nl.logiconline.tinydroplet.tiles.background.Sky;
	
	import org.osmf.elements.ImageLoader;
	
	public class Level extends Entity {
		private var game:GameState;
		private var tiles:Array;
		private var pickups:Array;
		private var mapWidth:int = 0;
		private var mapHeight:int = 0;	
		private var levelNumber:int;
		
		public static var tileWidth:int = 32;
		public static var tileHeight:int = 32;
		public static var startPoint:Point;		
		
		[Embed(source="/../assets/levels/level1.png")] private const LEVEL1:Class;
		[Embed(source="/../assets/levels/level2.png")] private const LEVEL2:Class;
		[Embed(source="/../assets/levels/level3.png")] private const LEVEL3:Class;
		[Embed(source="/../assets/levels/level1_background.png")] private const LEVEL1_BACKGROUND:Class;
		[Embed(source="/../assets/levels/level2_background.png")] private const LEVEL2_BACKGROUND:Class;
		[Embed(source="/../assets/levels/level3_background.png")] private const LEVEL3_BACKGROUND:Class;
		public function Level(game:GameState, levelNumber:int, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{
			super(x, y, graphic, mask);			
			this.game = game;
			Level.startPoint = new Point();			
			this.levelNumber = levelNumber;
		}		
		
		public function createMap():void {			
			this.tiles = new Array();
			this.pickups = new Array();
			var level:Image;
			if(this.levelNumber == 1) level = new Image(LEVEL1);
			else if(this.levelNumber == 2) level = new Image(LEVEL2);
			else if(this.levelNumber == 3) level = new Image(LEVEL3);
			else level = new Image(LEVEL1); //Temp solution :)
			
			var canvas:Canvas = new Canvas(level.width, level.height);
			canvas.drawGraphic(0, 0, level);
			this.mapWidth = level.width;
			this.mapHeight = level.height;
			
			for(var x:int = 0; x <= this.mapWidth; x++) {
				this.tiles[x] = new Array();
				this.pickups[x] = new Array();
				for(var y:int = 0; y <= this.mapHeight; y++) {					
					var tile:Tile;						
					if(canvas.getPixel(x, y) == 0xffff0000) { //Red tile
						tile = new SandTile(x * 32, y * 32);
					} else if(canvas.getPixel(x, y) == 0xff00ff00) { //Green tile						
						tile = new GrassTile(x * 32, y * 32);
					} else if(canvas.getPixel(x, y) == 0xffff00ff) { // start point												
						Level.startPoint.x = x;						
						Level.startPoint.y = y;						
					} else if(canvas.getPixel(x, y) == 0xff0000ff) { // End point
						tile = new FinishTile(x * 32, y * 32);						
					} else if(canvas.getPixel(x, y) == 0xffffff00) { //Coin pickup
						var coin:CoinPickup = new CoinPickup(x * 32, y * 32);
						this.pickups[x][y] = coin;
						this.game.add(coin);
					} else if(canvas.getPixel(x, y) == 0xff7f0000) { //Lava tile
						tile = new LavaTile(x * 32, y * 32);						
					} else if(canvas.getPixel(x, y) == 0xffb7b7b7) { //Spike tile
						tile = new SpikeTile(x * 32, y * 32);
					}
					
					if(tile != null) {
						this.tiles[x][y] = tile;						
						this.game.add(tile);						
					}
				}
			}	
			this.createBackGround();
		}
		
		public function createBackGround():void {
			var background:Image;
			if(this.levelNumber == 1) background = new Image(LEVEL1_BACKGROUND);
			else if(this.levelNumber == 2) background = new Image(LEVEL2_BACKGROUND);
			else if(this.levelNumber == 3) background = new Image(LEVEL3_BACKGROUND);			
			var canvas:Canvas = new Canvas(background.width, background.height);
			canvas.drawGraphic(0,0,background);
			for(var x:int = 0; x <= this.mapWidth; x++) {
				for(var y:int = 0; y <= this.mapHeight; y++) {
					var tile:Entity;
					if(canvas.getPixel(x, y) == 0xff729fcf) { //Sky
						tile = new Sky(x * 32, y * 32);
					} else if(canvas.getPixel(x, y) == 0xff8f5902) { //Ground
						tile = new Ground(x * 32, y * 32);
					}
					
					if(tile != null) {
						this.game.add(tile);
					}
				}
			}
		}
		
		public function getWidth():int {
			return this.mapWidth;
		}
		
		public function getHeight():int {
			return this.mapHeight;
		}
		
		public function getPickup(x:int, y:int):void {
			var tmpX:int = Math.ceil(x / 32);
			var tmpY:int = Math.ceil(y / 32);
			trace("x: "+ tmpX + " y: "+ tmpY);
			trace(this.pickups[tmpX][tmpY]);
		}
		
		public function getCurrentLevel():int {
			return this.levelNumber;
		}
	}
}