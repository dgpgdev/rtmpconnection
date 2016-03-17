package gauthier.net.rtmp.events
{
	import flash.events.NetStatusEvent;
	import flash.net.Responder;
	
	import gauthier.net.rtmp.RTMPConnection;
	import gauthier.net.rtmp.info.Info;
	
	/**
	 * Cette class nous permet d'isoler les évènements renvoyé par le server a l'objet RTMPConnection.
	 * Nous pouvons étendre cette class ou en créer une completement différente du moment que cette dernière implemente l'interface
	 * IFMSEventManager.
	 * 
	 * @author Gauthier de Girodon Pralong
	 * @see gauthier.net.rtmp.RTMPConnection RTMPConnection
	 */	
	public class RTMPEventManager implements IRTMPEventManager
	{
		
		private var _fmsc:RTMPConnection;
		public function RTMPEventManager(){}
		
		/**
		 * @private
		 * */
		public function set rtmpConnection(FMSC:RTMPConnection):void{
			if(_fmsc!=null && _fmsc.hasEventListener(NetStatusEvent.NET_STATUS)){
				_fmsc.removeEventListener(NetStatusEvent.NET_STATUS, onStatus);
			}
			_fmsc=FMSC;
			_fmsc.addEventListener(NetStatusEvent.NET_STATUS, onStatus);
		}
		/**
		 * @copy IRTMPEventManager#rtmpConnection
		 * */
		public function get rtmpConnection():RTMPConnection{
			return _fmsc;
		}
		/**
		 * @copy IRTMPEventManager#onStatus
		 * */
		public function onStatus(e:NetStatusEvent):void{
			var infoObject:Info= new Info(e.info);
			switch(infoObject.code){
				case "NetConnection.Call.Failed":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.CALL_FAILED,infoObject));
				break;
				case "NetConnection.Connect.Closed":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.CLOSED,infoObject));
				break;
				case "NetConnection.Connect.Failed":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.FAILED,infoObject));
				break;
				case "NetConnection.Connect.Rejected":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.REJECTED,infoObject));
				break;
				case "NetConnection.Connect.AppShutdown":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.SHUTDOWN,infoObject));
				break;
				case "NetConnection.Connect.Success":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.SUCCESS,infoObject));
				break;
				//------------------------------------------------------------------
				// NETGROUP INFO
				//------------------------------------------------------------------
				case "NetGroup.Connect.Failed":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_CONNECT_FAILED,infoObject));
					break;
				case "NetGroup.Connect.Rejected":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_CONNECT_REJECTED,infoObject));
					break;
				case "NetGroup.Connect.Success":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_CONNECT_SUCCESS,infoObject));
					break;
				case "NetGroup.LocalCoverage.Notify":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_LOCALCOVERAGE_NOTIFY,infoObject));
					break;
				case "NetGroup.MulticastStream.PublishNotify":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_MULTICAST_PUBLISH,infoObject));
					break;
				case "NetGroup.MulticastStream.UnpublishNotify":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_MULTICAST_UNPUBLISH,infoObject));
					break;
				case "NetGroup.Neighbor.Connect":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_NEIGHBOR_CONNECT,infoObject));
					break;
				case "NetGroup.Neighbor.Disconnect":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_NEIGHBOR_DISCONNECT,infoObject));
					break;
				case "NetGroup.Posting.Notify":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_POSTING_NOTIFY,infoObject));
					break;
				case "NetGroup.Replication.Fetch.Failed":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_REPLICATION_FETCH_FAILED,infoObject));
					break;
				case "NetGroup.Replication.Fetch.Result":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_REPLICATION_FETCH_RESULT,infoObject));
					break;
				case "NetGroup.Replication.Fetch.SendNotify":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_REPLICATION_FETCH_NOTIFY,infoObject));
					break;
				case "NetGroup.Replication.Request":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_REPLICATION_REQUEST,infoObject));
					break;
				case "NetGroup.SendTo.Notify":
					_fmsc.dispatchEvent(new RTMPEvent(RTMPEvent.NETGROUP_SENDTO_NOTIFY,infoObject));
					break;
			}
		}
	}
}