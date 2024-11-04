package scene;

import flixel.FlxG;
import scene.Scene;
import scene.ScriptedScene;

class SceneRegistry {
    private static final sceneScriptedClasses:Map<String, String> = [];

    public static function loadScenes():Void {
        clearScenes();
        
        final sceneList:Array<String> = ScriptedScene.listScriptClasses();

        if (sceneList.length > 0) {
            trace('Initializing ${sceneList.length} rooms');

            for (sceneClass in sceneList) {
                final scene:Scene = ScriptedScene.init(sceneClass, 'unknown');
                if (scene == null)
                    continue;

                trace('Initialized scene ${scene.id}');

                sceneScriptedClasses.set(scene.id, sceneClass);
            }
        }

        trace('Successfully loaded ${Lambda.count(sceneScriptedClasses)} scenes!');
    }

    public static function fetchScene(sceneID:String):Scene {
        if (!sceneScriptedClasses.exists(sceneID)) {
            trace('Unable to load scene $sceneID');
            return null;
        }

        final sceneClass:String = sceneScriptedClasses.get(sceneID);

        if (sceneClass != null) {
            final scene:Scene = ScriptedScene.init(sceneClass, sceneID);

            if (scene == null) {
                trace('Unable to initialize scene $sceneID');
                return null;
            }

            return scene;
        }

        return null;
    }

    public static function clearScenes():Void {
        if (sceneScriptedClasses != null)
            sceneScriptedClasses.clear();
    }
}