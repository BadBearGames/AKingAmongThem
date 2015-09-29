package  {
	
	import flash.display.MovieClip;
	
	
	public class car extends MovieClip
	{
		
		public var thisSuspicion:Number = 0;
		public var curState:Number;
		public var curEvent:Number;
		public var thisName:String = "";
		public var gravityConstant:Number = .08;
		public var vert:Number = 0;
		public var r:Number = 0;
		public var sus:Number = 0;
		public var members:Number = 0;
		
		public var twoTrigger:Boolean = false;
		public var threeTrigger:Boolean = false;
		public var fourTrigger:Boolean = false;
		public var fiveTrigger:Boolean = false;
		public var sevenTrigger:Boolean = false;
		
		
		public var thisDirection:Number; //DIRECTION
		
		
		public function car(stat:Number, evt:Number, x1:Number, y1:Number)
		{
			x = x1;
			y = y1;
			
			curState = stat;
			curEvent = evt;
			
			switch (Math.floor(Math.random() * (3 - 1 + 1)) + 1)
			{
				case 1:
				thisName = ("A Family of Four");
				members = 4;
				break;
				case 2:
				thisName = ("A Driver");
				members = 1;
				break;
				case 3:
				thisName = ("A Couple");
				members = 2;
				break;
			}
			
			if (x == 3000) //DIRECTION
			{
				thisDirection = -1;
			}
			else if (x == 300)
			{
				thisDirection = 1;
			}
		}
		
		public function updateCar():void
		{
			vert += gravityConstant;
			y += vert;
			
			if (curState == 1) //DRIVE AROUND
			{
				if (thisDirection == 1)
				{
					
					if ((fiveTrigger) || (thisSuspicion >= (10 * members))) //DRIVE FASTER IF SCARED
					{
						this.x += 4;
					}
					else
					{
						this.x += 1;
					}
				}
				else
				{
					
					if ((fiveTrigger) || (thisSuspicion >= (10 * members))) //DRIVE FASTER IF SCARED
					{
						this.x -= 4;
					}
					else
					{
						this.x -= 1;
					}
				}
			}
			else if (curState == 2) //MOVE TOWARDS PLAYER
			{
				x = (x + Math.cos(r/180*Math.PI)* 4);
			}
			
			if (this.y > 361) //HIT GROUND
			{
				if (vert > 4)
				{
					curState = 3;
					curEvent = 6;
				}
				else
				{
					curState = 1;
				}
				
				vert = 0;
				y = 361;
			}
			
			if (thisSuspicion > (10 * members)) //CONTROL SUSPICION
			{
				thisSuspicion = (10 * members);
			}
			
			if (((thisSuspicion > 8) && (this.y >= 361)) && (curState == 1)) //CALL COPS
			{
				if (!threeTrigger)
				{
					threeTrigger = true;
					curEvent = 3;
				}
			}
		}
		
	}
	
}
