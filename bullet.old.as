package  {
	
	import flash.display.MovieClip;
	
	
	public class bullet extends MovieClip
	{
		//Variables
		private var pistolBulletSpeed:Number = 10;
		private var delay:Number = 3;
		
		public function bullet()
		{
			this.visible = false;
		}
		public function updateBullet():void
		{
			if (delay > 0)
			{
				this.visible = false;
				delay--;
			}
			else
			{
				this.visible = true;
			}
			x = (x + Math.cos(rotation/180*Math.PI)* pistolBulletSpeed);
			y = (y + Math.sin(rotation/180*Math.PI)* pistolBulletSpeed);
		}
	}
	
}
