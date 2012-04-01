package  {
	import flash.display.Sprite;
	import flash.text.*;
	
	public class Button extends Sprite {

		public function Button(a:Sprite) {
			// constructor code
			a = getTextButton('Push Me!');
		}
		



 private function getTextButton(label:String):Sprite{
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
}

	}
	
}
