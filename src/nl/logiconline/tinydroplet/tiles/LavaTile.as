/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file LavaTile.as
 */

package nl.logiconline.tinydroplet.tiles {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	
	public class LavaTile extends Tile {
		private var tilesheet:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;	
		
		private var counter:int = 0;
		public function LavaTile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)	{			
			super(x, y, graphic, mask);
			this.type = "lava";			
			this.tilesheet = new Spritemap(TILES, 32, 32);
			this.tilesheet.setFrame(1, 6);
			this.graphic = this.tilesheet;			
		}
		
		override public function update():void {
			super.update();
			this.counter++;
			if(this.counter == 10){
				this.tilesheet.setFrame(Math.floor(Math.random()*4), 6);
				this.counter = 0;
			}
		}
		
		override public function render():void {
			super.render();
			//Draw.rect(x, y, this.width, this.height, 0xff0000);
		}
	}
}