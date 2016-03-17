package gauthier.net.rtmp.stream
{
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import gauthier.net.rtmp.events.RTMPStreamEvent;
	import gauthier.net.rtmp.info.MetaDataObject;
	
	/**
	 * Dispatch quand le rtmpstream reçoit les info metadata du flux.
	 * 
	 * @eventType	gauthier.net.rtmp.events.RTMPStreamEvent.ON_METADATA
	 * 
	 * @see gauthier.net.rtmp.events.RTMPStreamEvent RTMPStreamEvent
	 */
	[Event(name="on_metadata", type="gauthier.net.rtmp.events.RTMPStreamEvent")]
	
	

	/**
	 * Class facilitant l'utilisation de la Class NetStream
	 * 
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class RTMPStream extends NetStream
	{
		public static const LIVE:String="live";
		public static const RECORD:String="record";
		public static const APPEND:String="append";
		
		private var __showTrace:Boolean=false;
		
		
		
		public function RTMPStream(connection:NetConnection, peerID:String="connectToFMS")
		{
			super(connection,peerID);
		}
		public function onMetaData(o:Object):void{
			
			var mtdt:MetaDataObject = new MetaDataObject();
			mtdt.audiocodecid = o.audiocodecid
			mtdt.audiodatarate = o.audiodatarate
			mtdt.canSeekToEnd = o.canSeekToEnd
			mtdt.creationdate = o.creationdate
			mtdt.duration = o.duration
			mtdt.Encoded_By = o.Encoded_By
			mtdt.Encoded_With = o.Encoded_With
			mtdt.framerate = o.framerate
			mtdt.height = o.height
			mtdt.videocodecid = o.videocodecid
			mtdt.videodatarate = o.videodatarate
			mtdt.width = o.width

			dispatchEvent(new RTMPStreamEvent(RTMPStreamEvent.ON_METADATA, mtdt));
			
			if(__showTrace){
				tracer(o);
			}
			
			
		}
		public function onPlayStatus(o:Object):void{
			if(__showTrace){
				
			}
			trace("playstatus called")
			dispatchEvent(new RTMPStreamEvent(RTMPStreamEvent.ON_PLAY_STATUS));
		}
		
		public function onCheckCuePoint(data:Object):void{
			dispatchEvent(new RTMPStreamEvent(RTMPStreamEvent.ON_CUEPOINT,null,data));
		}
		
		
		public function onXMPData(o:Object):void{
			if(__showTrace){
				tracer(o)
			}
		}
		public function set showTrace(st:Boolean):void{
			__showTrace = st;
		}
		public function get showTrace():Boolean{
			return __showTrace;
		}
		
		private function tracer(o:Object):void{
			for (var prop:String in o){
				//trace(prop+" : "+o[prop]);
			}
			
		}
		
	}
}