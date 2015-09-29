package  {
	
	import flash.display.MovieClip;
	
	
	public class building1 extends MovieClip
	{
		public var curState:Number;
		public var gravityConstant:Number = .08;
		public var vert:Number = 0;
		public var r:Number = 0;
		public var sus:Number = 0;
		
		
		
		
		public function building1()
		{
			curState = 1;
		}
		
		public function updateBuilding():void
		{
			vert += gravityConstant;
			y += vert;
			
			
			if (curState == 2) //MOVE TOWARDS PLAYER
			{
				x = (x + Math.cos(r/180*Math.PI)* 4);
			}
			
			if (this.y > 323) //HIT GROUND
			{
				if (vert > 4)
				{
					curState = 3;
				}
				else
				{
					curState = 1;
				}
				vert = 0;
				y = 323;
			}
			
		}
	}
	
}
