function onCreate()
	-- example
	makeLuaSprite('WavyShaderBGTest/cheater', 'bgfilename', -600, -300);
	setLuaSpriteScrollFactor('bgfilename', 0.9, 0.9);
	addWavyEffect('bgfilename', 1.5, 3);
	addLuaSprite('bgfilename', false);

	
	close(true); --perfomance bla bla bla
end