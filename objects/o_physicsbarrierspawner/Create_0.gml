
PhysicsObjectsIndex = array_create(0);
for(var i = 0; i < instance_number(obj_collision);i++;){//o_static_parent
	PhysicsObjectsIndex[i] = instance_find(obj_collision,i);//o_physics_parent
	//show_debug_message("________________ PhysicsObjectsIndex "+string(PhysicsObjectsIndex[i]));
}
//show_debug_message("________________ \n already placed instances: \n"+string(PhysicsObjectsIndex));
for(i=0;i<array_length(PhysicsObjectsIndex);i++){//insert replacement instances
	var InstanceTemp = PhysicsObjectsIndex[i];
	//right now only works on squares :( - and maybe circles if we use radius
	XInstancesToCreate = ceil(abs(InstanceTemp.sprite_width)/sprite_get_width(spr_invis_grid_mask));
	YInstancesToCreate = ceil(abs(InstanceTemp.sprite_height)/sprite_get_height(spr_invis_grid_mask));
	var j = 0;
	var k = 0;
	for(j=0;j<XInstancesToCreate;j++){
		for(k=0;k<YInstancesToCreate;k++){
			//show_debug_message("in j , k : "+string(j)+" "+string(k));
			var PhysicsCollider = instance_create_depth(InstanceTemp.x+(j*sprite_get_width(spr_invis_grid_mask)),InstanceTemp.y+(k*sprite_get_height(spr_invis_grid_mask)),-200,o_box_border);
			PhysicsCollider.sprite_index = spr_invis_grid_mask;
		}
	}
}