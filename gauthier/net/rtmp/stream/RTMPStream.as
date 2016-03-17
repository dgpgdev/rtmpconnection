package gauthier.net.rtmp.stream
{
	//import flash.media.H264Level;
	//import flash.media.H264Profile;
	//import flash.media.H264VideoStreamSettings;
	import flash.events.NetStatusEvent;
	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import mx.states.OverrideBase;
	
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
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class RTMPStream extends NetStream
	{
		public static const LIVE:String="live";
		public static const RECORD:String="record";
		public static const APPEND:String="append";
		
		
		private var __h264Settings:H264VideoStreamSettings;
		private var __showTrace:Boolean=false;
		
		public var videoRatio:Number;
		
		public var metaData:MetaDataObject;
		
		
		private var __tempDuration:Number = 0;
		public function RTMPStream(connection:NetConnection, peerID:String = "connectToFMS")
		{
			super(connection, peerID);
		
		}
		
	
		public function onMetaData(o:Object):void{
			
			
		
			for (var key:String in o) { 
				trace(key + ": " + o[key]); 
				__tempDuration = Math.max(o.duration, __tempDuration);
			} 
			
			
			var mtdt:MetaDataObject = new MetaDataObject();
			mtdt.audiocodecid = o.audiocodecid
			mtdt.audiodatarate = o.audiodatarate
			mtdt.canSeekToEnd = o.canSeekToEnd
			mtdt.creationdate = o.creationdate
			mtdt.duration = __tempDuration;
			mtdt.Encoded_By = o.Encoded_By
			mtdt.Encoded_With = o.Encoded_With
			mtdt.framerate = o.framerate
			mtdt.height = o.height
			mtdt.videocodecid = o.videocodecid
			mtdt.videodatarate = o.videodatarate
			mtdt.width = o.width
			trace("metadata "+mtdt.duration)
			metaData = mtdt;
			dispatchEvent(new RTMPStreamEvent(RTMPStreamEvent.ON_METADATA, mtdt));
			
			if(__showTrace){
				tracer(o);
			}
			
			
		}
		public function onPlayStatus(o:Object):void{
			if(__showTrace){
				tracer(o)
			}
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
				trace(prop+" : "+o[prop]);
			}
		}
		
		//----------------------------------
		//  h264
		//----------------------------------
		private var __h264:Boolean;
		/**
		 *  Defines h264.
		 *
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get h264():Boolean { 
			return __h264; 
		}
		
		public function set h264(value:Boolean):void
		{
			if (__h264 == value)
				return;
			__h264 = value;
			
			if(__h264){
				__h264Settings = new H264VideoStreamSettings();
				__h264Settings.setProfileLevel(H264Profile.BASELINE, H264Level.LEVEL_3_1);
				this.videoStreamSettings = __h264Settings;
			}else{
				this.videoStreamSettings = null;	
			}
		}
		
		
		//----------------------------------
		//  enabledAudio
		//----------------------------------
		private var __enabledAudio:Boolean = true;
		/**
		 *  Defines enabledAudio.
		 *
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get enabledAudio():Boolean { 
			return __enabledAudio; 
		}
		
		public function set enabledAudio(value:Boolean):void
		{
			if (__enabledAudio == value)
				return;
			__enabledAudio = value;
			this.receiveAudio(value);
		}
		
		
		//----------------------------------
		//  enabledVideo
		//----------------------------------
		private var __enabledVideo:Boolean = true;
		/**
		 *  Defines enabledVideo.
		 *
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get enabledVideo():Boolean { 
			return __enabledVideo; 
		}
		
		public function set enabledVideo(value:Boolean):void
		{
			if (__enabledVideo == value)
				return;
			__enabledVideo = value;
			this.receiveVideo(value);
		}
		
		
		
		
		
		
		
		
		
		
	}
}