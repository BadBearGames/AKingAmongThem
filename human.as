package  {
	
	import flash.display.MovieClip;
	
	
	public class human extends MovieClip 
	{
		public var thisSuspicion:Number = 0;
		public var curState:Number;
		public var curEvent:Number;
		public var thisName:String = "";
		public var gravityConstant:Number = .08;
		public var vert:Number = 0;
		public var r:Number = 0;
		public var sus:Number = 0;
		
		public var twoTrigger:Boolean = false;
		public var threeTrigger:Boolean = false;
		public var fourTrigger:Boolean = false;
		public var fiveTrigger:Boolean = false;
		public var sevenTrigger:Boolean = false;
		public var thisDirection:Number;
		private var steps:Number;
		
		public function human(stat:Number, evt:Number, x1:Number, y1:Number)
		{
			x = x1;
			y = y1;
			
			curState = stat;
			curEvent = evt;
			
			switch (Math.floor(Math.random() * (30 - 1 + 1)) + 1)
			{
				case 1:
				thisName = ("Dave");
				break;
				case 2:
				thisName = ("Julia");
				break;
				case 3:
				thisName = ("Nelson");
				break;
				case 4:
				thisName = ("Mark");
				break;
				case 5:
				thisName = ("Mary");
				break;
				case 6:
				thisName = ("Katy");
				break;
				case 7:
				thisName = ("Nick");
				break;
				case 8:
				thisName = ("Tim");
				break;
				case 9:
				thisName = ("Maria");
				break;
				case 10:
				thisName = ("Sasha");
				break;
				case 11:
				thisName = ("Ellie");
				break;
				case 12:
				thisName = ("John");
				break;
				case 13:
				thisName = ("Nate");
				break;
				case 14:
				thisName = ("Kelly");
				break;
				case 15:
				thisName = ("Andrew");
				break;
				case 16:
				thisName = ("Justin");
				break;
				case 17:
				thisName = ("Elizabeth");
				break;
				case 18:
				thisName = ("Olivia");
				break;
				case 19:
				thisName = ("A King");
				break;
				case 20:
				thisName = ("A King");
				break;
				case 21:
				thisName = ("Jake");
				break;
				case 22:
				thisName = ("Charlie");
				break;
				case 23:
				thisName = ("A King");
				break;
				case 24:
				thisName = ("Richard");
				break;
				case 25:
				thisName = ("Nester");
				break;
				case 26:
				thisName = ("A King");
				break;
				case 27:
				thisName = ("Lauren");
				break;
				case 28:
				thisName = ("Ashley");
				break;
				case 29:
				thisName = ("Megan");
				break;
				case 30:
				thisName = ("Emily");
				break;
			}
			
			steps = (Math.floor(Math.random() * (1000 - 1 + 1)) + 1);
			thisDirection = (Math.floor(Math.random() * (2 - 1 + 1)) + 1);
		}
		
		public function updateHuman():void
		{
			vert += gravityConstant;
			y += vert;
			
			if (curState == 1) //WALK AROUND
			{
				if (steps >= 0)
				{
					if (thisDirection == 1)
					{
						steps--;
						
						if ((fiveTrigger) || (thisSuspicion >= 10)) //RUNS FASTER IF SCARED
						{
							this.x += .9;
						}
						else
						{
							this.x += .2;
						}
					}
					else
					{
						steps--;
						
						if ((fiveTrigger) || (thisSuspicion >= 10)) //RUNS FASTER IF SCARED
						{
							this.x -= .9;
						}
						else
						{
							this.x -= .2;
						}
					}
				}
				else
				{
					steps = (Math.floor(Math.random() * (1000 - 1 + 1)) + 1);
					if (thisDirection == 1)
					{
						thisDirection = 2;
					}
					else
					{
						thisDirection = 1;
					}
				}
			}
			else if (curState == 2) //MOVE TOWARDS PLAYER
			{
				x = (x + Math.cos(r/180*Math.PI)* 4);
			}
			
			if (this.y > 361) //HIT GROUND
			{
				if (vert > 3)
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
			
			if (thisSuspicion > 10) //CONTROL SUSPICION
			{
				thisSuspicion = 10;
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
