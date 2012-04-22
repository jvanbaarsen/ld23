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
	
	import nl.logiconline.tinydroplet.entities.pickups.Pickup;
	import nl.logiconline.tinydroplet.gui.FloatingText;
	import nl.logiconline.tinydroplet.levels.Level;
	import nl.logiconline.tinydroplet.states.GameState;
	
	public class Player extends PhysicsEntity {
		
		//color: 0x34aaf5
		private static const kMoveSpeed:uint = 2;
		private static const kJumpForce:uint = 18;		
		private var spritesheet:Spritemap;
		private var health:int;
		private var died:Boolean = false;	
		private var canMove:Boolean = true;
		
		[Embed(source="/../assets/player.png")] private const PLAYER:Class;
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			super(x, y);
			this.type = "player";
			this.width = 26;
			this.height = 26;
			this.spritesheet = new Spritemap(PLAYER, 26, 26);
			this.spritesheet.add("idle", [0], 10, true);
			this.spritesheet.add("right", [1], 10, true);
			this.spritesheet.add("left", [2], 10, true);
			this.spritesheet.add("jump", [3], 10, true);
			this.spritesheet.add("dead", [4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,], 10, false);
						
			this.setHitbox(24, 20, -1, -6);
			this.graphic = this.spritesheet;
			this.setup();	
			this.health = 150; //The lazy way :)
		}
		
		private function setup():void {
			
			// Set physics properties
			gravity.y = 2.0;
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
			if(GameState(this.world).win) {
				this.spritesheet.play("idle");	
				this.canMove = false;
			} else if(GameState(this.world).lose) {
				this.died = true;
				this.canMove = false;
			} else {
				if(this.collide("lava", x, y) != null) {
					if(this.health > 0) this.health -= 20;					
				}
				
				if(this.collide("spike", x, y) != null) {
					if(this.health > 0) this.health -= 10;
					
					if(this.health > 0)	acceleration.y = -(kJumpForce / 3);
				}
				
				if(this.health <= 0) {
					GameState(this.world).loseCall();
				}
			}
			
			if(this.health < 0) this.health = 0; //To prefend the healthbar tripping..
			
			if(this.canMove) {
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
			}
					
			if(this.collide("pickup", x, y) != null && !this.died) {
				var pickup:Pickup  = Pickup(this.collide("pickup", x, y));
				if(pickup != null) {
					var score:FloatingText = new FloatingText(pickup.x, pickup.y, "+ "+ pickup.getValue());
					this.world.add(score);
					GameState(this.world).addScore(pickup.getValue());
					this.world.remove(pickup);
				}				
			}
			
			if(this.died) {
				this.spritesheet.play("dead");
				this.spritesheet.alpha -= 0.01;
				this.y -= 20;				
			}
			
			
			super.update();
		
			
			
			
		}
		
		public function getHealth():int {
			return this.health;
		}
		
		public function setHealth(health:int):void {
			this.health = health;
		}
		
	}
}