/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Tile.as
 */

package nl.logiconline.tinydroplet.tiles {
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	public class Tile extends Entity {
		public function Tile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.width = 32;
			this.height = 32;
			this.type = "solid";
		}
		
		override public function render():void {
			super.render();
		}
		
		override public function update():void {
			super.update();
		}
	}
}