if instance_exists(obj_camera){
	x = obj_camera.x;
	y = obj_camera.y;
}

for(i=0;i<Layers;i++){
	layerchild[i].x = x-(x*(LayerScale*i)*.65);
	layerchild[i].y = y-(y*(LayerScale*-i)*.05);
}
