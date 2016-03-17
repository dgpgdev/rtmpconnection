package gauthier.net.rtmp.config
{
	import gauthier.net.rtmp.RTMPConnection;
	/**
	 * Decrit un objet IFMSConfig.
	 * Cette interface doit etre implementé dans tout objet de configuration pour etre intégré a la factory
	 * FMSConfigFactory
	 * @author Gauthier de Girodon Pralong
	 * @see FMSConfigFactory
	 */	
	public interface IRTMPConfig
	{
		function execute():void;
		function set source(Data:*):void;
		function get source():*;
		function set rtmpConnection(rtmp:RTMPConnection):void;
		function get rtmpConnection():RTMPConnection;
		
		function get login():String;
		function get password():String;
	}
}