package  {
	import com.coreyoneil.collision.*;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	public class Chk {

		public function Chk() {
			// constructor code
		}
		public function arrandtgt(arr1:Arrow,tgtarr:Array):int{
			
			
			var colList:CollisionList = new CollisionList(arr1);
			for (var i:int = 0; i < tgtarr.length; i++)
				colList.addItem(tgtarr[i]);
			var detectCol:Array = colList.checkCollisions();
			if (detectCol.length > 0) {
				trace(detectCol.length);
				
				Arrow(detectCol[0].object1).setarrcoll(true);
				
				Target(detectCol[0].object2).setcollwarr(true);
				if(Target(detectCol[0].object2)==Target(tgtarr[0]))
				return 40;
				else if(Target(detectCol[0].object2)==Target(tgtarr[1]))
				return 20;
				else if(Target(detectCol[0].object2)==Target(tgtarr[2]))
				return 10;
				 
			
		}
		return 0;
		}
		public function shooandwall(shoo1:Shooter,stg:Stage):void{
			if(shoo1.y<=0)
			{
				
				shoo1.setcollwwall(1);
				
			}
			else if(shoo1.y + shoo1.height >=stg.stageHeight){
				shoo1.setcollwwall(2);
			}
		}
		
		public function tgtandwall(tgt:Target,stg:Stage):void{
		if(tgt.y<=0)
		{
			
			tgt.setcollwwall(1);
		}
		else if(tgt.y +tgt.height>=stg.stageHeight)
		{
			
				tgt.setcollwwall(2);
			
			
		}
		}
		
		
	}
	
}
