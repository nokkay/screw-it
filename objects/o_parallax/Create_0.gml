//layer 0 always foreground // doesnt work atm but it could be 1 tweak away 

LayerProfile = 0;

SpriteSpacing = 256;

switch(room){//what profile does this room have
	case rm_title:
	Layers = 4;
	LevelProfileArray = array_create(Layers,-1);
		LevelProfileArray[0] = 1;//each corrispond to an image on the s_bg_sprites
		LevelProfileArray[1] = 1;
		LevelProfileArray[2] = 1;
		LevelProfileArray[3] = 1;
	break;
	case rm_level1:
	Layers = 4;
	LevelProfileArray = array_create(Layers,-1);
		LevelProfileArray[0] = 1;
		LevelProfileArray[1] = 1;
		LevelProfileArray[2] = 1;
		LevelProfileArray[3] = 1;
	break;
	case rm_level2:
	Layers = 4;
	LevelProfileArray = array_create(Layers,-1);
		LevelProfileArray[0] = 1;
		LevelProfileArray[1] = 1;
		LevelProfileArray[2] = 1;
		LevelProfileArray[3] = 1;
	break;
	case rm_level3:
	Layers = 4;
	LevelProfileArray = array_create(Layers,-1);
		LevelProfileArray[0] = 1;
		LevelProfileArray[1] = 1;
		LevelProfileArray[2] = 1;
		LevelProfileArray[3] = 1;
	break;
	case rm_level4:
	Layers = 4;
	LevelProfileArray = array_create(Layers,-1);
		LevelProfileArray[0] = 1;
		LevelProfileArray[1] = 1;
		LevelProfileArray[2] = 1;
		LevelProfileArray[3] = 1;
	break;
	default:
	Layers = 3;
	LevelProfileArray = array_create(Layers,-1);
	break;
}

LayerScale = .85;//Layers/;

for(i=0;i<Layers;i++){
	if i = Layers-1{//fg // doesnt work atm but it could be 1 tweak away 
		SpritesOnLayer[i] = ceil(room_width/(SpriteSpacing*((i+1)*LayerScale)))+1;
		layerchild[i] = instance_create_depth(x,y,-300,o_bglayernode);
		layerchild[i].SpritesOnLayer = SpritesOnLayer[i];
		layerchild[i].SpriteSpacing = (SpriteSpacing*((i+1)/LayerScale));
		layerchild[i].SpriteScale = (3+i)*LayerScale;
		//layerchild[i].SpriteAlpha = .4; // implement later
		layerchild[i].SpriteAlpha = 0; // implement later
		layerchild[i].LayerProfileSelected = array_get(LevelProfileArray,i);
	} else {//bg
		SpritesOnLayer[i] = ceil(room_width/(SpriteSpacing*((i+1)*LayerScale)))+1;
		layerchild[i] = instance_create_depth(x,y,600+Layers*100+(i*-100),o_bglayernode);
		layerchild[i].SpritesOnLayer = SpritesOnLayer[i];
		layerchild[i].SpriteSpacing = (SpriteSpacing*((i+1)/LayerScale));
		layerchild[i].SpriteScale = (1+i)*LayerScale;
		layerchild[i].LayerProfileSelected = array_get(LevelProfileArray,i);
	}
	//show_debug_message(layerchild[i]);
	//show_debug_message(layerchild[i].SpritesOnLayer);
	//show_debug_message(layerchild[i].SpriteSpacing);
	//show_debug_message(layerchild[i].SpriteScale);
	//show_debug_message(layerchild[i].LayerProfileSelected);
	//show_debug_message("________");
}

for(i=0;i<Layers;i++){
	for(j=0;j<SpritesOnLayer[i];j++){
		scr_bglayerprofile(layerchild[i].LayerProfileSelected);
		var loopnum = SpritesOnLayer[i]+1;
		var IndexesToRepeat = AllLayerSpritesArray;
		var k = 0;
		repeat(loopnum){
			array_insert(AllLayerSpritesArray,array_length(AllLayerSpritesArray),array_get(IndexesToRepeat,k));
			k++;
		}
		//show_debug_message(array_get(AllLayerSpritesArray,j));
		layerchild[i].BGSprite[j] = array_get(AllLayerSpritesArray,j);
	}
}