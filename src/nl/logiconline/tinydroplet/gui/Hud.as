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
		[Embed(source="/../assets/drybar.png")] private const DRY_BAR:Class;
		private var time:Text;
		private var timer:Timer;
		private var actualTime:int;
		private var txtScore:Text;
		private var score:int = 0;
		private var txtHealth:Text;
		private var dryBar:Image = new Image(DRY_BAR);
		private var game:GameState;
		public function Hud(game:GameState, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.graphic = new Image(HUD);
			this.width = 640;
			this.height = 80;	
			this.game = game;
			
			
			//Timer
			time = new Text("0", FP.width / 2 - 10, 25);
			this.timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			
			//Score
			this.txtScore = new Text("Score: " + game.getScore(), FP.width / 2 + 100, 10);
			this.txtScore.getText().size = 24;
			
			//Health
			this.txtHealth = new Text("Health: ", 10, 10);
			this.txtHealth.getText().size = 24;
			
		}
		
		override public function added():void {
			super.added();			
			FP.world.add(this.txtScore);
			FP.world.add(this.txtHealth);
			
			var text:Text = new Text("Time", FP.width / 2 - 30, 5);
			text.getText().size = 24;			
			FP.world.add(text);
			FP.world.add(time);
			this.timer.start();			
		}
		
		override public function update():void {
			super.update();
			this.txtScore.getText().text = "Score: "+ game.getScore();
		}
		
		override public function render():void {
			super.render();	
			this.dryBar.scaleX = this.game.getPlayer().getHealth();
			Draw.rectPlus(x + 94, y+ 11, 151, 21, 0x0000ff, 0.8, false); 
			Draw.rect( x + 95, y + 12, 150, 20, 0x0000ff, 0.2);
			Draw.graphic(dryBar, x + 95, y + 12);
			
		}
		
		private function timerHandler(e:TimerEvent):void{	
			this.actualTime += 1;		
			this.time.setRelativeX(FP.width / 2 - 10);
			this.time.getText().text = this.actualTime.toString();
		}
	}
}