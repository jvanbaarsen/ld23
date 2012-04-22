/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Hud.as
 */

package nl.logiconline.tinydroplet.gui {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flashx.textLayout.formats.Float;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	
	import nl.logiconline.tinydroplet.states.GameState;
	
	public class Hud extends Entity {	
		
		[Embed(source="/../assets/gui.png")] private const HUD:Class;		
		[Embed(source="/../assets/healthBackground.png")] private const HEALTH_BACK:Class;
		private var time:Text;
		private var timer:Timer;
		private var actualTime:int;
		private var txtScore:Text;
		private var score:int = 0;
		private var txtHealth:Text;		
		private var game:GameState;
		private var healthBackground:Image;
		private var coinCounter:Text;
		public function Hud(game:GameState, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.graphic = new Image(HUD);
			this.healthBackground = new Image(HEALTH_BACK);
			this.width = 640;
			this.height = 80;	
			this.game = game;
			
		
			//Score
			this.txtScore = new Text("Score: " + game.getScore(), 20, 10);
			//this.txtScore.getText().size = 24;
			
			//Health
			this.txtHealth = new Text("Health", 5, 10);
			
			//Coin counter
			this.coinCounter = new Text("Coins:", FP.width / 2 + 100, 10);
			
		}
		
		override public function added():void {
			super.added();			
			FP.world.add(this.txtScore);
			FP.world.add(this.txtHealth);
			FP.world.add(this.coinCounter);
			this.coinCounter.getText().text = "Coins: "+ this.game.getPlayer().getCoinsCollected() +" / "+ this.game.getLevel().getTotalCoins();
		}
		
		override public function update():void {
			super.update();
			this.txtScore.getText().text = "Score: "+ game.getScore();
			this.coinCounter.getText().text = "Coins: "+ this.game.getPlayer().getCoinsCollected() +" / "+ this.game.getLevel().getTotalCoins();
		}
		
		override public function render():void {
			Draw.graphic(this.healthBackground, x + 256, y);
			Draw.rect(x + 170, y + (60 - this.game.getPlayer().getHealth() * 0.6), 300, this.game.getPlayer().getHealth() * 0.6, 0x1c10d8);
			//Image(this.graphic).alpha = 0.4;
			this.txtHealth.x = x + 290;		
			this.txtHealth.y = y;
			super.render();			
		}
	}
}