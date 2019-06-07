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

translate([10000,0,0]){
    difference(){
        cube([100,10000,10000],center=true);
        cube([200,11000,4970],center=true);
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
    difference(){
        rotate([90,0,0]){
                cylinder(10000,2600,2600,center=true);
        }
        rotate([90,0,0]){
                cylinder(5000,2610,2610,center=true);
        }
        rotate([90,0,0]){
            cylinder(100000,2500,2500,center=true);
        }
        translate([-2500,0,0]){
            cube([5000,15000,10000],center=true);
        }
   }
   
}


translate([5000,0,-10000]){
    translate([2500,0,-150]){
        difference(){
            cube([4200,10000,100],center=true);
            translate([1000,-3750,0]){
                rotate([0,0,90]){
                    cylinder(1000,500,500,center=true);
                }
            }
            translate([1000,3750,0]){
                rotate([0,0,90]){
                    cylinder(1000,500,500,center=true);
                }
            }
        }
    }
    rotate([90,0,0]){
        difference(){
            cylinder(10000,500,500,center=true);
            cylinder(5000,510,510,center=true);
            cylinder(11000,250,250,center=true);
        }
    }
}
translate([5000,0,-7500]){
    translate([-2500,0,-150]){
        difference(){
            cube([4200,10000,100],center=true);
            translate([-1000,-3750,0]){
                rotate([0,0,90]){
                    cylinder(1000,500,500,center=true);
                }
            }
            translate([-1000,3750,0]){
                rotate([0,0,90]){
                    cylinder(1000,500,500,center=true);
                }
            }
        }
    }
    rotate([90,0,0]){
        difference(){
            cylinder(4900,510,510,center=true);
            cylinder(11000,250,250,center=true);
        }
    }
}