package  {
	
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.URLVariables;
	
	public class navyGamesButton extends SimpleButton 
	{
		
		public function muteButton()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		function onAddedToStage(event:Event):void
		{
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		function onRemovedFromStage(event:Event):void
		{
			removeEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		function onMouseClick(event:MouseEvent):void
		{
			navigateToURL(new URLRequest("http://navygames.org/"), "_blank");
		}
	}
	
}