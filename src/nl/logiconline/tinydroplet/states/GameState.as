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
	import net.flashpunk.FP;
	
	import nl.logiconline.tinydroplet.entities.Player;
	import nl.logiconline.tinydroplet.levels.Level;
	
	
	public class GameState extends World {
		private var level:Level;
		private var player:Player;
		private var cameraOffset:int;
		private var cameraSpeed:int;
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
			
		}
		
		override public function render():void {
			super.render();
		}
		
		override public function update():void {
			super.update();
			moveCamera();	
		}
		
		public function getLevel():Level {
			return this.level;
		}
		
		private function moveCamera():void {	
			//Horizontal movement
			if(this.player.x - FP.camera.x < cameraOffset) {
				if(FP.camera.x > 0) FP.camera.x -= cameraSpeed;	
			} else if((FP.camera.x + FP.width) - (this.player.x + this.player.width) < cameraOffset) {
				if(FP.camera.x + FP.width < (this.level.getWidth() * Level.tileWidth)) FP.camera.x += cameraSpeed;	
			}
			
			//Vertical movement
			if(this.player.y - FP.camera.y < cameraOffset) {
				if(FP.camera.y > 0) FP.camera.y -= cameraSpeed;
			} else if((this.player.y + FP.width) - (this.player.y + this.player.height) < cameraOffset) {
				if(FP.camera.y + FP.height < (this.level.getHeight() * Level.tileHeight)) FP.camera.y += cameraSpeed;
			}	
			
		}
	}
}