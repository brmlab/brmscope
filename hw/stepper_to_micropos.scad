union(){
	difference(){
		cylinder(h=15, r=12);
		cylinder(h=13, r=9);
	}
	translate(v=[0,0,14]){
		difference(){
			cylinder(h=13, r=8);
			translate(v=[0,0,3]){
				cylinder(h=11, r=5);
				translate(v=[2,-3,0]){
					cube(size=[6,6,11]);
				}
			}		
		}
	}
}