/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.entities
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Player.as
 */

package nl.logiconline.tinydroplet.entities {	
	
	import com.matttuttle.PhysicsEntity;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import nl.logiconline.tinydroplet.levels.Level;
	import nl.logiconline.tinydroplet.states.GameState;
	
	public class Player extends PhysicsEntity {
		
		//color: 0x34aaf5
		private static const kMoveSpeed:uint = 2;
		private static const kJumpForce:uint = 19;		
		private var spritesheet:Spritemap;
		
		[Embed(source="/../assets/player.png")] private const PLAYER:Class;
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			super(x, y);
			this.width = 26;
			this.height = 26;
			this.spritesheet = new Spritemap(PLAYER, 26, 26);
			this.spritesheet.add("idle", [0], 10, true);
			this.spritesheet.add("right", [1], 10, true);
			this.spritesheet.add("left", [2], 10, true);
			this.spritesheet.add("jump", [3], 10, true);
						
			this.graphic = this.spritesheet;
			this.setup();			
		}
		
		private function setup():void {
			
			// Set physics properties
			gravity.y = 2.4;
			maxVelocity.y = kJumpForce;
			maxVelocity.x = kMoveSpeed * 2;
			friction.x = friction.y = 1.6;
			
			//Set keys
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("jump", Key.W, Key.UP, Key.SPACE);
			Input.define("run", Key.SHIFT);
		}
		
		
		override public function render():void {
			super.render();
			//Draw.rect(x, y, width, height, 0x34aaf5);
		}
		
		override public function update():void {
			acceleration.x = acceleration.y = 0;		
			
			if (Input.check("left")) {
				this.spritesheet.play("left");
				acceleration.x = -kMoveSpeed;				
			}				
			
			if (Input.check("right")) {
				this.spritesheet.play("right");
				acceleration.x = kMoveSpeed;
			}			
			
			if (Input.pressed("jump") && onGround) {				
				acceleration.y = -kJumpForce;
			}
			
			if(!onGround) {				
				this.spritesheet.play("jump");
			} else {
				if(!Input.check("left") && !Input.check("right")) {
					this.spritesheet.play("idle");	
				}				
			}
				
			
			super.update();		
			
		}
		
	}
}