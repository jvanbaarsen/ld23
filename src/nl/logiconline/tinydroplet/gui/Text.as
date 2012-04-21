/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Text.as
 */

package nl.logiconline.tinydroplet.gui {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	
	public class Text extends Entity {
		private var text:net.flashpunk.graphics.Text;
		private var moveWithCamera:Boolean = true;
		private var relativeX:int;
		private var relativeY:int;
		public function Text(text:String, x:Number=0, y:Number=0)	{			
			super(x, y, null, null);
			this.relativeX = x;
			this.relativeY = y;
			this.text = new net.flashpunk.graphics.Text(text);
			this.graphic = this.text;
		}
		
		override public function update():void {
			super.update();
			if(this.moveWithCamera) {
				this.x = FP.camera.x + this.relativeX;
				this.y = FP.camera.y + this.relativeY;
			}
		}
		
		public function getText():net.flashpunk.graphics.Text {
			return this.text;
		}
		
		public function setRelativePosition(relativeX:int, relativeY:int):void {
			this.relativeX = relativeX;
			this.relativeY = relativeY;
		}
		
		public function setRelativeX(relativeX:int):void {
			this.relativeX = relativeX;	
		}
		
		public function setRelativeY(relativeY:int):void {
			this.relativeY = relativeY;
		}
	}
}