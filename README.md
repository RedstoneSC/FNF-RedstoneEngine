![](https://user-images.githubusercontent.com/100803757/183262381-b61dfcf2-2a78-401c-8bd0-ffbf22d0e6a0.png?width=1101&height=701)
# Friday Night Funkin' - Gab Engine
A modification of Psych Engine which adds shaders and lot's of feature's!
_____________________________________
## BIG NOTICE:
Please don't take fps.hx FONT code! Remove it if you have it!
- average
_____________________________________

## Installation:
GOTTA HAVE [THE UP-TO-DATE HAXE](https://haxe.org/download/) IF YOU HAVE 4.1.5 THEN IT WILL NOT WORK! SOME STUFF IS MISSING, SERIOUSLY, STOP USING 4.1.5

Follow this [tutorial](https://youtu.be/grCip1ATI94), also install LuaJIT.
Do this in command prompt:
```
haxelib git linc_luajit https://github.com/AndreiRudenko/linc_luajit
```
On your command prompt or terminal!

if you dont want your mod to run lua delete the "LUA_ALLOWED" on Project.xml

If you need to find that little code, [press me!](https://github.com/Gabriel2019r/FNF-GabEngine/blob/main/Project.xml)

For future update's, make sure to install this on your command prompt/terminal!:
```
haxelib install hxCodec 2.5.1 
```
## Credits:
# Developers
* Gab - Coding and Artwork
* AverageDaveLover65 - Extra coding and Animator/Artist/Composer, made the 3D notes (Credit them when using THEIR stuff!)
* Aadiyan1 - Coding (Shaders support)
# Contributors
* Theoyeah - Creator of Theoyeah Engine/Icon permission
* Wither362 - Creator of Theoyeah Engines Icons
* HaydenGaming - Memory peak. (Credit them while takin the code!)

_____________________________________
## PE TEAM
* Shadow Mario - Coding
* RiverOaken - Arts and Animations
* bbpanzu - Assistant Coding

# PE CONTRUIBTOR'S
* shubs - New Input System
* SqirraRNG - Chart Editor's Sound Waveform base code
* iFlicky - Delay/Combo Menu Song Composer + Dialogue Sounds
* PolybiusProxy - .MP4 Loader Extension
* Keoiki - Note Splash Animations
* Smokey - Spritemap Texture Atlas support
* Cary - OG Resolution code
* Nebula_Zorua - VCR Shader code
_____________________________________

### Features

## New title screen

Make's the titlestate.hx a little bit better, including tweening and that sort of stuff

![](https://user-images.githubusercontent.com/107285739/185762607-78af4bee-57f8-472b-908c-d2d7fb4e2d12.png)

## Shaders VIA SOURCE

* You can add it though source code, if you even decide to!

**  
```
var bg:BGSprite = new BGSprite('folder/whateverthehellyourstageis', -600, -200, 0.9, 0.9);
				add(bg);
				bg.active = true;

				var testshader:Shaders.GlitchEffect = new Shaders.GlitchEffect();
				testshader.waveAmplitude = 0.1;
				testshader.waveFrequency = 5;
				testshader.waveSpeed = 2;

				bg.shader = testshader.shader;
				curbg = bg
```
## Better main menu

Adds in some cool stuff

![](https://user-images.githubusercontent.com/107285739/185762921-3fe34263-7341-4081-b39e-f005052879ee.png)

## Camera follow + Gab-Engine UI

* Adds in a hardcoded camera movement like in bambi's purgatory, and it is disablable whenever you feel like it!

![](https://user-images.githubusercontent.com/107285739/185763095-231a84f3-deba-4be9-a072-631b9b88ff10.png)

* Unique UI toggalble in the option's menu. This include's not limited to (not sure if you can disable color jsons but whatever):
** Diffrent placement in accuracy, and a total note hit's! (judgement counter enabled as well, confusing with it but whatever)

![](https://user-images.githubusercontent.com/107285739/185763122-d44cfaab-5e46-4945-8918-fd7da05cae10.png)

## Freeplay sections

* Make's it possible to play either mod's the base game for FNF.

While being a work in progress

![](https://user-images.githubusercontent.com/107285739/185763286-bc7a47a2-7f5f-4feb-97a2-64de38c80e73.png)

### Thanks for reading!

Make sure to play gab engine whenever you can! Unique engine!
