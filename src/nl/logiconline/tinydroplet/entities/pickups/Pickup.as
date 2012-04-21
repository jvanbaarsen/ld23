/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.entities.pickups
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Pickup.as
 */

package nl.logiconline.tinydroplet.entities.pickups {
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	public class Pickup extends Entity {
		protected var value:int = 0;
		public function Pickup(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.type = "pickup";
		}
		
		public function getValue():int {
			return this.value;
		}
	}
}