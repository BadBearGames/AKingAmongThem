package  {
	
	import flash.display.MovieClip;
	
	
	public class missle extends MovieClip 
	{
		//Variables
		private var missleSpeed:Number = 8;
		public var r:Number = 0;
		
		public function missle()
		{
			y = (Math.floor(Math.random() * (300 - (-2000) + 1)) + (-2000));
			
			if ((Math.floor(Math.random() * (2 - 1 + 1)) + 1) == 2)
			{
				x = 100;
			}
			else
			{
				x = 3200;
			}
		}
		
		public function updateMissle():void
		{
			x = (x + Math.cos(r/180*Math.PI)* missleSpeed);
			y = (y + Math.sin(r/180*Math.PI)* missleSpeed);
			this.rotation = r + 90;
		}
	}
	
}
