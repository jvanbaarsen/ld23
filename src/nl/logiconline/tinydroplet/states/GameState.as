/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file GameState.as
 */

package nl.logiconline.tinydroplet.states {
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	import nl.logiconline.tinydroplet.Camera;
	import nl.logiconline.tinydroplet.entities.Player;
	import nl.logiconline.tinydroplet.levels.Level;
	
	
	public class GameState extends World {
		private var level:Level;
		private var player:Player;
		private var cameraOffset:int;
		private var cameraSpeed:int;
		private var gameCam:Camera;
		public function GameState()	{
			super();
			this.level = new Level(this);
			this.cameraOffset = 200;
			this.cameraSpeed = 5;
		}
		
		override public function begin():void {
			super.begin();
			this.level.createMap();			
			this.player = new Player(Level.startPoint.x * Level.tileWidth, Level.startPoint.y * Level.tileHeight);
			this.add(this.player);
			gameCam = new Camera(this.cameraOffset, this.cameraSpeed);
			gameCam.adjustToPlayer(this.level.getWidth() * Level.tileWidth, this.level.getHeight() * Level.tileHeight, this.player);
			
			trace("Start point at: X"+ Level.startPoint.x + " Y:"+ Level.startPoint.y);
			
		}
		
		override public function render():void {
			super.render();
		}
		
		override public function update():void {
			super.update();
			gameCam.moveCamera(this.level.getWidth() * Level.tileWidth, this.level.getHeight() * Level.tileHeight, this.player);
		}
		
		public function getLevel():Level {
			return this.level;
		}		
	}
}