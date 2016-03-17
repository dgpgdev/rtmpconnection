package gauthier.net.rtmp.errors
{
	/**
	 * <p>Représente une erreur en tant qu'administrateur. Cette erreur est renvoyé soit :
	 * <li>Quand on se connect en administrateur sans definir un login et un mot de passe</li>
	 * <li>Quand on se connect en administrateur et que le login ou le mot de passe contiennent un espace vide</li></p>
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class AdminError extends Error
	{
		/**
		 * le champ qui pose probleme 
		 */		
		public var stringError:String;
		/**
		 * Constructeur
		 * @param stringError le champs qui pose problème (login ou mot de passe)
		 * @param message le message d'erreur
		 * @param id le numero d'erreur
		 * 
		 */		
		public function AdminError(stringError:String="",message:String="", id:int=0)
		{
			super(stringError+" "+message, id);
			this.stringError=stringError;
		}
		
	}
}