package  {
	
	public class Update {

		public function Update() {
			
		}
		//moves arrow and shooter downward
		public function shooarrdwn(shoo1:Shooter,arr1:Arrow):void
		{
			if(shoo1.getarrRel()!=true && shoo1.getcollwwall()!=2)
			{
				
				shoo1.y=shoo1.y+shoo1.getshup();
				arr1.y=arr1.y+arr1.arry;
			}
			else if( shoo1.getcollwwall()!=2)
			{
				shoo1.y=shoo1.y+shoo1.getshup();
			}
		}
		//moves arrow and shooter up wards
		public function shooarrup(shoo1:Shooter,arr1:Arrow):void{
			if(shoo1.getarrRel()!=true && shoo1.getcollwwall()!=1)
			{
				
				shoo1.y=shoo1.y-shoo1.getshup();
				arr1.y=arr1.y-arr1.arry;
			}
			else if(shoo1.getcollwwall()!=1)
			{
				shoo1.y=shoo1.y-shoo1.getshup();
			}
		}
		// moves arrow in forward direction
		public function movarr(arr1:Arrow,sh1:Shooter):void{
			if(sh1.getarrRel()!=false)
			{
				if(arr1.getarrRel()!=false)
				{
					if(arr1.getarrcoll()!=true){
						arr1.x=arr1.x+arr1.getarrx();
					}
				}
			}
		}
		public function movtgt(tgtarr:Array):void{
			if(Target(tgtarr[2]).getcollwwall()==1)
			{
				
				Target(tgtarr[2]).tgt_up=-Target(tgtarr[2]).tgt_up;
				Target(tgtarr[2]).setcollwwall(0);
				var count:int=0;
				while(count!=3)
				{
					Target(tgtarr[count]).y=Target(tgtarr[count]).y+Target(tgtarr[2]).tgt_up;
					count++;
				}
				
				
			}
			else if(Target(tgtarr[2]).getcollwwall()==2)
			{
				
				Target(tgtarr[2]).tgt_up=-Target(tgtarr[2]).tgt_up;
				Target(tgtarr[2]).setcollwwall(0);
				var count:int=0;
				while(count!=3)
				{
					Target(tgtarr[count]).y=Target(tgtarr[count]).y+Target(tgtarr[2]).tgt_up;
					count++;
				}
				
			}
			else 
			{
				var count:int=0;
				while(count!=3)
				{
					Target(tgtarr[count]).y=Target(tgtarr[count]).y+Target(tgtarr[2]).tgt_up;
					count++;
				}
			}
		}
		public function newarr(arr1:Arrow,tgtarr:Array,init:int,sh1:Shooter):int{
			if(arr1.getarrcoll()==true || arr1.x - arr1.width > tgtarr[2].x + tgtarr[2].width )
			{
				trace("new one");
				arr1.y=init;
				arr1.x=sh1.width;
				var count=0;
				while(count!=3)
				{
					Target(tgtarr[count]).setcollwarr(false);
					count++;
				}
				arr1.setarrcoll(false);
				sh1.setarrRel(false);
				arr1.setarrRel(false);
				return -1;
			}
			return 0;
		}
		

	}
	
}
