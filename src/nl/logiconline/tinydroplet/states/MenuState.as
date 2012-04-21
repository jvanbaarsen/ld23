/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file MenuState.as
 */

package nl.logiconline.tinydroplet.states {
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import nl.logiconline.tinydroplet.gui.FlashingText;
	import nl.logiconline.tinydroplet.gui.Text;
	
	public class MenuState extends World {
		[Embed(source="/../assets/logo.png")] private const LOGOIMG:Class;
		private var logo:Image = new Image(LOGOIMG);
		private var pressKeyText:FlashingText;
		public function MenuState()	{			
			super();
			this.pressKeyText = new FlashingText("Press SPACE to start", FP.width / 2 - 100, 300);			
			this.add(pressKeyText);
			
		}		
		
		override public function begin():void {
			super.begin();
		}
		
		override public function render():void {
			super.render();
			Draw.graphic(this.logo);
			
		}
		
		override public function update():void {
			super.update();
			
			if(Input.check(Key.SPACE)) {
				FP.world = new WorldSelectState();
			}
			
		}
	}
}