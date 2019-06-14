translate([0,0,5000]){
    projection(cut=true){
        translate([0,0,-5000]){
                rotate([0,0,0]){
                difference(){//esta todo en milimetos pero multiplicado por 1000 par a que se vena mejor las figuras
                    difference(){
                        difference(){
                            difference(){
                                cube([7500,10000,10000],center=true);
                                translate([-900,0,1600]){
                                    cylinder(7500,2275,2275,center=true);
                                }
                            }
                            translate([7300.0,0,0]){
                                cube([15000,20000,20000],center=true);
                            }
                        }
                        translate([0,3750,3750]){//agujero para tornillo, no es necesario que sea este tamaño
                            rotate([0,90,0]){
                                cylinder(30000,500,500,center=true);
                            }
                        }
                        translate([0,-3750,3750]){//agujero para tornillo, no es necesario que sea este tamaño
                            rotate([0,90,0]){
                                cylinder(30000,500,500,center=true);
                            }
                        }
                        translate([0,3750,-3750]){//agujero para tornillo, no es necesario que sea este tamaño
                            rotate([0,90,0]){
                                cylinder(30000,500,500,center=true);
                            }
                        }
                        translate([0,-3750,-3750]){//agujero para tornillo, no es necesario que sea este tamaño
                            rotate([0,90,0]){
                                cylinder(30000,500,500,center=true);
                            }
                        }
                    }
                    translate([0,0,1600]){
                        cube([1275,2*2275,7500],center=true);
                    }
                }
            }
        }
    }
}





projection(cut=true){
    translate([0,0,0]){
            rotate([0,0,0]){
            difference(){//esta todo en milimetos pero multiplicado por 1000 par a que se vena mejor las figuras
                difference(){
                    difference(){
                        difference(){
                            cube([7500,10000,10000],center=true);
                            translate([-900,0,1600]){
                                cylinder(7500,2275,2275,center=true);
                            }
                        }
                        translate([7300.0,0,0]){
                            cube([15000,20000,20000],center=true);
                        }
                    }
                    translate([0,3750,3750]){//agujero para tornillo, no es necesario que sea este tamaño
                        rotate([0,90,0]){
                            cylinder(30000,500,500,center=true);
                        }
                    }
                    translate([0,-3750,3750]){//agujero para tornillo, no es necesario que sea este tamaño
                        rotate([0,90,0]){
                            cylinder(30000,500,500,center=true);
                        }
                    }
                    translate([0,3750,-3750]){//agujero para tornillo, no es necesario que sea este tamaño
                        rotate([0,90,0]){
                            cylinder(30000,500,500,center=true);
                        }
                    }
                    translate([0,-3750,-3750]){//agujero para tornillo, no es necesario que sea este tamaño
                        rotate([0,90,0]){
                            cylinder(30000,500,500,center=true);
                        }
                    }
                }
                translate([0,0,1600]){
                    cube([1275,2*2275,7500],center=true);
                }
            }
        }
    }
}



