/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file FloatingText.as
 */

package nl.logiconline.tinydroplet.gui {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;	
	
	public class FloatingText extends Text {		
		
		public function FloatingText(x:Number, y:Number, text:String, color:uint = 0xffffff) {
			super(text, x, y);			
			this.getText().color = color;			
		}
		
		override public function update():void {			
			this.y -= 12 * FP.elapsed;
			this.getText().alpha -= 0.7 * FP.elapsed;
			if(this.getText().alpha <= 0) world.remove(this);
		}
	}
}