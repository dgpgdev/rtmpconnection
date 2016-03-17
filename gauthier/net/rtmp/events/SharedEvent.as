package gauthier.net.rtmp.events
{
	import flash.events.Event;

	public class SharedEvent extends Event
	{

	//--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    /**
     *  la constante <code>SharedEvent.SYNCHRONIZED</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une synchronisation du SharedObject réussit.
     * 
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>data</code></td><td>un objet qui contient l'ensemble des data stocké dans le SharedObject</td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPShared RTMPShared
     * 
     *  @eventType synchronized
     */
		public static const SYNCHRONIZED:String="synchronized";
		
	 /**
     *  la constante <code>SharedEvent.CHANGE</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une modification de l'objet data du SharedObject.
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>data</code></td><td>un objet qui contient les propriété code, name de l'objet modifié dans data</td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPShared RTMPShared
     * 
     *  @eventType change
     */
		public static const UPDATE:String="update";
	/**
     *  la constante <code>SharedEvent.CHANGE</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une modification de l'objet data du SharedObject.
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>data</code></td><td>un objet qui contient les propriété code, name de l'objet modifié dans data</td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPShared RTMPShared
     * 
     *  @eventType change
     */
		public static const ADD:String="add";
	  /**
     *  la constante <code>SharedEvent.DELETE</code> definit le 
     *  <code>type</code> de la propiété de l'objet event pour une suppression de valeur dans l'objet data du SharedObject.
     *  <p>Les propriété de l'objet event ont pour valeur:</p>
     *  <table class="innertable">
     *     <tr><th>Propriété</th><th>Valeur</th></tr>
     * 
     *     <tr><td><code>bubbles</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>cancelable</code></td><td>false</td></tr>
     * 
     *     <tr><td><code>data</code></td><td>un objet qui contient les propriété code, name de l'objet suppriméé dans data</td></tr>
     * 
     *     <tr><td><code>target</code></td><td>l'objet emetteur de l'evenement
     *     </td></tr>
     * 
     *  </table>
     * 	@see gauthier.net.rtmp.RTMPShared RTMPShared
     * 
     *  @eventType delete
     */
		public static const DELETE:String="delete";
		
		public var data:Object;
		
		public function SharedEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		override public function clone():Event{
			return new SharedEvent(type,data, bubbles, cancelable);
		}
		
	}
}