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
	
	import nl.logiconline.tinydroplet.states.GameState;
	import nl.logiconline.tinydroplet.tiles.GreenTile;
	import nl.logiconline.tinydroplet.tiles.RedTile;
	import nl.logiconline.tinydroplet.tiles.Tile;
	
	public class Level extends Entity {
		private var game:GameState;
		private var tiles:Array;
		private var mapWidth:int = 0;
		private var mapHeight:int = 0;	
		
		public static var tileWidth:int = 32;
		public static var tileHeight:int = 32;
		public static var startPoint:Point;
		public static var endPoint:Point;
		
		[Embed(source="/../assets/levels/level1.png")] private const LEVEL:Class;
		public function Level(game:GameState, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{
			super(x, y, graphic, mask);
			this.game = game;
			Level.startPoint = new Point();
			Level.endPoint = new Point();
		}		
		
		public function createMap():void {			
			this.tiles = new Array();
			var level:Image = new Image(LEVEL);
			var canvas:Canvas = new Canvas(level.width, level.height);
			canvas.drawGraphic(0, 0, level);
			this.mapWidth = level.width;
			this.mapHeight = level.height;
			
			for(var x:int = 0; x <= this.mapWidth; x++) {
				this.tiles[x] = new Array();
				for(var y:int = 0; y <= this.mapHeight; y++) {					
					var tile:Tile;						
					if(canvas.getPixel(x, y) == 0xffff0000) { //Red tile
						tile = new RedTile(x * 32, y * 32);
					} else if(canvas.getPixel(x, y) == 0xff00ff00) { //Green tile						
						tile = new GreenTile(x * 32, y * 32);
					} else if(canvas.getPixel(x, y) == 0xffff00ff) { // start point
						// I hate those pixels....
						trace("Found start point!");
						Level.startPoint.x = x;						
						Level.startPoint.y = y;
						
					} else if(canvas.getPixel(x, y) == 0xff0000ff) { // End point						
						Level.endPoint.x = x;
						Level.endPoint.y = y;
					}
					
					if(tile != null) {
						this.tiles[x][y] = tile;						
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
	}
}