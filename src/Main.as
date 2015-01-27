package {

import flash.display.Graphics;
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;
import flash.utils.clearInterval;
import flash.utils.setInterval;

public class Main extends Sprite {
    public function Main() {
        var _a:Number = -.01;
        var _v:Number = 2;
        var _s:Number = 0;

        var a = [500, 100, 20, 1];
        
        var sx:int = stage.stageWidth;
        var sy:int = stage.stageHeight*.7;
        
        var s1:Sprite = new Sprite();
        var s2:Sprite = new Sprite();
        
        var g:Graphics = s1.graphics;
        var e:Graphics = s2.graphics;
        
        g.lineStyle(0, 0xFF0000);
        e.lineStyle(0, 0);
        
        addChild(s1);
        addChild(s2);

        for each(var k:int in a){
            (function(idx:int):void{
                trace(idx);
                
                var b:Object = {a:_a, v:_v, s:_s};
                var c:Object = {a:_a, v:_v, s:_s};

                var i:int = 0;
                var j:int = 0;

                var _:uint = setInterval(function():void{
                    g.moveTo(i, sy - b.s);
                    e.moveTo(i, sy - c.s);

                    var delta:Number = idx;

                    //trace(i, delta);

                    b.s += b.v * delta;
                    i += delta*2;

                    c.s += (c.v + c.a*delta/2) * delta;
                    j += delta*2;
                    
                    b.v += b.a * delta;
                    c.v += c.a * delta;

                    g.lineTo(i, sy - b.s);
                    e.lineTo(j, sy - c.s);

                    if(i > sx && c.s > sy){
                        clearInterval(_);
                    }

                }, idx);
            })(k);
        }
    }
}
}
