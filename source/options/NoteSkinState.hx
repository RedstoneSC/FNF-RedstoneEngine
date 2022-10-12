// scroll all the way down for broken code -redstoneSC
// also these errors were happening when we tried changing the noteskin path to shared/images/noteskins/
// credits to Phoneguytech75 (we gave credits! :D)
package options;

#if MODS_ALLOWED    
    import sys.FileSystem;
#end    
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.addons.text.FlxTypeText;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

using StringTools;

class NoteSkinState extends MusicBeatState {
   
    private var grpSkins:FlxTypedGroup<Alphabet>;
    private var grpNotes:FlxTypedGroup<FlxSprite>;
    private var skinText:Alphabet;
    private var helpText:FlxText;
    public static var curSelected:Int = 0;

    var bg:FlxSprite;
    var camFollow:FlxObject;
    var camFollowPos:FlxObject;
    var skinList:Array<Dynamic> = [];
   
    override function create() {

        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xFFea71fd;
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.screenCenter();

		// camFollow = new FlxObject(0, 0, 1, 1);
		// camFollowPos = new FlxObject(0, 0, 1, 1);
		// add(camFollow);
		// add(camFollowPos);

        // FlxG.camera.follow(camFollowPos, null, 1);

        grpSkins = new FlxTypedGroup<Alphabet>();
		add(grpSkins);
        grpNotes = new FlxTypedGroup<FlxSprite>();
        add(grpNotes);

        var skinPath:String = 'assets/shared/images/noteSkins/';
        trace(skinPath);

        if(FileSystem.exists(skinPath)) {
            trace("Note skins found");
            for(file in FileSystem.readDirectory(skinPath)) {
                if(StringTools.contains(file, '.xml')) {
                    var skinName = StringTools.replace(file, ".xml", "");
                    trace('Found note skin ' + skinName);
                    skinList.push(skinName);

                }
            }
        }
        else {
            trace("No note skins found");
        }

        // for(i in 0...skinList.length) {
        //     // Make flixel text
        //     var skinName = skinList[i];
        //     var skinText = new Alphabet(0, (70 * i) + 30, skinName, true, false);
        //     skinText.isMenuItem = true;
        //     skinText.targetY = i;
        //     grpSkins.add(skinText);
        // }
        
        previewSkin();


        skinText = new Alphabet(0, 100, skinList[curSelected], true, false);
        skinText.isMenuItem = true;
        skinText.screenCenter();
        grpSkins.add(skinText);
        
        helpText = new FlxText((FlxG.width/2) - 300, (FlxG.height/2) + 100, FlxG.width, "Use the up and down arrow keys to select a skin. Press enter to select.");
        helpText.scrollFactor.set();
        helpText.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(helpText);
    }

    
    override function update(elapsed:Float) {
        var downP = controls.UI_DOWN_P;
        var upP = controls.UI_UP_P;
        var accepted = controls.ACCEPT;
        
        if(downP) {
            changeSkin();
        }
        else if(upP) {
            changeSkin(false);
        }
        if(accepted) {
            acceptSkin();
        }

        grpNotes.clear();
        previewSkin();
    }

    function changeSkin(down:Bool = true) {
        if(down) {   
            curSelected++;
        }
        else {
            curSelected--;
        }    
        if(curSelected >= skinList.length) {
            curSelected = 0;
        }
        else if(curSelected < 0) {
            curSelected = skinList.length - 1;
        }
        skinText.changeText(skinList[curSelected]);
    }

    function acceptSkin() {
        var skinName = skinList[curSelected];
        FlxG.save.data.arrowSkin = 'noteSkins\x2f'+skinName;
        trace(FlxG.save.data.arrowSkin);
        MusicBeatState.switchState(new options.OptionsState());
    }

    function previewSkin() {
        var arrows:Array<String> = ['purple0', 'blue0', 'green0', 'red0'];
        for (i in 0...arrows.length) {
            var arrow:FlxSprite = new FlxSprite((FlxG.width/2) - 250 + Note.swagWidth * i , (FlxG.height/2) - 200);
            arrow.scale.set(0.7, 0.7);
			
			arrow.frames = Paths.getSparrowAtlas('noteSkins/' + skinList[curSelected]);

            arrow.animation.addByPrefix('idle', arrows[i]);
            arrow.animation.play('idle');
            arrow.antialiasing = ClientPrefs.globalAntialiasing;
            grpNotes.add(arrow);
        }
    }
}