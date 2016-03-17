package gauthier.net.rtmp.events
{
	import flash.events.Event;
	
	import gauthier.net.rtmp.info.MetaDataObject;
	


	public class RTMPStreamEvent extends Event
	{
		public static const ON_METADATA:String="on_metadata";
		public static const ON_CUEPOINT:String="on_cuepoint";
		public var metaDataObject:MetaDataObject;
		public var cuePointData:Object;
		public function RTMPStreamEvent(type:String, metadataObject:MetaDataObject=null, cuepointData:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			metaDataObject = metadataObject;
			cuePointData = cuepointData;
		}
		
		override public function clone():Event{
			return new RTMPStreamEvent(type, metaDataObject,cuePointData, bubbles, cancelable);
		}
		
	}
}