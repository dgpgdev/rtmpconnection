
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
     *  la constante <code>FlashMediaServerEvent.SUCCESS</code> definit le 
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
     *  la constante <code>FlashMediaServerEvent.REJECTED</code> definit le 
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
     *  la constante <code>FlashMediaServerEvent.SHUTDOWN</code> definit le 
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
     *  la constante <code>FlashMediaServerEvent.SHUTDOWN</code> definit le 
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
     *  la constante <code>FlashMediaServerEvent.SHUTDOWN</code> definit le 
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
     *  la constante <code>FlashMediaServerEvent.SHUTDOWN</code> definit le 
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

	