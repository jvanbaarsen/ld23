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
	import nl.logiconline.tinydroplet.Saver;
	import nl.logiconline.tinydroplet.entities.Player;
	import nl.logiconline.tinydroplet.gui.FlashingText;
	import nl.logiconline.tinydroplet.gui.FloatingText;
	import nl.logiconline.tinydroplet.gui.Hud;
	import nl.logiconline.tinydroplet.gui.Menu;
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
		public 	var lose:Boolean = false;
		private var score:int = 0;
		private var menu:Menu;
		private var escapeTimeOut:int = 0;
		private var warningTimeOut:int =0;
		
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
			
			if(this.level.getCurrentLevel() == 1) {
				//Add tutorial text
				var tutorialText1:Text = new Text("Left/Right/Up to move", 10, 200, false);
				var tutorialText2:Text = new Text("Watch out for lava, it kills!", 60, 448, false);
				var tutorialText3:Text = new Text("Spikes hurt as well!", 350, 310, false);
				var tutorialText4:Text = new Text("Collect all the coins", 400, 435, false);
				var tutorialText5:Text = new Text("Then go to the sewer entrance!", 672, 200, false);
				this.add(tutorialText1);
				this.add(tutorialText2);
				this.add(tutorialText3);
				this.add(tutorialText4);
				this.add(tutorialText5);
			}
			
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
				//Check if all the coins are collected..				
				if(this.player.getCoinsCollected() < this.level.getTotalCoins()) {
					if(this.warningTimeOut == 0) {
						var warning:FloatingText = new FloatingText(FP.camera.x + 60, FP.camera.y + 120, "You didn't collect al the coins!", 0xff0000);
						warning.getText().size = 32;
						this.add(warning);
						this.warningTimeOut = 50;
					}
				} else {
					if(!this.win) this.winCall();	
				}			
				
			}
			
			if(this.warningTimeOut > 0) this.warningTimeOut--;
			
			if(this.win && Input.check(Key.SPACE)) {
				FP.world = new WorldSelectState();
			}
			
			if(this.lose && Input.check(Key.SPACE)) {				
				FP.world = new GameState(this.level.getCurrentLevel());
			}
			
			
			//Need some sort of delay...
			if(this.menu == null && Input.check(Key.ESCAPE) && this.escapeTimeOut == 0) {
				this.menu = new Menu(FP.width / 2 - 150, FP.height / 2 - 150);				
				this.add(this.menu);
				this.player.canMove = false;
				this.escapeTimeOut = 10;
				
			} else if(this.menu != null && Input.check(Key.ESCAPE) && this.escapeTimeOut == 0) {
				this.remove(this.menu);
				this.menu = null;
				this.player.canMove = true;
				this.escapeTimeOut = 10;
			}
			
			if(this.escapeTimeOut != 0)	this.escapeTimeOut--;			
		}
		
		public function getLevel():Level {
			return this.level;
		}
		
		public function getPlayer():Player {
			return this.player;
		}
		
		private function winCall():void {
			if(this.level.getCurrentLevel() == 4) {
				this.winText = new FlashingText("YOU'VE COMPLETED THE GAME!", 120, 216);	
			} else {
				this.winText = new FlashingText("YOU'VE COMPLETED THE LEVEL!", 120, 216);
			}
			
			this.winText.getText().size = 32;
			this.add(this.winText);
			var subWinText:Text = new Text("Press SPACE to continue", 220, 246);
			this.add(subWinText);
			this.win = true;
			if(Saver.lastLevel() < this.level.getCurrentLevel() + 1) {
				Saver.writeLevel(this.level.getCurrentLevel() + 1);	
			}			
			if(this.score > Saver.getHighscore(this.level.getCurrentLevel())) {				
				Saver.writeHighscore(this.level.getCurrentLevel(), this.score);
			}
		}
		
		public function loseCall():void {
			this.winText = new FlashingText("YOU DIED!", 240, 216);
			this.winText.getText().size = 32;
			this.add(this.winText);
			var subWinText:Text = new Text("Press SPACE to try again", 220, 246);
			this.add(subWinText);
			this.lose = true;
		}
		
		public function getScore():int {
			return this.score;
		}
		
		public function addScore(score:int):void {
			this.score += score;
		}
		
		public function removeScore(score:int):void {
			this.score -= score;
			if(this.score < 0) this.score = 0; 
		}
		
		public function closeMenu():void {
			this.remove(this.menu);
			this.menu = null;
			this.player.canMove = true;
			this.escapeTimeOut = 10;
		}
	}
}