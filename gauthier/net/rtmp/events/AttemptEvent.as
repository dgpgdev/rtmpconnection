package gauthier.net.rtmp.events
{
	import flash.events.Event;
	
	import gauthier.net.rtmp.info.Attempt;
	/**
	 * Definit un évenement renvoyé par un objet RTMPConnection lors d'un tentative de connexion
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class AttemptEvent extends Event
	{
	
	/**
     *  la constante <code>ATTEMPT</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une une tentative de connexion.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>attemptObject</code></td><td>un objet <code>Attempt</code></td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.flashmediaserver.RTMPConnection RTMPConnection
     *	@see gauthier.net.flashmediaserver.info.Attempt Attempt
     *  @eventType attempt
     */
		public static const ATTEMPT:String="attempt";
		
	/**
     *  la constante <code>ATTEMPT_END</code> definit le 
     *  <code>type</code> de la propiété de l'objet event lorsque toute les tentatives de connexion sont finit.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>attemptObject</code></td><td>un objet <code>Attempt</code></td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.flashmediaserver.RTMPConnection RTMPConnection
     *	@see gauthier.net.flashmediaserver.info.Attempt Attempt
     *  @eventType attempt_end
     */
		public static const ATTEMPT_END:String="attempt_end";
		
		/**
		 * un objet Attempt
		 * @see gauthier.net.flashmediaserver.info.Attempt Attempt
		 */		
		 
		public var attemptObject:Attempt;
		
		/**
		 *Constructeur 
		 * @param type 
		 * @param attemptObject l'objet contenant les informations concernant la tentative de reconnexion
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function AttemptEvent(type:String,attemptObject:Attempt, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.attemptObject=attemptObject;
		}
		override public function clone():Event{
			return new AttemptEvent(type,attemptObject,bubbles,cancelable);
		}
	}
}