package gauthier.net.rtmp.config
{
	
	import gauthier.net.rtmp.RTMPConnection;
	
	/**
	 * Classe permettant la configuration de la connection depuis un JSON.
	 * cette class utilise la librairie as3corlib
	 * 
	 * @author Gauthier de Girodon Pralong
	 * @see http://code.google.com/p/as3corelib/ as3corlib repository
	 */	
	public class JSONConfig implements IRTMPConfig
	{
		protected var _rtmpConnection:RTMPConnection;
		protected var _source:Object;
		/**
		 * Constructeur
		 * @param FMSConnection l'objet FlashMediaServerConnection
		 * 
		 */		
		public function JSONConfig(rtmp:RTMPConnection=null)
		{
			if(rtmpConnection!=null){
				rtmpConnection=rtmp;
			}
		}
		/**
		 * Execute la configrutation sur l'objet FlashMediaServerConnection.
		 */		
		public function execute():void
		{
			verifValue("ip",_source.ip);
			verifValue("port",uint(_source.port));
			verifValue("protocol",_source.protocol);
			verifValue("application",_source.application);
			verifValue("maxAttempt",int(_source.maxattempt));
			verifValue("delay",_source.delay);
			verifValue("devKey",_source.devkey);
		}
		/**
		 * @private 
		 * verifie si les données ne sont pas vide, les assignent si valide
		 * @param property
		 * @param value
		 * 
		 */		
		protected function verifValue(property:String,value:Object):void{
			if(value!=null){
				_rtmpConnection[property]=value;
			} 
		}
		/**
		 * @private
		 * */
		public function set source(Data:*):void
		{
			
		
			_source= JSON.parse(String(Data));
		}
		/**
		 *  Les données recu pour la configuration. Les données sont transtypé en JSON ici
		 * @param Data un object contenant les données
		 * @example
		 * voici le squelette d'un fichier de configuration type JSON
		 * 
		 * <pre class="prettyprint">
		 *	{ 
		 *	"ip" : "localhost",
		 *	"port" : 1935,
		 *	"protocol" : "rtmp",
		 *	"application" : "test",
		 *	"maxattempt"  : 5,
		 *	"delay" : 1,
		 *	"autoconnect" : true,
		 *	"login" : "monlogin",
		 *	"password" : "monmotdepass",
		 *	"adminport" : 1111,
		 *	"tunnelingport" : 80
		 *	}
		 * </pre>
		 */		
		public function get source():*
		{
			return _source;
		}
		
		/**
		 * @private
		 * @param rtmp
		 */		
		public function set rtmpConnection(rtmp:RTMPConnection):void
		{
			_rtmpConnection=rtmp;
		}
		/**
		 * @copy RTMPConfigFactory#rtmpConnection
		 */		
		public function get rtmpConnection():RTMPConnection
		{
			return _rtmpConnection;
		}
		/**
		 * Recupère le login de la source pour une connection en tant qu'administrateur 
		 * @return
		 */		
		public function get login():String{
			return String(_source.login);
		}
		/**
		 * Recupère le mot de passe de la source pour une connection en tant qu'administrateur 
		 * @return
		 */	
		public function get password():String{
			return String(_source.password);
		}
	}
}