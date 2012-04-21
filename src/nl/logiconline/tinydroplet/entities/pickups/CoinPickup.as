/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.entities.pickups
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file CoinPickup.as
 */

package nl.logiconline.tinydroplet.entities.pickups {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	
	public class CoinPickup extends Pickup {
		[Embed(source="/../assets/coin.png")] private const COIN:Class;
		private var spritesheet:Spritemap
		public function CoinPickup(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);	
			super.x = x + 6;
			super.y = y + 12;
			this.width = 20;
			this.height = 20;
			this.spritesheet = new Spritemap(COIN, 20, 20);
			this.spritesheet.add("rotate", [0,1,2,3], 7, true);
			this.graphic = spritesheet;			
			this.spritesheet.play("rotate");
			super.value = 10;
		}
		
		override public function render():void {
			super.render();			
		}
	}
}