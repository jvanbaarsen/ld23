/**
 * @project ld23
 * @package 
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 20, 2012
 * @file ld23.as
 */

package {
	import flash.display.Sprite;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import nl.logiconline.tinydroplet.states.GameState;
	import nl.logiconline.tinydroplet.states.MenuState;
	
	[SWF(frameRate="60",width="640", height="480")]
	public class ld23 extends Engine {
		public function ld23()	{
			super(640, 480);
			FP.world = new MenuState();
			FP.screen.color = 0x474747;			
		}
	}
}