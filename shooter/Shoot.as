package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.display.Shape;
    import flash.display.Sprite;
    import flashx.textLayout.events.UpdateCompleteEvent;
	import flash.ui.Keyboard;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	
	public class Shoot extends MovieClip {
		
		
		public function Shoot() {
			arr1= new Arrow(false,false);
			sh1= new Shooter(false);
			up1 = new Update();
			tgts= new Target(false);
			tgtm= new Target(false);
			tgtl= new Target(false);
			tgtarr = new Array();
			chk1= new Chk();
			tf1= new TextField();
			
		    
			
			
			this.createbutton();				//creates button and its all related task
			
	
			
			stage.scaleMode = StageScaleMode.NO_SCALE;	
			stage.align = StageAlign.TOP_LEFT;		
			this.currstgheight=this.getstgheight();
			this.currstgwidth=this.getstgwidth();
			
			//stage.addEventListener(MouseEvent.CLICK,addlistener);
			//stage.addEventListener(Event.RESIZE, resizestg);
		}
		
		
		
		public function createbutton():void{
			bp1=new Butplay();
			
			stage.addChildAt(bp1,0);
			bp1.x=this.getstgwidth()/2 -bp1.width/2;
			
			bp1.y =this.getstgheight()/2-bp1.height/2;
			
			bp1.addEventListener(MouseEvent.CLICK,buttonclicked);
			
			
			
		}
		
		
		// performs the movement of the arrow and checks for the collision
		public function perform(e:Event=null):void{
			//trace("perform");
			chk1.shooandwall(sh1,this.stage);
			score=score+chk1.arrandtgt(arr1,tgtarr);
			chk1.tgtandwall(tgtl,this.stage);
			up1.movarr(arr1,sh1);
			up1.movtgt(tgtarr);
			lives = lives+up1.newarr(arr1,tgtarr,sh1.y + sh1.height/2-arr1.width/2,sh1);
			tf1.text="Score : "+ score.toString() + " Arrow : " + lives;
			if(lives==0)
			this.gamecomplete();
		}
		public function gamecomplete():void{
			var count:int=6;
			stage.removeChild(sh1);
			stage.removeChild(tgts);
			stage.removeChild(tgtm);
			stage.removeChild(tgtl);
			stage.removeChild(bp1);
			stage.removeChild(arr1);
			stage.removeChild(tf1);
			
			trace(stage.numChildren);
			
			stage.removeEventListener(Event.ENTER_FRAME,perform);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,update);
			this.lives=4;
			this.score=0;
			
			var tf2:TextField= new TextField();
			tf2.x=stage.stageWidth/2;
			tf2.y=stage.stageHeight/2;
			tf2.defaultTextFormat = new TextFormat('Verdana',15,0x556677);
			stage.addChild(tf2);
			tf2.text="GAME OVER";
			
			
			
		}
		
		
		// moves the shooter up and down 
		public function update(e:KeyboardEvent):void{
			//trace("key");
			if(e.keyCode==(Keyboard.DOWN))
			up1.shooarrdwn(sh1,arr1);
			else if(e.keyCode==(Keyboard.UP))
			up1.shooarrup(sh1,arr1);
			else if(e.keyCode==(Keyboard.ENTER))
			{
				sh1.setarrRel(true);
				arr1.setarrRel(true);
			}
		}
		
		
		
		//once button clicked game starts, button is removed.
		public function buttonclicked(e:MouseEvent):void{
			trace("button clicked");
			this.addcomponents();
			
			bp1.visible=false;
			bp1.removeEventListener(MouseEvent.CLICK,update);
		}
		public function addcomponents():void{
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,update);
			stage.addEventListener(Event.ENTER_FRAME,perform);
			stage.addChildAt(sh1,1);
			stage.addChildAt(arr1,2);
			stage.addChildAt(tgtl,3);
		    stage.addChildAt(tgtm,4);
			stage.addChildAt(tgts,5);
			stage.addChildAt(tf1,6);
			tf1.x=stage.stageWidth/2;
			tf1.y=0;
			tf1.autoSize = TextFieldAutoSize.RIGHT;
		
             tf1.defaultTextFormat = new TextFormat('Verdana',15,0x556677);
			
			
			tgtm.height=tgts.height*2;
			tgtl.height=tgts.height*3;
			//trace(this.getstgwidth());
			tgtl.x=this.getstgwidth()-tgtl.width;
			//trace(tgtl.x);
			tgtl.y=this.getstgheight()/2-tgtl.height/2;
			tgtm.x=this.getstgwidth()-2*tgtm.width;
			//trace(tgtm.x);
			tgtm.y=this.getstgheight()/2-tgtm.height/2;
			tgts.x=this.getstgwidth()-3*tgts.width;
			//trace(tgts.x);
			tgts.y=this.getstgheight()/2-tgts.height/2;
			sh1.y=this.getstgheight()/2-sh1.height/2;
			arr1.y=sh1.y + sh1.height/2-arr1.width/2;
			arr1.x=sh1.x+sh1.width;
			tgtarr.push(tgts,tgtm,tgtl);
		}
		public function resizestg(e:Event):void{
			var hratio:Number=this.getstgheight()/this.currstgheight;
			var wratio:Number=this.getstgwidth()/this.currstgwidth;
			var i:int;
			for(i=0;i<tgtarr.length;i++)
			{
				
				tgtarr[i].x=(tgtarr[i].x*this.getstgwidth())/this.currstgwidth;
				tgtarr[i].y=(tgtarr[i].y*this.getstgheight())/this.currstgheight;
			}
		}
		public  function getstgwidth():int{
			return stage.stageWidth;
		}
		public  function getstgheight():int{
			return stage.stageHeight;
			
		}
		/*
	public function getTextButton(label:String):Sprite{
    	var txt:TextField = new TextField();
   	    txt.defaultTextFormat = new TextFormat('Verdana',10,0x000000);
    	txt.text = label;
    	txt.autoSize = TextFieldAutoSize.LEFT;
  	    txt.background = txt.border = true;
   	    txt.selectable = false;
   	    var btn:Sprite = new Sprite();
     	 btn.mouseChildren = false;
        btn.addChild(txt);
         btn.buttonMode = true;
        return btn;
	}*/
		
		 var arr1:Arrow;				//moving arrow
		 var sh1:Shooter;				// moving shooter
		 var bp1:Butplay;				// play button 
		 var up1:Update;				
	     var tgts:Target;
		 var tgtm:Target;
		 var tgtl:Target;
		 var tgtarr:Array;
		 var currstgwidth:uint;
		 var currstgheight:uint;
		 var chk1:Chk;
		 var score:int=0;
		 var lives:int=4;
		 var tf1:TextField;
	}
	
}

