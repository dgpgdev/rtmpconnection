package gauthier.net.rtmp.config
{
	//--------------------------------------------------------------------------
    //
    //  IMPORT
    //
    //--------------------------------------------------------------------------
	
	import gauthier.net.rtmp.RTMPConnection;
	/**
	 * Class gerant un fichier de configuration en xml
	 * @author Gauthier de Girodon Pralong
	 */	

	public class XMLConfig implements IRTMPConfig
	{
		protected var _RTMPConnection:RTMPConnection;
		protected var _source:XML;
		/**
		 * Constructeur
		 * @param FMSConnection l'objet RTMPConnection
		 * 
		 */		
		public function XMLConfig(rtmp:RTMPConnection=null)
		{
			if(rtmp!=null){
				rtmpConnection=rtmp;
			}
		}
		/**
		 * Execute la configrutation sur l'objet RTMPConnection.
		 */		
		public function execute():void
		{
			verifValue("ip",_source.ip);
			verifValue("port",uint(Number(_source.port)));
			verifValue("protocol",_source.protocol);
			verifValue("application",_source.application);
			verifValue("maxAttempt",int(Number(_source.maxAttempt)));
			verifValue("delay",Number(_source.delay));
			verifValue("devKey",_source.devKey);
		}

		protected function verifValue(property:String,value:Object):void{
			if(_source.elements(property).length() > 0){
				_RTMPConnection[property]=value;
			}
		}
		/**
		 * @private 
		 */		
		public function set source(Data:*):void
		{
			_source=new XML(Data);
			execute();
		}
		/**
		 *  Les données recu pour la configuration. Les données sont transtypé en xml ici
		 * @param Data un object contenant les données
		 * @example
		 * voici le squelette d'un fichier de configuration type
		 * 
		 * <pre class="prettyprint">
		 *	&lt;config&gt;
		 *		&lt;ip&gt;localhost&lt;/ip&gt;
		 *		&lt;port&gt;1935&lt;/port&gt;
		 *		&lt;protocol&gt;rtmp&lt;/protocol&gt;
		 *		&lt;application&gt;test&lt;/application&gt;
		 *		
		 *		&lt;maxattempt&gt;5&lt;/maxattempt&gt;
		 *		&lt;delay&gt;1&lt;/delay&gt;
		 *		&lt;autoconnect&gt;true&lt;/autoconnect&gt;
		 *		
		 *		&lt;login&gt;monlogin&lt;/login&gt;
		 *		&lt;password&gt;monmotdepass&lt;/password&gt;
		 * 
		 *	&lt;/config&gt;
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
			_RTMPConnection=rtmp;
		}
		/**
		 * @copy RTMPConfigFactory#rtmpConnection
		 */		
		public function get rtmpConnection():RTMPConnection
		{
			return _RTMPConnection;
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