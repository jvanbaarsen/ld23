/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.entities
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Player.as
 */

package nl.logiconline.tinydroplet.entities {	
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import nl.logiconline.tinydroplet.levels.Level;
	import nl.logiconline.tinydroplet.states.GameState;
	
	public class Player extends Entity {
		
		//color: 0x34aaf5
		private var speed:int = 120;
		private var dropSpeed:int = 20;
		private var jumpSpeed:int = 40;
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {	
			super(x, y, graphic, mask);
			this.width = 26;
			this.height = 26;	
			this.setupKeys();
		}
		
		private function setupKeys():void {
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("jump", Key.W, Key.UP, Key.SPACE);
			Input.define("run", Key.SHIFT);
		}
		
		
		override public function render():void {
			super.render();
			Draw.rect(x, y, width, height, 0x34aaf5);
		}
		
		override public function update():void {
			super.update();		
			
			
			if(this.collide("solid", this.x, this.y) == null) {				
				this.y += dropSpeed * FP.elapsed;
			}			
			
			this.speed = 120;
			if(Input.check("run")) this.speed = 180;			
			var newX:int;
			
			if(Input.check("left")) {	
				newX = x - (speed * FP.elapsed);
				if(newX > 0 && this.collide("solid", this.x, this.y - 1) == null) x = newX;
			} else if(Input.check("right")) {
				newX = x + (speed * FP.elapsed);				
				if(newX < (GameState(this.world).getLevel().getWidth() * Level.tileWidth) -  this.width && this.collide("solid", this.x, this.y - 1) == null) x = newX;
			}
			
			if(Input.check("jump")) {
				y -= this.jumpSpeed * FP.elapsed;
			}
		}
		
		
	}
}