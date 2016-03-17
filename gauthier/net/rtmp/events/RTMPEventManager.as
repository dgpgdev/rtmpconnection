package gauthier.net.rtmp.events
{
	import flash.events.NetStatusEvent;
	import flash.net.Responder;
	
	import gauthier.net.rtmp.RTMPConnection;
	import gauthier.net.rtmp.info.Info;
	
	/**
	 * Cette class nous permet d'isoler les évènements renvoyé par le server a l'objet FlashMediaServerConnection.
	 * Nous pouvons étendre cette class ou en créer une completement différente du moment que cette dernière implemente l'interface
	 * IFMSEventManager.
	 * 
	 * @author Gauthier de Girodon Pralong
	 * @see gauthier.net.rtmp.FlashMediaServerConnection FlashMediaServerConnection
	 */	
	public class RTMPEventManager implements IRTMPEventManager
	{
		
		private var _RTMPC:RTMPConnection;
		public function RTMPEventManager(){}
		
		/**
		 * @private
		 * */
		public function set rtmpConnection(RTMPC:RTMPConnection):void{
			if(_RTMPC!=null && _RTMPC.hasEventListener(NetStatusEvent.NET_STATUS)){
				_RTMPC.removeEventListener(NetStatusEvent.NET_STATUS, onStatus);
			}
			_RTMPC=RTMPC;
			_RTMPC.addEventListener(NetStatusEvent.NET_STATUS, onStatus);
		}
		/**
		 * @copy IFMSEventManager#flashMediaServerConnection
		 * */
		public function get rtmpConnection():RTMPConnection{
			return _RTMPC;
		}
		/**
		 * @copy IFMSEventManager#onStatus
		 * */
		public function onStatus(e:NetStatusEvent):void{
			var infoObject:Info= new Info(e.info);
			trace(e.info.code)
			switch(infoObject.code){
				case "NetConnection.Call.Failed":
					_RTMPC.dispatchEvent(new RTMPEvent(RTMPEvent.CALL_FAILED,infoObject));
				break;
				case "NetConnection.Connect.Closed":
					_RTMPC.dispatchEvent(new RTMPEvent(RTMPEvent.CLOSED,infoObject));
				break;
				case "NetConnection.Connect.Failed":
					_RTMPC.dispatchEvent(new RTMPEvent(RTMPEvent.FAILED,infoObject));
				break;
				case "NetConnection.Connect.Rejected":
					_RTMPC.dispatchEvent(new RTMPEvent(RTMPEvent.REJECTED,infoObject));
				break;
				case "NetConnection.Connect.AppShutdown":
					_RTMPC.dispatchEvent(new RTMPEvent(RTMPEvent.SHUTDOWN,infoObject));
				break;
				case "NetConnection.Connect.Success":
					_RTMPC.dispatchEvent(new RTMPEvent(RTMPEvent.SUCCESS,infoObject));
				break
			}
		}
	}
}