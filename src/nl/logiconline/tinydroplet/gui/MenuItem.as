/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file MenuItem.as
 */

package nl.logiconline.tinydroplet.gui {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	import nl.logiconline.tinydroplet.states.GameState;
	import nl.logiconline.tinydroplet.states.MenuState;
	
	public class MenuItem extends Entity {
		[Embed(source="/../assets/levelselection.png")] private const NORMAL:Class;
		[Embed(source="/../assets/levelselection_hover.png")] private const HOVER:Class;	
		private var image:Image = new Image(NORMAL);
		private var imageHover:Image = new Image(HOVER);		
		private var text:Text;
		
		public function MenuItem(text:String, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{			
			super(x, y, graphic, mask);
			this.text = new Text(text, x + 20, y + 40);			
			this.width = 100;
			this.height = 100;
		}
		
		override public function added():void {
			super.added();
			this.world.add(this.text);
		}
		
		override public function update():void {
			super.update();			
			//Yeah ugly code i know... shut it :)
			if(this.text.getText().text == "Continue") {
				this.text.x =  x + 14;	
			} else if(this.text.getText().text == "Exit") {
				this.text.x = x + 34;
			}			
			this.text.y = y + 42;
			
			if(Input.mousePressed && Input.mouseX + FP.camera.x > x && Input.mouseX + FP.camera.x < x + width && Input.mouseY + FP.camera.y > y && Input.mouseY + FP.camera.y < y + height) {
				if(this.text.getText().text == "Continue") {
					GameState(this.world).closeMenu();
				} else if(this.text.getText().text == "Exit") {
					FP.world = new MenuState();
				}
			}
		}
		
		override public function render():void {
			super.render();			
			if(Input.mouseX + FP.camera.x > x && Input.mouseX + FP.camera.x < x + width && Input.mouseY + FP.camera.y > y && Input.mouseY + FP.camera.y < y + height) {
				imageHover.color = 0x0000ff;
				Draw.graphic(imageHover, x, y);				
			} else {
				imageHover.color = 0xffffff;
				Draw.graphic(imageHover, x, y);			
			}
		}
		
		override public function removed():void {
			super.removed();
			this.world.remove(this.text);
		}
	}
}