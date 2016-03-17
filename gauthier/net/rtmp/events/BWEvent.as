package gauthier.net.rtmp.events
{
	import flash.events.Event;
	
	import gauthier.net.rtmp.info.Bandwidth;
	/**
	 * Definit un évenement renvoyé par un objet FlashMediaServerConnection lors d'une autodetection de bande passante
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class BWEvent extends Event
	{
		/**
	     *  la constante <code>ON_BW</code> definit le 
	     *  <code>type</code> de l'event lros d'une detection de la bande passante.
	     * 
	     *  <p>Les propriété de l'objet event ont pour valeur:</p>
	     *  <table class="innertable">
	     *     <tr><th>Propriété</th><th>Valeur</th></tr>
	     * 
	     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
	     * 
	     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
	     * 
	     *     <tr><td><code>bwObject</code></td><td>un objet <code>Bandwidth</code></td></tr>
	     * 
	     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
	     *     </td></tr>
	     * 
	     *  </table>
	     * 	@see gauthier.net.flashmediaserver.FlashMediaServerConnection FlashMediaServerConnection
	     *	@see gauthier.net.flashmediaserver..Bandwidth Bandwidth
	     *  @eventType on_bandwidth
	     */
		public static const ON_BW:String="on_bandwidth";
		
		/**
		 * un objet Bandwidth
		 * @see gauthier.net.flashmediaserver..Bandwidth Bandwidth
		 */	
		public var bwObject:Bandwidth;
		/**
		 * Constructeur 
		 * @param type
		 * @param bwObject 'objet contenant la vitesse en bytes de la bande passante .
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function BWEvent(type:String,bwObject:Bandwidth, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.bwObject=bwObject;
		}
		
		override public function clone():Event{
			return new BWEvent(type,bwObject, bubbles, cancelable);
		}
		
	}
}