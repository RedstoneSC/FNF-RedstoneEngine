package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		if(!FlxG.save.data.alreadySeen) {
			warnText = new FlxText(0, 0, FlxG.width,
				"Heya! It seems like you're running an   \n
				outdated version of Gab Engine (" + MainMenuState.gabEngineVersion + "),\n
				please update to " + TitleState.updateVersion + "!\n
				Press ESCAPE to proceed anyway.\n
				\n
				Thank you for using the Engine!",
			32);
		} else {
			warnText = new FlxText(0, 0, FlxG.width,
				"HEY HEY, YOURE A MASSIVE PUSSY COMPARED TO ME,   \n
				BYE!!!!!!!!!!!! \nalso your gab engine version is outdated (" + MainMenuState.gabEngineVersion + "),\n
				pretty please update to " + TitleState.updateVersion + "or expect me at your front door\n
				press escape to continue your EPIC journey\n\n- average",
			32);
		}
		warnText.setFormat("Permanent Marker Regular", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/Gabriel2019r/FNF-GabEngine/releases");
			}
			else if(controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
						FlxG.save.data.alreadySeen = true;
					}
				});
			}
		}
		super.update(elapsed);
	}
}
