for(i=0;i<SpritesOnLayer;i++){
	draw_sprite_ext(s_bg_sprites,BGSprite[i],XOffset+x+(i*SpriteSpacing),YOffset+y,SpriteScale,SpriteScale,0,c_white,SpriteAlpha);
}