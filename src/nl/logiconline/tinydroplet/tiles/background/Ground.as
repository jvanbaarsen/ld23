/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles.background
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Ground.as
 */

package nl.logiconline.tinydroplet.tiles.background {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Draw;
	
	import nl.logiconline.tinydroplet.levels.Level;
	import net.flashpunk.graphics.Spritemap;
	
	public class Ground extends Entity {
		private var tilemap:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;	
		public function Ground(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.width = Level.tileWidth;
			this.height = Level.tileHeight;
			this.layer = 10;
			this.tilemap = new Spritemap(TILES, 32, 32);			
			this.tilemap.setFrame(Math.floor(Math.random()*4), 4 + Math.floor(Math.random()*2));
			this.graphic = this.tilemap;

		}
		
		override public function render():void {
			super.render();			
		}
	}
}