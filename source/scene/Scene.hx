package scene;

import flixel.*;
import flixel.math.*;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;

class Scene extends FlxState {
    public var id:String;

    public function new(id:String) {
        super();
        this.id = id;
    }

    public override function create() {
        super.create();
    }

    public override function update(elapsed:Float) {
        super.update(elapsed);
    }
}