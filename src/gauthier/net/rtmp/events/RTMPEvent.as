
package gauthier.net.rtmp.events
{
	import flash.events.Event;
	import gauthier.net.rtmp.info.Info;
	/**
	 * Definit un évenement renvoyé par un objet RTMPConnection pour definir le resultat d'une connexion
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class RTMPEvent extends Event
	{
	//--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    /**
     *  la constante <code>RTMPEvent.SUCCESS</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une connection réussit <code>NetConnection.Connect.Success</code>.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
     *	@see gauthier.net.rtmp.info.Info Info
     * 
     *  @eventType success
     */
		public static const SUCCESS:String="success";
		
  	 /**
     *  la constante <code>RTMPEvent.REJECTED</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une connection rejeté par le server rtmp <code>NetConnection.Connect.Rejected</code>.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
     *     
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
     *	@see gauthier.net.rtmp.info.Info Info
     *  @eventType reject
     */
		public static const REJECTED:String="reject";
	 
	 /**
     *  la constante <code>RTMPEvent.SHUTDOWN</code> definit le 
     *  <code>type</code> de la propiété de l'objet event lorsque l'application du server rtmp s'arrete <code>NetConnection.Connect.AppShutdown</code>.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
     *     
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
     *	@see gauthier.net.rtmp.info.Info Info
     *  @eventType shutdown
     */
		public static const SHUTDOWN:String="shutdown";
	 
	 /**
     *  la constante <code>RTMPEvent.SHUTDOWN</code> definit le 
     *  <code>type</code> de la propiété de l'objet event lorsque l'application n'a pas pu aboutir <code>NetConnection.Connect.Failed</code>.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
     *     
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
     *	@see gauthier.net.rtmp.info.Info Info
     *  @eventType failed
     */
		public static const FAILED:String="failed";
	 /**
     *  la constante <code>RTMPEvent.SHUTDOWN</code> definit le 
     *  <code>type</code> de la propiété de l'objet event lorsque la connection se ferme <code>NetConnection.Connect.Closed</code>.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
     *     
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
     *	@see gauthier.net.rtmp.info.Info Info
     *  @eventType closed
     */
		public static const CLOSED:String="closed";
		
	 /**
     *  la constante <code>RTMPEvent.SHUTDOWN</code> definit le 
     *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
     *     
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
     *	@see gauthier.net.rtmp.info.Info Info
     *  @eventType call_failed
     */
		public static const CALL_FAILED:String="call_failed";
		
		
		//--------------------------------------------------------------------
		
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_CONNECT_FAILED</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngc_failed
		 */
		public static const NETGROUP_CONNECT_FAILED:String="ngc_failed";
		
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_CONNECT_REJECTED</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngc_reject
		 */
		public static const NETGROUP_CONNECT_REJECTED:String="ngc_reject";
		
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_CONNECT_SUCCESS</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngc_success
		 */
		public static const NETGROUP_CONNECT_SUCCESS:String="ngc_success";
		
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_LOCALCOVERAGE_NOTIFY</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ng_notify
		 */
		public static const NETGROUP_LOCALCOVERAGE_NOTIFY:String="ng_notify";
		
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_MULTICAST_PUBLISH</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngm_publish
		 */
		public static const NETGROUP_MULTICAST_PUBLISH:String="ngm_publish";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_MULTICAST_UNPUBLISH</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngm_unpublish
		 */
		public static const NETGROUP_MULTICAST_UNPUBLISH:String="ngm_unpublish";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_NEIGHBOR_CONNECT</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngn_connect
		 */
		public static const NETGROUP_NEIGHBOR_CONNECT:String="ngn_connect";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_NEIGHBOR_DISCONNECT</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngn_disconnect
		 */
		public static const NETGROUP_NEIGHBOR_DISCONNECT:String="ngn_disconnect";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_POSTING_NOTIFY</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngp_notify
		 */
		public static const NETGROUP_POSTING_NOTIFY:String="ngp_notify";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_REPLICATION_FETCH_FAILED</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngrf_failed
		 */
		public static const NETGROUP_REPLICATION_FETCH_FAILED:String="ngrf_failed";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_REPLICATION_FETCH_RESULT</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngrf_result
		 */
		public static const NETGROUP_REPLICATION_FETCH_RESULT:String="ngrf_result";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_REPLICATION_FETCH_NOTIFY</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngrf_notify
		 */
		public static const NETGROUP_REPLICATION_FETCH_NOTIFY:String="ngrf_notify";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_REPLICATION_REQUEST</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngr_request
		 */
		public static const NETGROUP_REPLICATION_REQUEST:String="ngr_request";
	
		/**
		 *  la constante <code>RTMPEvent.NETGROUP_SENDTO_NOTIFY</code> definit le 
		 *  <code>type</code> de la propiété de l'objet event lorsque que la connection n'a pu appeler la methode distante via la method <code>call</code> <code>NetConnection.Call.Failed</code>.
		 * 
		 *  <p>Les propriété de l'objet event ont pour valeur:</p>
		 *  <table class="innertable">
		 *     <tr><th>Propriété</th><th>Valeur</th></tr>
		 * 
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 * 
		 *     <tr><td><code>info</code></td><td>un objet <code>Info</code></td></tr>
		 *     
		 * 
		 *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
		 *     </td></tr>
		 * 
		 *  </table>
		 * 	@see gauthier.net.rtmp.RTMPConnection RTMPConnection
		 *	@see gauthier.net.rtmp.info.Info Info
		 *  @eventType ngs_notify
		 */
		public static const NETGROUP_SENDTO_NOTIFY:String="ngs_notify";
		
		
		
	
		public var info:Info;

		public function RTMPEvent(type:String,info:Info=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.info=info;
		}
		
		override public function clone():Event{
			return new RTMPEvent(type,info, bubbles, cancelable);
		}
		
	}
}

	