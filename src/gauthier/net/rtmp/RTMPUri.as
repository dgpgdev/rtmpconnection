package gauthier.net.rtmp
{
	/**
	 * Cette class nous permet de formater l'uri de connexion
	 * @author Gauthier de Girodon Pralong
	 */
	public class RTMPUri
	{
		/**
		 *Constanste qui definit le nom de l'application admin 
		 */		
		public static const DEFAULT_IP:String="localhost";
		public static const DEFAULT_STRATUS_IP:String="p2p.rtmfp.net";
		public static const ADMIN_APPLICATION:String="admin";
		public static const DEFAULT_PORT:uint=1935;
		public static const DEFAULT_ADMIN_PORT:uint=1111;
		
		
		private var __ip:String=RTMPUri.DEFAULT_IP;
		private var __port:uint=RTMPUri.DEFAULT_PORT;
		private var __application:String;
		private var __edgeArray:Array;
		private var __origin:String;
		private var __devKey:String;
		
		
		
		public function RTMPUri()
		{
			
		}
		/**
		 * @private
		 * */
		public function set ip(IP:String):void{
			__ip=IP;
		}
		/**
		* Définit l'ip de connexion
		* @param IP
		* @default localhost
		* */
		public function get ip():String{
			return __ip;
		}
		/**
		 * @private
		 * */
		public function set port(Port:uint):void{
				__port=Port;
		}
		/**
		 * Définit le port de connexion
		 * @param Port
		 * @default 1935
		 * @see RTMPUri
		 */		
		public function get port():uint{
			return __port;
		}
		/**
		 * @private
		 * */
		public function set application(applicationName:String):void{
			__application=applicationName;
		}
		 /**
		 * Définit le nom de l'application server sur laquelle vous voulez vous connecter.
		 * @param Application
		 * @default null
		 */		
		public function get application():String{
			return __application;
		}
		/**
		 * Retourne la chaine de caratere composant l'uri de connexion sans le protocol.
		 * @return une chaine de caratere de type 127.0.0.1:1935/monapplication
		 */		
		public function get URI():String{
			var uri:String;
			if(__devKey){
				if(__ip == RTMPUri.DEFAULT_IP){
					__ip = RTMPUri.DEFAULT_STRATUS_IP;
				}
				uri = __ip+"/"+__devKey;
			} else{
				if(__port != RTMPUri.DEFAULT_PORT && __port !=0 ){
					uri =__ip+":"+__port.toString()+"/"+__application;
				}else{
					uri =__ip+"/"+__application;
				}
			}
			
			return uri;
		}
		
		
		public function set devKey(dk:String):void{
			__devKey = dk;
		}
		/**
		 * Définit la clé permettant de se connecter au service Stratus (en Béta)
		 * @return une chaine de caratère constituant la clé de dev pour l'identification au service stratus
		 * 
		 */		 
		public function get devKey():String{
			return __devKey;
		}
	}
}