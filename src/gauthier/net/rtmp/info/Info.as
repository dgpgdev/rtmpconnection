package gauthier.net.rtmp.info
{
	/**
	 * Cette class nous sert a typer l'objet info de l'event NetStatusEvent. 
	 * @see flash.events.NetStatusEvent
	 * @copy flash.events.NetStatusEvent#info
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class Info
	{
		
		/**
		 * le niveau de l'information. status, error ou warning
		 * 
		 * @see flash.events.NetStatusEvent
		 */		 
		public var level:String;
		
		/**
		 * le code du status 
		 * @example "NetConnection.Connect.Success"
		 */		
		public var code:String;
		/**
		 * la description de l'erreur renvoyé par le server
		 */		
		public var description:String;
	
		
		/**
		 * un objet application qui contient la propriété message si elle est definit dans le script ssas lors d'un rejet de connection
		 * Il est preferable de recuperer le message par le biais de la propriété rejectReason.
		 * @example
		 * Coté server (fichier .asc)
		 * <pre class="prettyprint">
		 * var error = new Object();
		 * error.message = errorID;
		 * application.rejectConnection(client, error);
		 * </pre>
		 * 
		 * Coté client
		 * <pre class="prettyprint">
		 * nc= new RTMPConnection();
		 * nc.addEventListener(RTMPEvent.REJECTED, onRejected);
		 * 
		 * 
		 * function onRejected(e:RTMPEvent){
		 * trace(e.info.rejectReason)
		 * }
		 * </pre>
		 */		
		public var application:Object;
		
		/**
		 * l'objet contenant toute les information de la redirection
		 * */
		public var ex:Object;
		
		/**
		 * Constructeur
		 * 
		 * <p>
		 * nous passons un objet au contructeur, cet objet est l'objet info de l'evenement NetStatusEvent.
		 * </p>
		 * @param info
		 * 
		 */		
		public function Info(info:Object)
		{
			level = info.level;
			code = info.code;
			description = info.description;
			application= info.application;
			ex = info.ex;
		}
		/**
		 * Propriété qui nous permet de connaitre la raison du rejet de la connexion. 
		 * Si la raison n'est pas définit dans l'application, nous afficherons 
		 * alors la description de l'erreur.
		 * @return la raison du rejet de la connexion
		 * 
		 */		
		public function get rejectReason():String{
			if(application!=null){
				return application.message
			}
			return description;
		}
		
		/**
		 * Propriété qui nous permet de connaitre l'url de redirection en cas de rejet de la connexion. 
		 * Si la raison n'est pas définit dans l'application, nous afficherons 
		 * alors la description de l'erreur.
		 * @return l'url de redirection
		 * 
		 */	
		public function get redirectConnection():String{
			if(ex!=null){
				return ex.redirect;
			}
			return description;
		}
	}
}