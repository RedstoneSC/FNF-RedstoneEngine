//COOL EPIC LOADING SCREEN

package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class LoadingScreen extends MusicBeatState
{
	var loadingSprite:FlxSprite;
	var loadingText:FlxText;
	var beginTween:FlxTween;
	var endTween:FlxTween;
	var beginTimer:FlxTimer;
	override function create()
	{
		super.create();

		loadingSprite = new FlxSprite().loadGraphic(Paths.image('gabenginesupremacy'));
		loadingSprite.setGraphicSize(Std.int(loadingSprite.width * 0.5));
		loadingSprite.screenCenter();
		loadingSprite.antialiasing = ClientPrefs.globalAntialiasing;
		loadingSprite.alpha = 0;
		loadingSprite.scale.x = 0;
		loadingSprite.scale.y = 0;
		add(loadingSprite);

		loadingText = new FlxText(0, loadingSprite.y + 135, FlxG.width, "", 21);
		loadingText.setFormat(Paths.font('vcr.ttf'), 24, FlxColor.WHITE, CENTER);
		loadingText.screenCenter(Y);
		add(loadingText);

		var blackbar_top:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, 15 * 3, FlxColor.BLACK);
		blackbar_top.scrollFactor.set();
		blackbar_top.y = FlxG.height + (10 * 3);
		add(blackbar_top);

		var blackbar_bottom:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, 15 * 3, FlxColor.BLACK);
		blackbar_bottom.scrollFactor.set();
		blackbar_top.y = FlxG.height - (15 * 3);
		add(blackbar_bottom);

		FlxTween.tween(loadingSprite, {alpha: 1}, 0.75, {ease: FlxEase.quadInOut});
		beginTween = FlxTween.tween(loadingSprite.scale, {x: 0.5, y: 0.5}, 0.75, {ease: FlxEase.quadInOut});
	}

	var loadingTimer:FlxTimer;
	var minrand:Float = 4.25;
	var maxrand:Float = 7.25;
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		loadingText.text = "loading";
		loadingTimer = new FlxTimer().start(FlxG.random.float(minrand, maxrand), function(tmr:FlxTimer) {
			FlxTween.tween(loadingSprite, {alpha: 0}, 0.75, {ease: FlxEase.quadInOut});
			endTween = FlxTween.tween(loadingSprite.scale, {x: 0, y: 0}, 0.75, {ease: FlxEase.quadInOut});
			MusicBeatState.switchState(new TitleState());
		});
	}
}
