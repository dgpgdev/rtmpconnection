package gauthier.net.rtmp
{
	/**
	 * Class permettant de definir le protocol avec lequel 
	 * nous allons nous connecter au flash media server.
	 * @author Gauthier de Girodon Pralong
	 */	
	public class RTMPProtocol
	{
		/**
		 * Protocle rtmp, c'est le protocole par défaut.
		 */
		public static const RTMP:String="rtmp";
		/**
		 * Protocole utilisé pour le tunneling http
		 */		
		public static const RTMPT:String="rtmpt";
		/**
		 * Protocole utilisé pour le tunneling http avec le nouveau systeme cryptage du FMS 3
		 */		
		public static const RTMPTE:String="rtmpte";
		/**
		 * Protocole utilisant le nouveau systeme cryptage du FMS 3 (plus rapide que le rtmps)
		 */		
		public static const RTMPE:String="rtmpe";
		/**
		 * Protocole utilisant le SSL
		 */		
		public static const RTMPS:String="rtmps";
		
		/**
		* Protocole utilisé pour se connecter en multicast
		*/		
		public static const RTMFP:String="rtmfp";
		/**
		 * Contructeur
		 */		
		public function RTMPProtocol()
		{
		}

	}
}