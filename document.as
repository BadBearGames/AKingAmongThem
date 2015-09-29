package  {
	
	import flash.display.MovieClip;
	import flash.net.SharedObject;
	import flash.events.Event;
	
	
	public class document extends MovieClip 
	{
		
		//MAIN VARS
		public static var init:Boolean = true;
		public static var newG:Boolean = false;
		public static var mute:Boolean = false;
		public static var currentWorld:Number = 1;
		public static var freePlay:Boolean = false;
		public var saveData:SharedObject;
		
		//OTHER VARS
		public static var w1Tier = 1;
		public static var w2Tier = 1;
		public static var w3Tier = 1;
		public static var w4Tier = 1;
		public static var humansTaken = 0;
		public static var chaosScore = 0;
		
		
		public static var totalHumansTaken:Number = 0;
		
		public function document() 
		{
			var _mochiads_game_id:String = "32f82376cd23a9ac";
			addEventListener(Event.ADDED_TO_STAGE, initA);
		}
		
		public function initA(evt:Event):void
		{
			//SAVE DATA---
			saveData = SharedObject.getLocal("AmongThemSaveData");
			
			if (saveData.data.world1Tier == null)
			{
				saveData.data.world1Tier = 1;
				saveData.data.world2Tier = 1;
				saveData.data.world3Tier = 1;
				saveData.data.world4Tier = 1;
				saveData.data.totalHumans = 0;
				saveData.data.chaos = 0;
				saveData.flush();
				
				newG = true;
			}
			//---
			
			w1Tier = saveData.data.world1Tier;
			w2Tier = saveData.data.world2Tier;
			w3Tier = saveData.data.world3Tier;
			w4Tier = saveData.data.world4Tier;
			humansTaken = saveData.data.totalHumans;
			chaosScore = saveData.data.chaos;
			
			
			removeEventListener(Event.ADDED_TO_STAGE, initA);
		}
		
		public function newGame():void //NEW GAME
		{
			newG = true;
			w1Tier = 1;
			w2Tier = 1;
			w3Tier = 1;
			w4Tier = 1;
			humansTaken = 1000;
			chaosScore = 0;
			saveGame();
		}
		
		public function saveGame():void //SAVE THE GAME
		{
			saveData.data.world1Tier = w1Tier;
			saveData.data.world2Tier = w2Tier;
			saveData.data.world3Tier = w3Tier;
			saveData.data.world4Tier = w4Tier;
			saveData.data.totalHumans = humansTaken;
			saveData.data.chaos = chaosScore;
			saveData.flush();
		}
	}
	
}
