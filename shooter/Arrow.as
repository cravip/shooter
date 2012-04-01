package  {
	
	import flash.display.MovieClip;
	
	
	public class Arrow extends MovieClip {
		
		
		public function Arrow(collwtgt1:Boolean,isrel1:Boolean) {
			collwtgt=collwtgt1;
			isRel=isrel1;
		}
		public function getarrRel():Boolean{
			return isRel;
		}
		public function setarrRel(isrel1:Boolean):void{
			isRel=isrel1;
		}
		public function getarry():int{
			return arry;
		}
		public function getarrx():int{
			return arrx;
		}
		public function getarrcoll():Boolean{
			return collwtgt;
		}
		public function setarrcoll(collwtgt1:Boolean){
			collwtgt=collwtgt1;
		}
		 var arrx:int=2;
	    var arry:int=2;
		var collwtgt:Boolean;
		var isRel:Boolean;
	}
	
}
