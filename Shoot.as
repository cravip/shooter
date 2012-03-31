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
	
	public class Shoot extends MovieClip {
		
		
		public function Shoot() {
			arr1= new Arrow();
			sh1= new Shooter(false);
			up1 = new Update();
			
		    
			
			
			this.createbutton();				//creates button and its all related task
			
	
			
			stage.scaleMode = StageScaleMode.NO_SCALE;	
			stage.align = StageAlign.TOP_LEFT;		
			
			//stage.addEventListener(MouseEvent.CLICK,addlistener);
			
		}
		
		
		
		public function createbutton():void{
			bp1=new Butplay();
			
			stage.addChild(bp1);
			bp1.x=this.getstgwidth()/2 -bp1.width/2;
			
			bp1.y =this.getstgheight()/2-bp1.height/2;
			
			bp1.addEventListener(MouseEvent.CLICK,buttonclicked);
			
			
			
		}
		
		
		// perfroms the movement of the arrow and checks for the collision
		public function perform(e:Event=null):void{
			trace("perform");
		}
		
		
		
		// moves the shooter up and down 
		public function update(e:KeyboardEvent):void{
			trace("key");
			if(e.keyCode==(Keyboard.DOWN))
			up1.upshoo(sh1,arr1);
		}
		
		
		
		//once button clicked game starts, button is removed.
		public function buttonclicked(e:MouseEvent):void{
			trace("button clicked");
			
			//stage.addEventListener(Event.ENTER_FRAME,perform);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,update);
			//stage.removeChild(bp1);
			stage.addChild(sh1);
			sh1.y=this.getstgheight()/2-sh1.height/2;
			stage.addChild(arr1);
			arr1.y=this.getstgheight()/2-arr1.height/2;
			arr1.x=sh1.x+sh1.width;
			sh1.y=this.getstgheight()/2;
			bp1.visible=false;
			bp1.removeEventListener(MouseEvent.CLICK,update);
		}
		public function getstgwidth():int{
			return stage.stageWidth;
		}
		public function getstgheight():int{
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
	
	}
	
}

