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
	
	public class Ground extends Entity {
		public function Ground(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.width = Level.tileWidth;
			this.height = Level.tileHeight;
			this.layer = 10;

		}
		
		override public function render():void {
			super.render();
			Draw.rect(x, y, width, height, 0x8f5902);
		}
	}
}