package gauthier.net.rtmp
{
	import gauthier.net.rtmp.errors.AdminError;
	/**
	 * Class qui permet de gérer le login et le mot de passe pour les connexions en tant qu'administrateur
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class Admin
	{
		private var __isAdmin:Boolean=false;
		private var __login:String;
		private var __password:String;
		/**
		 * Constructeur  
		 */		
		public function Admin()
		{
		}
		
		/**
		 * Propriété qui definit si nous nous connectons en administrateur
		 * @return true si nous sommes nous desirons nous connecter en tant qu'administrateur, sinon false
		 * @default false
		 */		
		public function get admin():Boolean{
			return __isAdmin;
		}
		
		/**
		 * @private
		 * */
		public function set admin(Admin:Boolean):void{
			__isAdmin=Admin;
		}

		public function verifString(stringLabel:String,string:String):void{
			var reg:RegExp=new RegExp(" ","gi");
			if(reg.test(string)){
				throw new AdminError(stringLabel,"ne doit pas contenir d'espace vide");
			}
			if(string==null){
				throw new AdminError(stringLabel,"n'est aps definit");
			}
		}
	}
}