package  {
	
	import flash.display.MovieClip;
	
	
	public class Shooter extends MovieClip {
		
		
		public function Shooter(arrrela:Boolean) {
			arrRel=arrrela;
			
		}
		
		
		public function  setarrRel(arrRel1:Boolean):void
		{
			arrRel=arrRel1;
		}
		public function  getarrRel():Boolean{
			return arrRel;
		}
		public function getshup():int{
			return sh_up;
		}
		public function setshup(shup:int):void{
			sh_up=shup;
		}
		public function setcollwwall(collwwall1:int):void
		{
			collwbound=collwwall1;
		}
		public function getcollwwall():int
		{
			return collwbound;
		}
		private var arrRel:Boolean;
		private var sh_up:int=2;
		private var collwbound:int=0;
		
		
	}
	
}
