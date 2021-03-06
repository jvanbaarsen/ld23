/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file FinishTile.as
 */

package nl.logiconline.tinydroplet.tiles {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	
	import nl.logiconline.tinydroplet.gui.FlashingText;
	import nl.logiconline.tinydroplet.states.GameState;
	
	public class FinishTile extends Tile {
		private var spritesheet:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;
		public function FinishTile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);
			this.type = "finish";
			this.spritesheet = new Spritemap(TILES, 32, 32);
			this.spritesheet.setFrame(6, 0);
			this.graphic = this.spritesheet;
			
		}		
		
		override public function render():void {
			super.render();			
		}
		
		override public function update():void {
			super.update();				
		}
	}
}