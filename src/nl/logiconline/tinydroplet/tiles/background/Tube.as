/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles.background
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file Tube.as
 */

package nl.logiconline.tinydroplet.tiles.background {
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	
	import nl.logiconline.tinydroplet.levels.Level;
	
	public class Tube extends Entity {		
		private var spritesheet:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;
		public function Tube(tubeType:String, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);			
			this.width = Level.tileWidth;
			this.height = Level.tileHeight
			this.layer = 10;
			this.spritesheet = new Spritemap(TILES, 32, 32);
			if(tubeType == "sky") {
				this.spritesheet.setFrame(2, 7);
			} else {
				this.spritesheet.setFrame(3, 7);
			}
			this.graphic = this.spritesheet;
		}
		
		override public function render():void {
			super.render();			
		}
	}
}