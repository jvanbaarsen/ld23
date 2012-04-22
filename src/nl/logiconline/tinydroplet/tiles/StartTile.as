/**
 * @project ld23
 * @package nl.logiconline.tinydroplet.tiles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file StartTile.as
 */

package nl.logiconline.tinydroplet.tiles {
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	
	public class StartTile extends Tile {
		private var spritesheet:Spritemap;
		[Embed(source="/../assets/tiles.png")] private const TILES:Class;
		public function StartTile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {			
			super(x, y, graphic, mask);		
			this.type = "";
			this.spritesheet = new Spritemap(TILES, 32, 32);
			this.spritesheet.setFrame(5, 0);
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