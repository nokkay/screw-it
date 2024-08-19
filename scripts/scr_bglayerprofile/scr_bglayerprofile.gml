// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bglayerprofile(){
	LayerProfile = argument[0];
	switch(LayerProfile){//what sprite indexes can be used
		case -1:
			AllLayerSpritesArray = [0];
		break;
		case 0:
			AllLayerSpritesArray = [1,2,3,4,5];
		break;
		case 1:
			AllLayerSpritesArray = [1,2,3,4,5];
		break;
		case 2:
			AllLayerSpritesArray = [5];
		break;
		case 3:
			AllLayerSpritesArray = [3];
		break;
		default:
			AllLayerSpritesArray = [1,2,3,4,5];
		break;
	}
}