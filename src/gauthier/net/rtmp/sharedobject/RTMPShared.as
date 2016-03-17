package gauthier.net.rtmp.sharedobject
{
	import flash.events.EventDispatcher;
	import flash.events.SyncEvent;
	import flash.net.NetConnection;
	import flash.net.SharedObject;
	
	import gauthier.net.rtmp.events.SharedEvent;
	
	 //--------------------------------------------------------------------------
    //
    //  EVENT
    //
    //--------------------------------------------------------------------------
	/**
	 * Dispatch quand la connexion est reussit.
	 * 
	 * @eventType	gauthier.net.rtmp.events.SharedEvent.SYNCHRONIZED
	 * 
	 * @see gauthier.net.rtmp.events.SharedEvent SharedEvent
	 */
	[Event(name="synchronized", type="gauthier.net.rtmp.events.SharedEvent")]
	
	/**
	 * Dispatch quand la connexion est reussit.
	 * 
	 * @eventType	gauthier.net.rtmp.events.SharedEvent.UPDATE
	 * 
	 * @see gauthier.net.rtmp.events.SharedEvent SharedEvent
	 */
	[Event(name="update", type="gauthier.net.rtmp.events.SharedEvent")]
	
	/**
	 * Dispatch quand la connexion est reussit.
	 * 
	 * @eventType	gauthier.net.rtmp.events.SharedEvent.ADD
	 * 
	 * @see gauthier.net.rtmp.events.SharedEvent SharedEvent
	 */
	[Event(name="add", type="gauthier.net.rtmp.events.SharedEvent")]
	
	/**
	 * Dispatch quand la connexion est reussit.
	 * 
	 * @eventType	gauthier.net.rtmp.events.SharedEvent.DELETE
	 * 
	 * @see gauthier.net.rtmp.events.SharedEvent SharedEvent
	 */
	[Event(name="delete", type="gauthier.net.rtmp.events.SharedEvent")]
	
	/**
	 * Class qui implemente un sharedObject, permet d'ecouter les events 
	 * de synchronisation beaucoup plus facilement.
	 * 
	 * 
	 * @author Gauthier de Girodon Pralong
	 * 
	 */
	
	
	public class RTMPShared extends EventDispatcher
	{
		protected var _shared:SharedObject;
		protected var _synchronised:Boolean=false;
		protected var _rtmpConnection:NetConnection;
		protected var _secure:Boolean;
		protected var _uri:String;
		protected var _name:String;
		protected var _persistence:Boolean;
		protected var _mode:String = RTMPSharedMode.REMOTE;
		protected var _data:Object;
		protected var _client:Object;
		protected var _connected:Boolean=false;
		
		public function RTMPShared()
		{
		}
		
		/**
		 * le mode actuel du sharedObject 
		 * @return une chaine de caractére
		 * 
		 * @see gauthier.net.rtmp.sharedobject.RTMPSharedMode RTMPSharedMode
		 * 
		 */		
		public function get mode():String{
			return _mode;
		}
		
		public function set mode(m:String):void{
			_mode = m;
		}
		
		
		/**
		 * definit le client du sharedobject 
		 * @param c
		 * 
		 */		
		public function set client(c:Object):void{
			_client = c;
		}
		
		public function get client():Object{
			return _shared.client;
		}
		/**
		 * Retourne le shared object  
		 * @return 
		 * 
		 */		
		public function get sharedObject():SharedObject {
			return _shared;
		}

		public function set sharedObject(o:SharedObject):void {
			if(_shared){
				_shared.removeEventListener(SyncEvent.SYNC, SyncHandler);
			}
			_shared = o;
			_shared.addEventListener(SyncEvent.SYNC, SyncHandler);
		}
		/**
		 * Dispatch un event  SharedEvent. si le client vient de se connecter au sharedobject alors il reçois l'event 
		 * SharedEvent.SYNCHRONIZED, la propriété data de l'objet SharedEvent retourne l'ensemble des données contenu dans le sharedobject.
		 * 
		 * SharedEvent.ADD est dispatcher si une nouvelle valeur est ajouté au sharedobject, la propriété data de l'objet SharedEvent 
		 * contient l'objet qui vient d'etre ajouté au SharedObject.
		 * 
		 * SharedEvent.UPDATE est dispatcher si une valeur du SharedObject est modifié, la propriété data de l'objet SharedEvent 
		 * contient l'objet qui vient d'etre modifiéé au SharedObject
		 *
		 * SharedEvent.DELETE est dispatcher si une valeur du SharedObject est effacé, la propriété data de l'objet SharedEvent 
		 * contient l'id  de la valeur qui vient d'etre supprimé du SharedObject
		 * 
		 * @param e
		 * 
		 */		
		protected function SyncHandler(e:SyncEvent):void{
			if(_synchronised){
				for each (var o:Object in e.changeList){
					switch(o.code){
						case "change" : 
							if(o.oldValue){
								dispatchEvent(new SharedEvent(SharedEvent.UPDATE, _shared.data[o.name]));
							}else{
								dispatchEvent(new SharedEvent(SharedEvent.ADD, _shared.data[o.name]));
							}
						break;
						case "delete" :
							dispatchEvent(new SharedEvent(SharedEvent.DELETE, o.name));
						break;
						case "success" :
							dispatchEvent(new SharedEvent(SharedEvent.UPDATE, o.name));
						break;
					}
				}
			}else{
				_synchronised=true;
				_connected = true;
				dispatchEvent(new SharedEvent(SharedEvent.SYNCHRONIZED, (e.target as SharedObject).data));
			}
		}
		/**
		 * Renvois si true si le shared object a bien était syncrochnisé et connecté
		 * @return true ou false
		 * 
		 */		
		public function get connected():Boolean{
			return _connected;
		}
		
		/**
		 * definit la connection du sharedobject
		 * @return 
		 * 
		 */		
		public function get rtmpConnection():NetConnection {
			return _rtmpConnection;
		}
		
		/**
		 * @private
		 * 
		 */		
		public function set rtmpConnection(o:NetConnection):void {
			_rtmpConnection = o;
		}
		public function get secure():Boolean {
			return _secure;
		}

		public function set secure(o:Boolean):void {
			_secure = o;
		}
		public function get uri():String {
			return _uri;
		}

		public function set uri(o:String):void {
			_uri = o;
		}

		public function get name():String {
			return _name;
		}

		public function set name(o:String):void {
			_name = o;
		}

		public function get persistence():Boolean {
			return _persistence;
		}

		public function set persistence(o:Boolean):void {
			_persistence = o;
		}
		public function get data():Object {
			return sharedObject.data;
		}
		/**
		 * Créer la connexion du SharedObject 
		 * 
		 */		
		public function connection():void{
			if(name == null){
				throw new Error("no SharedObject Name found");
			}
			switch(mode){
				case RTMPSharedMode.LOCAL : 
					 sharedObject = SharedObject.getLocal(name,uri,secure);
				break;
				case RTMPSharedMode.REMOTE : 
					if(rtmpConnection == null){
						throw new Error("no NetConnection found");
					}
					_synchronised = false;
					sharedObject = SharedObject.getRemote(name,_rtmpConnection.uri, persistence,secure);
					sharedObject.client = _client;
					sharedObject.connect(_rtmpConnection);
				break;
			}
		}
		
		
		public function send(func:String, ...param):void{
			var tmp:Array = new Array(func);
			tmp = tmp.concat(param);
			sharedObject.send.apply(sharedObject,tmp);
		}
		
		public function close():void{
			_connected = false;
			_synchronised = false;
			if(sharedObject){
				sharedObject.close();
			}
		}

	}
}