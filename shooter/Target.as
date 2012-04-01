package  {
	
	import flash.display.MovieClip;
	
	
	public class Target extends MovieClip {
		
		
		public function Target(collwarr1:Boolean) {
			collwarr=collwarr1;
		}
		public function getcollwarr():Boolean{
			return collwarr;
		}
		public function setcollwarr(collwarr1:Boolean)
		{
			collwarr=collwarr1;
		}
		public function setcollwwall(collwwall1:int)
		{
			collwwall=collwwall1;
		}
		public function getcollwwall():int{
			return collwwall;
		}
		var tgt_up:int = 3;
		var collwarr:Boolean;
		var collwwall:int=0;
	}
	
}
