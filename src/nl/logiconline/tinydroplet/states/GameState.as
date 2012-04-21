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
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import nl.logiconline.tinydroplet.Camera;
	import nl.logiconline.tinydroplet.entities.Player;
	import nl.logiconline.tinydroplet.gui.FlashingText;
	import nl.logiconline.tinydroplet.gui.Hud;
	import nl.logiconline.tinydroplet.gui.Text;
	import nl.logiconline.tinydroplet.levels.Level;
	
	
	public class GameState extends World {
		private var level:Level;
		private var player:Player;
		private var cameraOffset:int;
		private var cameraSpeed:int;
		private var gameCam:Camera;
		private var hud:Hud;
		private var winText:FlashingText;
		public  var win:Boolean = false;
		
		public function GameState(level:int)	{
			super();			
			this.level = new Level(this, level);
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
			hud = new Hud(this);
			this.add(hud);
			
		}
		
		override public function render():void {
			super.render();
		}
		
		override public function update():void {			
			gameCam.moveCamera(this.level.getWidth() * Level.tileWidth, this.level.getHeight() * Level.tileHeight, this.player);
			super.update();
			this.hud.x = FP.camera.x;
			this.hud.y = FP.camera.y;			
			
			if(this.player.collide("finish", this.player.x, this.player.y) != null) {				
				if(!this.win) this.winCall();
			}
			
			if(this.win && Input.check(Key.SPACE)) {
				FP.world = new WorldSelectState();
			}
		}
		
		public function getLevel():Level {
			return this.level;
		}
		
		public function getPlayer():Player {
			return this.player;
		}
		
		private function winCall():void {
			this.winText = new FlashingText("YOU'VE COMPLETED THE LEVEL!", 120, 216);
			this.winText.getText().size = 32;
			this.add(this.winText);
			var subWinText:Text = new Text("Press SPACE to continue", 220, 246);
			this.add(subWinText);
			this.win = true;
		}
	}
}