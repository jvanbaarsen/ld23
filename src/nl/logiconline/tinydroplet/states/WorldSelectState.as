/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file WorldSelectState.as
 */

package nl.logiconline.tinydroplet.states {
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	
	import nl.logiconline.tinydroplet.Saver;
	import nl.logiconline.tinydroplet.gui.LevelSelector;
	
	public class WorldSelectState extends World {		
		[Embed(source="/../assets/logo.png")] private const LOGOIMG:Class;
		private var logo:Image = new Image(LOGOIMG);
		private var lastLevel:int = 1;
		public function WorldSelectState() {			
			super();
			this.lastLevel = Saver.lastLevel();		
		}
		
		override public function begin():void {
			super.begin();			
			
			var level1:LevelSelector = new LevelSelector(1, 40, 200);
			this.add(level1);
			
			var level2:LevelSelector = new LevelSelector(2, 190, 200);
			if(this.lastLevel >= 2) {				
				this.add(level2);
			}			
			
			var level3:LevelSelector = new LevelSelector(3, 340, 200);
			if(this.lastLevel >= 3) {
				this.add(level3);	
			}
			
			
			var level4:LevelSelector = new LevelSelector(4, 490, 200);
			if(this.lastLevel >= 4) {
				this.add(level4);	
			}
			
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function render():void {
			super.render();
			Draw.graphic(this.logo);
		}
	}
}