package {

import flash.display.Graphics;
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;
import flash.utils.clearInterval;
import flash.utils.setInterval;

public class Main extends Sprite {
    public function Main() {
        var _a:Number = -1;
        var _v:Number = 10;
        var _s:Number = 0;

        var a = [1000, 500, 100, 20];
        
        var sx:int = stage.stageWidth;
        var sy:int = stage.stageHeight*.5;
        
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

                var _:uint = setInterval(function():void{
                    var kx:Number = .1;
                    var ky:Number = .001;

                    g.moveTo(i*kx, sy - b.s*ky);
                    e.moveTo(i*kx, sy - c.s*ky);

                    var delta:Number = idx;

                    //trace(i, delta);
                    i += delta*2;
                    
                    var ka:Number = .001;
/*
                    b.a += ka*delta;
                    c.a += ka*delta;
*/
                    b.v += b.a * delta;
                    c.v += c.a * delta;
                    //c.v += (c.a - ka*delta/2) * delta;

                    b.s += b.v * delta;
                    c.s += (c.v - c.a*delta/2) * delta;

                    g.lineTo(i*kx, sy - b.s*ky);
                    e.lineTo(i*kx, sy - c.s*ky);
/*
                    if(i > sx && c.s > sy){
                        clearInterval(_);
                    }
                    */
                }, idx);
            })(k);
        }
    }
}
}
