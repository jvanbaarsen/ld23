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
	
	public class GreenTile extends Tile {
		public function GreenTile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{
			super(x, y, graphic, mask);
		}
		
		override public function render():void {
			super.render();
			Draw.rect(x, y, width, height, 0X00ff00);
		}
	}
}