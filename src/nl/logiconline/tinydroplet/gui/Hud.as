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
	
	public class Hud extends Entity {	
		
		[Embed(source="/../assets/gui.png")] private const HUD:Class;
		private var time:Text;
		private var timer:Timer;
		private var actualTime:int;
		public function Hud(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.graphic = new Image(HUD);
			this.width = 640;
			this.height = 80;	
			time = new Text("0", FP.width / 2 - 10, 25);
			this.timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
		}
		
		override public function added():void {
			super.added();			
			var text:Text = new Text("Time", FP.width / 2 - 30, 5);
			text.getText().size = 24;			
			FP.world.add(text);
			FP.world.add(time);
			this.timer.start();
		}
		
		override public function update():void {
			super.update();
		}
		
		private function timerHandler(e:TimerEvent):void{	
			this.actualTime += 1;		
			this.time.setRelativeX(FP.width / 2 - 10);
			this.time.getText().text = this.actualTime.toString();
		}
	}
}