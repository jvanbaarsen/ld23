/**
 * @project ld23
 * @package nl.logiconline.tinydroplet
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Apr 21, 2012
 * @file Camera.as
 */

package nl.logiconline.tinydroplet {
	import net.flashpunk.FP;
	
	import nl.logiconline.tinydroplet.entities.Player;

	public class Camera {
		
		private var cameraOffset:int;
		private var cameraSpeed:int;
		public function Camera(cameraOffset:int, cameraSpeed:int) {
			this.cameraOffset = cameraOffset;
			this.cameraSpeed = cameraSpeed;
		}
		
		public function adjustToPlayer(mapWidth:int, mapHeight:int, player:Player):void {
			var newCameraX:int = (player.x + player.width / 2) - FP.width / 2;
			var newCameraY:int = (player.y + player.height / 2) - FP.height / 2;
			
			if(newCameraX < 0) {
				newCameraX = 0;
			} else if(newCameraX + FP.width > mapWidth) {
				newCameraX = mapWidth - FP.width;
			}		
			
			if(newCameraY < 0) {
				newCameraY = 0;
			} else if(newCameraY + FP.height > mapHeight) {
				newCameraY = mapHeight - FP.height;
			}
			
			FP.camera.x = newCameraX;
			FP.camera.y = newCameraY;
			
			
		}
		
		public function moveCamera(mapWidth:int, mapHeight:int, player:Player):void {	
			//Horizontal movement
			if(player.x - FP.camera.x < cameraOffset) {
				if(FP.camera.x > 0) FP.camera.x -= cameraSpeed;	
			} else if((FP.camera.x + FP.width) - (player.x + player.width) < cameraOffset) {
				if(FP.camera.x + FP.width < mapWidth) FP.camera.x += cameraSpeed;	
			}
			
			//Vertical movement
			if(player.y - FP.camera.y < cameraOffset) {
				if(FP.camera.y > 0) FP.camera.y -= cameraSpeed;
			} else if((FP.camera.y + FP.height) - (player.y + player.height) < cameraOffset) {
				if(FP.camera.y + FP.height < mapHeight) FP.camera.y += cameraSpeed;
			}
			
		}
	}
}