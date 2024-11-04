package;

import flixel.FlxG;

import flixel.text.FlxText;
import flixel.FlxState;

import scene.SceneRegistry;
import scene.Scene;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		ModHandler.reload();

		var text = new FlxText(0, 0, 0, "does this actually work??\nHello World", 64);
		text.screenCenter();
		add(text);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE)
			FlxG.switchState(() -> SceneRegistry.fetchScene('test'));
	}
}