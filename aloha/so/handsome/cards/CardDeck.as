package aloha.so.handsome.cards
{
	import flash.display.MovieClip;

	public class CardDeck extends MovieClip
	{
		public var allCards:Array = new Array();
		var cardNames:Array;
		var cardValues:Array;
		var gameType:String;
		var drawnCards:uint = 0;
		
		public function CardDeck(game:String)
		{
			gameType = game;
			cardNames = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"];
			if(gameType == "blackjack")
			{
				cardValues = [1,2,3,4,5,6,7,8,9,10,10,10,10];
			}
			makeSuit("Spade");
			makeSuit("Diamond");
			makeSuit("Heart");
			makeSuit("Club");
		}
		
		private function makeSuit(suitString:String):void
		{
			var suit:Array = new Array();
			
			for(var i:uint = 0; i < cardNames.length; i++)
			{
				suit[i] = new Object();
				suit[i].cardType = suitString;
				suit[i].cardName = cardNames[i];
				suit[i].cardValue = cardValues[i];
				suit[i].isDrawn = false;
				allCards.push(suit[i]);
			}
		}
		
		public function shuffle():Array
		{
			var shuffled_ary:Array = new Array();
			var randomCard:Object;
			
			do
			{
				randomCard = allCards[getRandomIndex()];
				if(shuffled_ary.indexOf(randomCard) == -1)
				{
					shuffled_ary.push(randomCard);
				}
			} while(shuffled_ary.length < allCards.length);
			return shuffled_ary;
		}
		
		private function getRandomIndex():int
		{
			return Math.floor(Math.random() * allCards.length);
		}
		
		public function drawCard():Object
		{
			var randomIndex:int;
			while(allCards[randomIndex].isDrawn && drawnCards < allCards.length)
			{
				randomIndex = getRandomIndex();
			}
			if(allCards[randomIndex].isDrawn)
			{
				return new Object();
			}
			else
			{
				allCards[randomIndex].isDrawn = true;
				drawnCards++;
				return allCards[randomIndex];
			}
		}
	}
}