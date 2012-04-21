/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file GameState.as
 */

package nl.logiconline.tinydroplet.states {
	import net.flashpunk.World;
	
	import nl.logiconline.tinydroplet.entities.Player;
	import nl.logiconline.tinydroplet.levels.Level;
	
	public class GameState extends World {
		private var level:Level;
		private var player:Player;
		public function GameState()	{
			super();
			this.level = new Level(this);
		}
		
		override public function begin():void {
			super.begin();
			this.level.createMap();		
			this.player = new Player(20, 416);
			this.add(this.player);
		}
		
		override public function render():void {
			super.render();
		}
		
		override public function update():void {
			super.update();
		}
		
		public function getLevel():Level {
			return this.level;
		}
	}
}