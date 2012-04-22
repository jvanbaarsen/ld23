/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file SpikeTile.as
 */

package nl.logiconline.tinydroplet.tiles {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	
	public class SpikeTile extends Tile {
		private var spritesheet:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;
		public function SpikeTile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.type = "spike";			
			this.spritesheet = new Spritemap(TILES, 32,32);
			this.spritesheet.setFrame(4, 0);
			this.graphic = this.spritesheet;
			this.setHitbox(32, 17, 0, -15);
		}
		
		override public function render():void {
			super.render();			
		}
	}
}