package gauthier.net.rtmp.info
{
	/**
	 * Représente un objet Bandwidth contenant la valeur de la bande passante lors de l'autodetection du flash media server
	 * @author Gauthier de Girodon Pralong
	 * 
	 */	
	public class Bandwidth
	{
		private var __KBps:Number
		private var __Latency:Number
		/**
		 * Constructeur 
		 * @param value le nombre un nombre en bytes.
		 * 
		 */		
		public function Bandwidth(value:Number=0)
		{
			if(value!=0){
				__KBps=value;
			}
		}
		/**
		 * Propriété qui représente le nombre converti en bits de la bande passante
		 * @param value le nombre représenté en bits
		 * @return le nombre de bits
		 * 
		 */		
		public function get Bits():Number{
			return __KBps*1024;
		}
		/**
		 * Le nombre de Kbits
		 * @return le nombre de Kbits de la bande passante
		 */		
		public function get Kbits():Number{
			return __KBps;
		}
		/**
		 * Le nombre de bits converti en MBits
		 * @return le nombre de Migi bytes de la bande passante
		 */		
		public function get Mbits():Number{
			return Kbits/1024;
		}
		/**
		 * @private
		 * */
		public function set Kbits(value:Number):void{
			__KBps=value;
		}
		/**
		 * @private
		 * */
		public function set latency(value:Number):void{
			__Latency = value;
		}
		/**
		 * Indicateur de latence
		 * @return le delais de latence en milliseconde entre le client et le server
		 */	
		public function get latency():Number{
			return __Latency;
		}
		
	}
}