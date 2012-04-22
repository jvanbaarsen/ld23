/**
 * @project ld23
 * @package nl.logiconline.tinydroplet
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 22, 2012
 * @file Saver.as
 */

package nl.logiconline.tinydroplet {
	import net.flashpunk.utils.Data;
	public class Saver {
		public function Saver()	{
		}
		
		public static function load():void {
			Data.load("testfile.dat");
			var times:uint = Data.readInt("times_ran",1);
			trace("We've run", times, "times!");
			
			times = times + 1;
			Data.writeInt("times_ran",times);
			Data.save("testfile.dat");
		}
		
		public static function lastLevel():int {
			Data.load("leveldat.dat");			
			var level:uint = Data.readInt("currentLevel", 1);
			return level;
		}
		
		public static function writeLevel(level:int):void {
			Data.load("leveldat.dat");
			Data.writeInt("currentLevel", level);
			Data.save("leveldat.dat");
		}
		
		public static function getHighscore(level:int):int {
			Data.load("highscore.dat");		
			
			var highscore:uint = Data.readInt(level.toString(), -1);
			return highscore;
		}
		
		public static function writeHighscore(level:int, score:int):void {
			Data.load("highscore.dat");
			Data.writeInt(level.toString(), score);
			Data.save("highscore.dat");
		}
	}
}