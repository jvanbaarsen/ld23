/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file FlashingText.as
 */

package nl.logiconline.tinydroplet.gui {
	public class FlashingText extends Text {
		
		private var alpha:Number = 1;
		public function FlashingText(text:String, x:Number=0, y:Number=0) {
			super(text, x, y);
		}
		
		override public function update():void {
			super.update();
			alpha -= 0.02;
			if(alpha < 0.3) alpha = 1;
			this.getText().alpha = alpha;
			
		}
	}
}