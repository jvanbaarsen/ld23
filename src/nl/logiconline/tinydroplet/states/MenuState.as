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
			this.pressKeyText = new FlashingText("Press SPACE to start", FP.width / 2 - 100, 350);			
			this.add(pressKeyText);
			
		}		
		
		override public function begin():void {
			super.begin();
		}
		
		override public function render():void {
			super.render();
			var introText1:Text = new Text("You play a drop of water, named Droplet, that fell out of a bucket.. ", 20, 200);
			var introText2:Text = new Text("You've heard a lot of stories about the big sewer!", 90, 220);
			
			var introText3:Text = new Text("Now he's free from the bucket, he wants to reach the sewer entrance..", 10, 260);
			var introText4:Text = new Text("Help Droplet to reach his destiny", 170, 290);
			
			var introText5:Text = new Text("Made in 48 hours for LudumDare, by Jeroen van Baarsen", 20, 440);
			introText5.getText().size = 8;
			this.add(introText1);
			this.add(introText2);
			this.add(introText3);
			this.add(introText4);
			this.add(introText5);
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