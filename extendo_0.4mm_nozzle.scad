pieces = 20;
width_between = 0.4;
piece_thickness = 0.8;
//top_to_bottom_ratio = 0.9;
$fn = 100;
height = 150;
min_radius = 3;

radius_addition_to_keep_from_falling_out = 0.3;

bottom_holder_thickness = 1;
bottom_holder_height = 20;
bottom_holder_wall_thickness = 0.8;

top_toy_thickness = 1;
top_toy_height = 2;
top_toy_wall_thickness = 0.8;

debug =  false;
debug_spacing = -3;

module extendo(){
    for ( i = [1 : pieces] ){
        to_scale = piece_thickness + width_between;
        bottom_radius = (i * to_scale) + min_radius;
        top_radius = bottom_radius + radius_addition_to_keep_from_falling_out;
        debug_translation_z = debug ? -1*(i * (height + debug_spacing)) : 0;
        translate([0, 0, debug_translation_z]) difference(){
            cylinder(height, bottom_radius, top_radius);
            translate([0,0,-0.01]) cylinder(height + 0.02, bottom_radius - piece_thickness, top_radius - piece_thickness);
        }
    }
}



module bottom_cap(){
    largest_radius = pieces * (piece_thickness + width_between) + min_radius + radius_addition_to_keep_from_falling_out;
    
    bottom_cap_radius = largest_radius + piece_thickness + 0.1;

    cylinder(bottom_holder_thickness, bottom_cap_radius, bottom_cap_radius);
    translate([0,0,bottom_holder_thickness]) difference(){
        cylinder(bottom_holder_height, bottom_cap_radius, bottom_cap_radius);
        cylinder(bottom_holder_height + 1, bottom_cap_radius - bottom_holder_wall_thickness, bottom_cap_radius - bottom_holder_wall_thickness);
    }
}

module top_toy_cap(){
    smallest_radius = (piece_thickness + width_between) + min_radius;
    
    top_toy_radius = smallest_radius + piece_thickness + 0.2;

    cylinder(top_toy_thickness, top_toy_radius, top_toy_radius);
    translate([0,0,top_toy_thickness]) difference(){
        cylinder(top_toy_height, top_toy_radius, top_toy_radius);
        cylinder(top_toy_height + 1, top_toy_radius - top_toy_wall_thickness, top_toy_radius - top_toy_wall_thickness);
    }
}

extendo();
//bottom_cap();
//top_toy_cap();



//translate([0,0,height]) difference(){
//    sphere(largest_radius);
//    translate([0,0,-1 * bottom_holder_thickness]) sphere(largest_radius);
//    translate([0,0,-1*largest_radius/2]) cube([largest_radius*2, largest_radius*2, largest_radius], center=true);
//}

// top cap
//largest_radius = pieces * (piece_thickness + width_between) + min_radius + piece_thickness + 100;
//
//translate([0,0,height-10]) difference(){
//    translate([0,0,-100]) sphere(largest_radius);
//    translate([0,0,-1 * bottom_holder_thickness - 100]) sphere(largest_radius);
//    translate([0,0,-1*largest_radius/2]) cube([largest_radius*2, largest_radius*2, largest_radius], center=true);
//}