package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import aloha.so.handsome.cards;
	
	public class Main extends Sprite 
	{
		var card = new CardDeck();
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
	}
	
}