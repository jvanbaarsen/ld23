/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file GreenTile.as
 */

package nl.logiconline.tinydroplet.tiles {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.graphics.Spritemap;
	
	public class GrassTile extends Tile {
		private var tilemap:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;	
		public function GrassTile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{
			super(x, y, graphic, mask);
			this.tilemap = new Spritemap(TILES, 32, 32);
			var rand:Number = Math.floor(Math.random()*2);			
			this.tilemap.setFrame(rand, 1);
			this.graphic = this.tilemap;
		}
		
		override public function render():void {
			super.render();
			//Draw.rect(x, y, width, height, 0X00ff00);
		}
	}
}