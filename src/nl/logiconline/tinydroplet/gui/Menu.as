/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file Menu.as
 */

package nl.logiconline.tinydroplet.gui {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Draw;
	
	public class Menu extends Entity {
		
		private var continueButton:MenuItem;
		private var exitButton:MenuItem;
		private var pauseText:FlashingText;
		public function Menu(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			super(x, y, graphic, mask);			
			this.width = 260;
			this.height = 260;
			this.continueButton = new MenuItem("Continue");
			this.exitButton= new MenuItem("Exit");
			this.pauseText = new FlashingText("PAUZE", FP.camera.x + FP.width / 2 - 50, FP.camera.y + 120);
			this.pauseText.getText().size = 32;
		}
		
		override public function added():void {
			this.world.add(this.continueButton);
			this.world.add(this.exitButton);
			this.world.add(this.pauseText);
		}
		
		override public function render():void {
			super.render();
			Draw.rect(FP.camera.x, FP.camera.y, 640, 480, 0x000000, 0.5);
		}
		
		override public function update():void {
			super.update();
			this.x = FP.camera.x + (FP.width / 2 - 130);
			this.y = FP.camera.y + (FP.height / 2 - 130);
			
			this.pauseText.x = FP.camera.x + FP.width / 2 - 50;
			this.pauseText.y = FP.camera.y + 120;
			
			this.continueButton.x = this.x + 20;
			this.continueButton.y = this.y + 80;
			
			this.exitButton.x = this.x + 140;
			this.exitButton.y = this.y + 80;
		}
		
		override public function removed():void {
			super.removed();			
			this.world.remove(this.continueButton);
			this.world.remove(this.exitButton);
			this.world.remove(this.pauseText);
		}
	}
}