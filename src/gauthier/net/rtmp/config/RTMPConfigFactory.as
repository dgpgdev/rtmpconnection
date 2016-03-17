package gauthier.net.rtmp.config
{
	import gauthier.net.rtmp.RTMPConnection;
	/**
	 * Cette class nous permet d'assigner un objet IFMSConfig selon son type. Par défaut
	 * @author Gauthier de Girodon Pralong
	 */	
	public class RTMPConfigFactory
	{
	
		private var __configType:String=RTMPConfigType.XML;
		private var __configobject:IRTMPConfig;
		private var __rtmpConnection:RTMPConnection;
		/**
		 * Constructeur 
		 */		
		public function RTMPConfigFactory(rtmp:RTMPConnection)
		{
			__rtmpConnection=rtmp;
			createConfigObject();
		}
		/**
		 * @private 
		 */		
		public function set configType(type:String):void
		{
			__configType=type;
			createConfigObject();
		}
		/**
		 * Une chaine de caratere specifiant le type de donnée que l'on veut assigner comme configuration de la connexion
		 * @param type 
		 * @return 
		 */
		public function get configType():String
		{
			return __configType;
		}
		/**
		 * Envoi les données pour parser la configuration
		 * @param data les données à assigner
		 * 
		 */		
		public function loadConfig(data:*):void{
			__configobject.source=data;
		}
		/**
		 * @private 
		 * crée l'objet IFMSConfig
		 */		
		private function createConfigObject():void{
			switch(configType){	
				case RTMPConfigType.JSON :
					__configobject= new JSONConfig(__rtmpConnection);
				break
				default :
					__configobject= new XMLConfig(__rtmpConnection);
				break;
			}
		}
		/**
		 * récupère l'objet de configuration crée lors de l'assignation de son type
		 * @return un objet de configuration
		 * @see XMLConfig
		 * @see JSONConfig
		 */		
		public function get configObject():IRTMPConfig
		{
			return __configobject;
		}
		
		public function get configuration():Object{
			return  __configobject.source;
		}
		
		
		
		
		public function execute():void{
			__configobject.execute();
		}
		/**
		 * nous permet d'assigner par la suite un objet 
		 * @param FMSConnection
		 */		
		public function set rtmpConnection(rtmp:RTMPConnection):void
		{
			__rtmpConnection=rtmp;
		}
		/**
		 * Assigne un objet RTMPConnection
		 * @param rtmp un objet RTMPConnection
		 * return un objet RTMPConnection
		 */		
		public function get rtmpConnection():RTMPConnection
		{
			return __rtmpConnection;
		}
		
	}
}