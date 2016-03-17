package gauthier.net.rtmp.events
{
	import flash.events.NetStatusEvent;
	
	import gauthier.net.rtmp.RTMPConnection;
	/**
	 * Représente un Gestionnaire d'evemenement pour un objet RTMPConnection
	 * @see gauthier.net.rtmp.RTMPConnection
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public interface IRTMPEventManager
	{
		/**
		 * Methode qui est appele par le server lorsque l'objet RTMPConnection reçoit un NetStatusEvent.
		 * Cette methode nous permet de connaitre le satus de la connection.
		 * @param e un objet NetStatusEvent renvoyé par un objet RTMPConnection.
		 */		
		function onStatus(e:NetStatusEvent):void;
		/**
		 * @private
		 * */
		function set rtmpConnection(RTMPC:RTMPConnection):void;
		/**
		 * Propriété qui permet d'assigner notre objet RTMPConnection a notre EventManager
		 * @param RTMPC 
		 */		
		function get rtmpConnection():RTMPConnection;
	}
}