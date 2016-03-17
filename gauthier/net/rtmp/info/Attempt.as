package gauthier.net.rtmp.info
{
	/**
	 * Un objet qui stock les information necessaire lors d'un tentative de reconnexion.
	 * @author gauthier de Girodon Pralong
	 * 
	 */	
	public class Attempt
	{
		/**
		 * Nombre maximum de tentative de reconnexion 
		 */		
		public var countMAX:int;
		/**
		 * Permet de savoir combien de fois une tentative de reconnexion a été appelé
		 */		
		public var currentCount:int;
		/**
		 * 
		 * @param CurrentCount le nombre de tentative de reconnexion 
		 * @param CountMAX le nombre maximum de reconnexion
		 * 
		 */		
		public function Attempt(CurrentCount:int, CountMAX:int)
		{
			currentCount=CurrentCount;
			countMAX=CountMAX;
		}

	}
}