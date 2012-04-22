/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file LevelSelector.as
 */

package nl.logiconline.tinydroplet.gui {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	import nl.logiconline.tinydroplet.Saver;
	import nl.logiconline.tinydroplet.states.GameState;
	
	public class LevelSelector extends Entity {
		[Embed(source="/../assets/levelselection.png")] private const NORMAL:Class;
		[Embed(source="/../assets/levelselection_hover.png")] private const HOVER:Class;		
		
		private var image:Image = new Image(NORMAL);
		private var imageHover:Image = new Image(HOVER);
		private var level:int;
		private var levelText:Text;
		private var highscore:Text;
		public function LevelSelector(level:int, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{			
			super(x, y, graphic, mask);
			this.level = level;
			this.width = 100;
			this.height = 100;			
		}
		
		override public function added():void {
			super.added();
			this.levelText = new Text("Level "+ this.level, x + 20, y + 40);
			var score:int = Saver.getHighscore(this.level);			
			if(score != -1) {
				this.highscore = new Text("Highscore: "+ score, x, y + 120);
				this.world.add(this.highscore);
			}
			
			this.world.add(this.levelText);
		}
		
		override public function render():void {
			super.render();
			if(Input.mouseX > x && Input.mouseX < x + width && Input.mouseY > y && Input.mouseY < y + height) {
				imageHover.color = 0x0000ff;
				Draw.graphic(imageHover, x, y);				
			} else {
				imageHover.color = 0xffffff;
				Draw.graphic(imageHover, x, y);			
			}			
		}
		
		override public function update():void {
			super.update();
			if(Input.mousePressed && Input.mouseX > x && Input.mouseX < x + width && Input.mouseY > y && Input.mouseY < y + height) {
				FP.world = new GameState(this.level);
			}
		}
	}
}