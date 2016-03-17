package gauthier.net.rtmp
{
	//--------------------------------------------------------------------------
    //
    //  IMPORT
    //
    //--------------------------------------------------------------------------
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.net.NetConnection;
	import flash.utils.Timer;
	
	import gauthier.net.rtmp.config.RTMPConfigFactory;
	import gauthier.net.rtmp.events.AttemptEvent;
	import gauthier.net.rtmp.events.BWEvent;
	import gauthier.net.rtmp.events.IRTMPEventManager;
	import gauthier.net.rtmp.events.RTMPEvent;
	import gauthier.net.rtmp.events.RTMPEventManager;
	import gauthier.net.rtmp.info.Attempt;
	import gauthier.net.rtmp.info.Bandwidth;
	import gauthier.net.rtmp.stream.RTMPStream;

	 //--------------------------------------------------------------------------
    //
    //  EVENT
    //
    //--------------------------------------------------------------------------
	/**
	 * Dispatch quand la connexion est reussit.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.SUCCESS
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="success", type="gauthier.net.rtmp.events.RTMPEvent")]

	/**
	 * Dispatch quand la connexion a échoué.
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 * @eventType gauthier.net.rtmp.events.RTMPEvent.FAILED
	 */
	[Event(name="failed", type="gauthier.net.rtmp.events.RTMPEvent")]


	/**
	 * Dispatch quand l'appel a la method a échoué.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.CALL_FAILED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="call_failed", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	/**
	 * Dispatch quand la connexion est rejeté.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.REJECTED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="rejected", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	/**
	 * Dispatch quand la connexion se ferme.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.CLOSED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="closed", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.SHUTDOWN
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="shutdown", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_CONNECT_FAILED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngc_failed", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_CONNECT_REJECTED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngc_reject", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_CONNECT_SUCCESS
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngc_success", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_CONNECT_FAILED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ng_notify", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_LOCALCOVERAGE_NOTIFY
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngm_publish", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_MULTICAST_UNPUBLISH
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngm_unpublish", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_NEIGHBOR_CONNECT
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngn_connect", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_NEIGHBOR_DISCONNECT
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngn_disconnect", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_POSTING_NOTIFY
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngp_notify", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_RREPLICATION_FETCH_FAILED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngrf_failed", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_CONNECT_FAILED
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngc_failed", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_REPLICATION_FETCH_RESULT
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngrf_result", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_REPLICATION_FETCH_NOTIFY
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngrf_notify", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_REPLICATION_REQUEST
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngr_request", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	/**
	 * Dispatch quand l'application est dechargé.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPEvent.NETGROUP_SENDTO_NOTIFY
	 * 
	 * @see gauthier.net.rtmp.events.RTMPEvent RTMPEvent
	 */
	[Event(name="ngs_notify", type="gauthier.net.rtmp.events.RTMPEvent")]
	
	
	
	/**
	 * Dispatch si l'autoconnect est declaré à chaque tentative de connexion.
	 * 
	 * @eventType	gauthier.net.rtmp.events.AttemptEvent.ATTEMPT
	 * 
	 * @see gauthier.net.rtmp.events.AttemptEvent AttemptEvent
	 */
	[Event(name="attempt", type="gauthier.net.rtmp.events.AttemptEvent")]
	
	/**
	 * Dispatch si l'autoconnect est declaré une fois le maximum de tentative atteint.
	 * 
	 * @eventType	gauthier.net.rtmp.events.AttemptEvent.ATTEMPT_END
	 * 
	 * @see gauthier.net.rtmp.events.AttemptEvent AttemptEvent
	 */
	[Event(name="attempt_end", type="gauthier.net.rtmp.events.AttemptEvent")]
	
	/**
	 * Dispatch lors d'une detection automatique de la bande passante.
	 * 
	 * @eventType	gauthier.net.rtmp.events.BWEvent.ON_BW
	 * 
	 * @see gauthier.net.rtmp.events.BWEvent BWEvent
	 */
	[Event(name="on_bw", type="gauthier.net.rtmp.events.BWEvent")]
	


	/**
	* Cette class etend la class NetConnection et permet une connexion simplifié 
	* au flash media server
	* 
	* @see flash.net.NetConnection
	* @author Gauthier de Girodon Pralong
	* @version 1.0
	*/
	public class RTMPConnection extends NetConnection
	{
	//--------------------------------------------------------------------------
    //
    //  IMPORT
    //
    //--------------------------------------------------------------------------
		private var __fmsprotocol:RTMPProtocol;
		private var __rtmpURI:RTMPUri;
		private var __rtmpEventManager:IRTMPEventManager;
		
		private var __maxAttempt:int=0;
		private var __currentCount:int=0;
		private var __timerConnect:Timer;
		
		private var __adminManager:Admin;
		private var __protocol:String;
	
		private var __config:RTMPConfigFactory;
		private var __clientParam:Array;
		 
		/**
		 * Constructeur
		 * Initialise l'objet RTMPConnection
		 * @param ip l'ip de connexion du flash media server
		 * @param applicationName le nom de l'application
		 * @param port le port de connexion du flash media server
		 * @param protocol le protocole a utiliser pour se connecter
		 * 
		 * @see #ip
		 * @see #application
		 * @see #port
		 * @see FlashMediaServerProtocol
		 */		 
		public function RTMPConnection(applicationName:String="", ip:String="localhost", port:uint=1935, protocol:String=RTMPProtocol.RTMP)
		{
			super();
			trace("test hahahahahaha");
			
			addEventListener(RTMPEvent.SUCCESS,onConnectFound);
			addEventListener(RTMPEvent.CLOSED,attemptConnect);
			__config= new RTMPConfigFactory(this);
			__clientParam= new Array();
			__rtmpURI= new RTMPUri();
			__rtmpURI.ip=ip;
			if(applicationName!=""){
				__rtmpURI.application = applicationName;
			}
			__rtmpURI.port=port;
			__protocol=protocol;
			__fmsprotocol= new RTMPProtocol();
			__adminManager= new Admin();
			__timerConnect= new Timer(1000,1);
			__timerConnect.addEventListener(TimerEvent.TIMER_COMPLETE, onTimeComplete);
			__rtmpEventManager= new RTMPEventManager();
			__rtmpEventManager.rtmpConnection=this;
		}
		
		
		/**
		 *	Methode qui permet de lancer la connection. 
		 * 
		 * @param login votre login d'administrateur
		 * @param password votre mot de passe d'administrateur
		 * 
		 * @see #application
		 * @see #ip
		 * @see #port
		 * 
		 * @example
		 * je tente de me connecter a l'application test, mon server fms en local
		 * <pre class="prettyprint">
		 * var fmsc:RTMPConnection= new RTMPConnection();
		 * fmsc.application="test";
		 * fmsc.connection();
		 * </pre>
		 * 
		 * 
		 * @example
		 * je me connect a mon server distant sur le port 8888;
		 * <pre class="prettyprint">
		 * var fmsc:RTMPConnection= new RTMPConnection("mon.server.com",8888);
		 * fmsc.port=8888;
		 * fmsc.application="test";
		 * fmsc.connection();
		 * </pre>
		 * 
		 * 
		 * @example
		 * je me connect en tant qu'administrateur à mon server distant sur le port 8888;
		 * <pre class="prettyprint">
		 * var fmsc:RTMPConnection= new RTMPConnection("mon.server.com");
		 * fmsc.connection("monlogin","monpassword");
		 * </pre>
		 * 
		 * 
		 */		
		public function connection(login:String=null, password:String=null):void{
			if(__config.configObject.source!=null){
				__config.execute();
				login = __config.configObject.login;
				password = __config.configObject.password;
			}
			if(login != null && password != null && login != "undefined" && password != "undefined"  && login.length > 0 && password.length > 0){
				createAdminMode(login,password);
			}else{
				if( __rtmpURI.application==null && devKey==null){
					throw new Error("Aucune Application n'est déclaré");
				}
			}
			createConnection();
			/* si on n'utilise pas l'auto connect on vide le tableau 
			 __clientParam pour eviter de stocker inutilement 
			des objets apres la connexion*/
			if(!autoConnect){
				__clientParam= new Array();
			}
		}
		/**
		 * @private
		 * Assigne la connexion en administrateur
		 * @param login
		 * @param password
		 * 
		 */		
		private function createAdminMode(login:String, password:String):void{
				__adminManager.verifString("Login",login);
				__adminManager.verifString("Password",password);
				__adminManager.admin=true;
				if(__rtmpURI.port==RTMPUri.DEFAULT_PORT){
					__rtmpURI.port=RTMPUri.DEFAULT_ADMIN_PORT;
				}
				__rtmpURI.application=RTMPUri.ADMIN_APPLICATION;
				__clientParam= new Array();
				addClientParam(login,password);
		}
		/**
		 * @private 
		 * crée la connection au flash media server 
		 */		
		private function createConnection():void{
			if(devKey){
				__protocol = RTMPProtocol.RTMFP;
			}
			var uriConnect:String=__protocol+"://"+__rtmpURI.URI;
			if(__clientParam.length!=0){
				var tmpArray:Array= new Array()
				tmpArray.push(uriConnect);
				launchConnection.apply(this,tmpArray.concat(__clientParam));
			}else {
				launchConnection(uriConnect);
			}
		}
		
		
		/**
		 * @private
		 * Appel la super method connect en lui passant les paramètre fournit dans la method
		 * @param rest
		 * 
		 */		
		private function launchConnection(...rest):void{
			super.connect.apply(super, rest);
		}
		
		
		/**
		 * Ajoute un ou plusieurs parametre a la connection.
		 * <p>
		 * Method qui ajoute un ou plusieurs parametres qui seront envoyé 
		 * 
		 * lors de la connection au flash media server ce ci remplace l'ancienne methode qui consisté a faire :
		 * <code class="prettyprint">
		 * 	var nc:NetConnection = new NetConnection();
		 * nc.connect("rtmp://localhost/test/",<strong>param 1</strong>,<strong>param 2</strong>,<strong>param 3</strong>,<strong>...</strong>);
		 * </code>
		 * </p>
		 * 
		 * @param parameters un ou plusieurs parametres
		 * @return null
		 * @example
		 * <pre class="prettyprint">
		 * var fmsc:RTMPConnection= new RTMPConnection();
		 * fmsc.addClientParam("what else",{login:"toto", mdp:"tata"},512);
		 * fmsc.addClientParam("helloworld");
		 * fmsc.connection("test");
		 * </pre>
		 */		
		 
		public function addClientParam(... parameters):void{
			for each(var element:Object in parameters){
				__clientParam.push(element);
			}
		}
		
		
		public function createNetStream():RTMPStream{
			
		var rtmpStream:RTMPStream = new RTMPStream(this);
		return rtmpStream;
		}
		
		
		/**
		 * Récupère un tableau contenant l'ensemble des paramètre a envoyer a l'application lors de la connexion
		 * @return un tableau d'objet;  
		 * */
		public function get params():Array{
			return __clientParam;
		}

		/**
		 * @private
		 * Appele une fois que le maximum de tentative de connection est atteint
		 * @param e TimerEvent 
		 * @see TimerEvent
		 * @see gauthier.net.rtmp.events.AttemptEvent.ATTEMPT_END
		 */		
		private function onTimeComplete(e:TimerEvent):void{
			__currentCount++;
			this.dispatchEvent(new AttemptEvent(AttemptEvent.ATTEMPT,createFMSAO()))
			createConnection()
		}
		/**
		 * @private
		 * crer un object FlashMediaServerAttemptObject a evenement AttemptEvent.ATTEMPT ou AttemptEvent.ATTEMPT_END
		 * @return un object FlashMediaServerAttemptObject
		 * @see gauthier.net.rtmp.infoobject.FlashMediaServerAttemptObject
		 */		
		private function createFMSAO():Attempt{
			var fmsao:Attempt= new Attempt(__currentCount,maxAttempt);
			return fmsao;
		}
		
		
		/**
		 * @private
		 * */
		
		private function onConnectFound(e:RTMPEvent):void{
				__timerConnect.stop();
				__currentCount=0;
		}
		
		/**
		 * @private
		 * method qui evalue si l'on doit oui ou non continuer a retenter une connection
		 * dispacth l'event AttemptEvent.ATTEMPT_END une fois le nombre 
		 * de tentative maximum atteint. Si entre temps la connection fut possible 
		 * on reinitialise le compteur de tentative a 0.
		 * */
		private function attemptConnect(e:RTMPEvent):void{
			if(__maxAttempt){
				if(__maxAttempt < 0){
					__timerConnect.start();
					return
				}else if(__maxAttempt > 0 && __currentCount<maxAttempt){
					__timerConnect.start();
					return
				}else{
					__timerConnect.stop();
					this.dispatchEvent(new AttemptEvent(AttemptEvent.ATTEMPT_END,createFMSAO()))
				}
			}
		}
		/**
		 * Method appele par le server lors d'une detection automatique, doit obligatoirement renvoyé un nombre
		 * @param rest
		 * @return 0
		 * @default 0
		 */		
		public function onBWCheck(... rest):Number {
	        return 0;
	    }
	     /**
	     * Method appele par l'objet client du server lors d'une detection automatique 
	     * de la bande passante.
	     * <p>
	     * Dispatch un event BWEvent. 
	     * 
	     * <strong>Attention</strong> 
	     * si vous definnissez un objet client a votre objet RTMPConnection 
	     * vous devrez definir les fonctions onBWDone et onBWCheck dans votre objet 
	     * client si vous desirez utiliser la detection automatique de la bande passante 
	     * </p>
	     * 
	     * @param rest la vitesse de la bande passante en bytes
	     * @see gauthier.net.rtmp.events.BWEvent BWEvent
	     */	    
	    public function onBWDone(... rest):void {
	        var bw:Number = 0;
	        var latency:Number = 0;
	        if (rest.length > 0){
	        	bw = rest[0];
	        } 
	        var bwObject:Bandwidth= new Bandwidth(bw)
	        bwObject.latency = rest[3];
	       this.dispatchEvent(new BWEvent(BWEvent.ON_BW,bwObject));
	    } 
	    
	    
	   	/**
	     * Detect la bande passante depuis le client
	     * 
	     * @param rest la vitesse de la bande passante en bytes
	     * @see gauthier.net.rtmp.events.BWEvent BWEvent
	     */	    
	    public function checkBandWidth():void {
	        this.call("checkBandwidth", null); 
	    } 
		/**
		 * Charge les données dans le configObject pour configurer la connexion
		 * @param configData
		 */		
		public function set configuration(configData:Object):void{
			__config.loadConfig(configData);
		}
		
		
		public function get configuration():Object{
			return __config.configObject;
		}
		/**
		 * permet de couper une connection même en mode autoconnect. 
		 * Cette methode doit etre appelé pour couper definitivement 
		 * la connection en mode AutoConnect.
		 */		
		public function closeByAction():void{
			__maxAttempt=0;
			close();
		}
		//--------------------------------------------------------------------------
	    //
	    //  GETTER / SETTER
	    //
	    //--------------------------------------------------------------------------
		/**
		 * @private 
		 */		
		public function set protocol(Protocol:String):void{
			if(Protocol!="" && Protocol!=" "){
				__protocol=Protocol;
			}else{
				__protocol=RTMPProtocol.RTMP;
			}
		}
		/**
		 * Protocol une chaine de caratere definissant le protocol a utilisé. Si vous utilisez Stratus vous devez editer cette class et surchargé cette propriété comme dans l'exemple
		 * @param 
		 * @example 
		 * <pre class="prettyprint">
		 * override public function get protocol():String{
		 *		return __protocol;
		 *	}
		 * </pre>
		 * @return Protocol une chaine de caratere definissant le protocol a utilisé
		 * 
		 */		
		/*public function get protocol():String{
			return __protocol;
		}*/
		
		/**
		 * un tableau contenant l'ensemble des paramètres que nous passerons 
		 * lors de la connexion au flash media server
		 * @return un tableau
		 */		
		public function get clientParameters():Array{
			return __clientParam;
		}
		
		/**
		 * @copy RTMPUri#ip
		 * @see RTMPUri
		 */		
		public function get ip():String{
			return __rtmpURI.ip;
		}
		/**
		 * @private
		 * */
		public function set ip(IP:String):void{
			if( __protocol == RTMPProtocol.RTMFP || IP!="" && IP!=" "){
				__rtmpURI.ip=IP;
			}else{
				__rtmpURI.ip=RTMPUri.DEFAULT_IP;
			}
			
		}
		
		/**
		 * @copy RTMPUri#application
		 * @see RTMPUri
		 */		
		public function get application():String{
			return __rtmpURI.application;
		}
		/**
		 * @private
		 * */
		public function set application(Application:String):void{
			__rtmpURI.application=Application;
		}
		
		/**
		 * @copy RTMPUri#devKey
		 * @see RTMPUri
		 */		
		public function get devKey():String{
			return __rtmpURI.devKey;
		}
		/**
		 * @private
		 * */
		public function set devKey(dk:String):void{
			__rtmpURI.devKey = dk;
		}
		
		/**
		 * @copy RTMPUri#port
		 * @see RTMPUri
		 */		
		
		public function get port():uint{
			return __rtmpURI.port;
		}
		/**
		 * @private
		 * */
		public function set port(Port:uint):void{
			__rtmpURI.port=Port;
		}
		
		/**
		 * assigne un object RTMPUri à la connexion, 
		 * si vous ne specifié d'objet RTMPUri
		 * il sera crée automatiquement lors de la création
		 * 
		 * @param FmsUri
		 * @default null
		 * @see RTMPUri
		 */		
		public function get rtmpURI():RTMPUri{
			return __rtmpURI;
		}
		/**
		 * @private
		 * */
		public function set rtmpURI(FmsUri:RTMPUri):void{
			__rtmpURI=FmsUri;
		}

		/**
		 * Definit si l'on doit se reconnecter des que l'on detect une deconnection.
		 * <strong>ATTENTION :</strong>si vous désirez couper une connection volontairement, alors que la connexion est en autoConnect, vous devez appeler la methode closeByAction lors d'un appel a la methode close() directement. Sinon votre connection tentera de se reconnecter a nouveau.
		 * @param autoconnect
		 * @default false
		 * @see #closeByAction
		 */	
		 public function get autoConnect():Boolean{
			return __maxAttempt!=0;
		 }
		
		/**
		 * Definit le temps en secondes entre le retour du netstatus et l'appel à la connection
		 * @param value 
		 * @default 1 secondes
		 */		
		public function get delay():Number{
			return __timerConnect.delay;
		}
		/**
		 * @private
		 * */
		public function set delay(value:Number):void{
			if(value){
				 __timerConnect.delay=(value*1000);
			}
		}
		
		/**
		 * Le nombre maximum de tentative de reconnexion. si maxAttempt est definit sur -1 on tente de se connecter indefiniment jusqu'a ce que la connexion soit reussit. La connexion sera en mode autoConnect;
		 * @param value
		 * @default 3
		 */	
		 public function get maxAttempt():int{
			return __maxAttempt;
		 }
		 /**
		 * @private
		 * */
		public function set maxAttempt(value:int):void{
			__maxAttempt=value;
			__currentCount=0;
		}
		
		/**
		 * @copy Admin#admin
		 * @see Admin
		 */		
		 public function get adminMode():Boolean{
			return __adminManager.admin;
		 }
		
	
		/**
		 * Propriété contenant notre objet IRTMPEventManager. Nous permet d'assigner un IRTMPEventManager différent si nous le désirons.
		 * @param rtmpEventManager
		 * @example
		 * <pre class="prettyprint">
		 * package 
		 * {
		 * import flash.events.NetStatusEvent;
		 *		
		 *		import gauthier.net.rtmp.RTMPConnection;
		 *		import gauthier.net.rtmp.events.IRTMPEventManager;
		 * 
		 *		public class MyFMSEventManager implements IRTMPEventManager
		 *		{
		 *			private var __maConnexion:RTMPConnection
		 *			public function MyFMSEventManager()
		 *		{
		 *			}
		 *			public function onStatus(e:NetStatusEvent):void
		 *			{
		 *				//appel la method status sur le client de mon objet RTMPConnection
		 *				__maConnexion.client.status();
		 *			}
		 *			
		 *			public function set rtmpConnection(FMSC:RTMPConnection):void
		 *			{
		 *				if(__maConnexion!=null && __maConnexion.hasEventListener(NetStatusEvent.NET_STATUS)){
		 *					__maConnexion.removeEventListener(NetStatusEvent.NET_STATUS, onStatus);
		 *				}
		 *				__maConnexion=FMSC;
		 *				__maConnexion.addEventListener(NetStatusEvent.NET_STATUS, onStatus);
		 *				__maConnexion=FMSC;
		 *			}
		 *			
		 * 			public function get rtmpConnection():RTMPConnection
		 *			{
		 *				return __maConnexion;
		 *			}
		 *			
		 *		}
		 *	}
		 * </pre>
		 * 
		 * 
		 * 
		 * @example Implémentation 
		 * <pre class="prettyprint">
		 *  import gauthier.net.rtmp.RTMPConnection;
		 * 
		 *  var nc:RTMPConnection= new RTMPConnection();
		 * 
		 *  var monEventManager:MyFMSEventManager=new MyFMSEventManager();
		 * //assignation de mon eventmanager personnalisé a la connection;
		 *  nc.rtmpEventManager=monEventManager;
		 * 
		 * //declaration du client de la connection
		 *  nc.client=this;
		 *  nc.application="test/moninstance";
		 *  nc.connection();
		 * 
		 * //cette method sera appele a chaque fois que onStatus sera appele dans la class MyFMSEventManager
		 * function status(){
		 * 	trace("method appele par mon eventmanager personnalisé");
		 * }
		 * 
		 * </pre>
		 * @see gauthier.net.rtmp.events.IRTMPEventManager IRTMPEventManager
		 */		
		public function get rtmpEventManager():IRTMPEventManager{
			return __rtmpEventManager;
		}
		/**
		 * @private
		 * */
		public function set rtmpEventManager(rtmpEventManager:IRTMPEventManager):void{
     		 this.removeEventListener(NetStatusEvent.NET_STATUS, __rtmpEventManager.onStatus)
			__rtmpEventManager = rtmpEventManager;
			__rtmpEventManager.rtmpConnection=this;
			
		}
		/**
		 * @private
		 */		
		public function set configType(type:String):void{
			__config.configType=type;
			if(__config.rtmpConnection==null){
				__config.rtmpConnection=this;
			}
		}
		/**
		 * @copy gauthier.net.rtmp.config.FMSConfigFactory#configType 
		 * @see gauthier.net.rtmp.config.FMSConfigFactory FMSConfigFactory
		 */	 
		public function get configType():String{
			return __config.configType;
		}
		
		
		/**
		 * @return true au server pour lui signifier que l'utilisateur est toujours connecté
		 */	 
		public function keepAliveConnection():Boolean{
			return true;
		}
	}
}
