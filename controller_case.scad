rand_dikte=12;
dikte_onderplaat=4;
gat_diameter=3;
afstand_gat_pcb=2.5;

pcb_lengte=85;
pcb_breedte=55;
pcb_dikte=1.6;

pcb_afstand=3;

speling=0.5;

brass_insert_lengte=4;
brass_insert_buiten_diameter=5;

radius_kleine_rand = 1;
radius_grote_rand = 6; 

lengte_beeldscherm_connector_uitsparing = 25;
hoogte_beeldscherm_connector_uitsparing = 1.5;

commit = "9963d08";

module brass_insert_hole(l, k){ 
    translate([0,0,-l-1])
    union(){
        cylinder(l+1-l*0.25, d=0.9*k);
        translate([0,0,l+1-l*0.25])
        cylinder(l*0.25,d1=0.9*k,d2=k+0.2);
    }
}



module edge(r1, r2){
    d1=2*r1;
    d2=2*r2;
    difference(){
        union(){

            translate([-1,0,-1])
            cube([r1+1,pcb_breedte+2*(rand_dikte+speling),r1+1]);

            translate([pcb_lengte+2*(rand_dikte+speling)-r1,0,-1])
            cube([r1+1,pcb_breedte+2*(rand_dikte+speling),r1+1]);

            translate([0,-1,-1])
            cube([pcb_lengte+2*(rand_dikte+speling)-r1,r1+1,r1+1]);

            translate([0,pcb_breedte+2*(rand_dikte+speling)-r1,-1])
            cube([pcb_lengte+2*(rand_dikte+speling),r1+1,r1+1]);



            translate([-1,-1,0])
            cube([r2+1,r2+1,hoogte+rand_dikte+10]);

            translate([pcb_lengte+2*(rand_dikte+speling),0,0])
            rotate([0,0,90])
            translate([-1,-1,0])
            cube([r2+1,r2+1,hoogte+rand_dikte+10]);

            translate([pcb_lengte+2*(rand_dikte+speling),pcb_breedte+2*(rand_dikte+speling),0])
            rotate([0,0,180])
            translate([-1,-1,0])
            cube([r2+1,r2+1,hoogte+rand_dikte+10]);

            translate([0,pcb_breedte+2*(rand_dikte+speling),0])
            rotate([0,0,270])
            translate([-1,-1,0])
            cube([r2+1,r2+1,hoogte+rand_dikte+10]);

        }
        union(){
            translate([r2,r2,r1])
            rotate([0,0,180])
            rotate_extrude(convexity=10, angle=90){
                translate([r2-r1, 0]) {
                    kwart_circle(r1);
                }
            }
            translate([r2,r2,r1]){
                cylinder(hoogte+rand_dikte+10,r=r2);
            }
            translate([r2, r2, 0])
            cylinder(r1,r=r2-r1);
            
            translate([pcb_lengte+2*(rand_dikte+speling),0,0])
            rotate([0,0,90]){
                translate([r2,r2,r1])
                rotate([0,0,180])
                rotate_extrude(convexity=10, angle=90){
                    translate([r2-r1, 0]) {
                        kwart_circle(r1);
                    }
                }
                translate([r2,r2,r1]){
                    cylinder(hoogte+rand_dikte+10,r=r2);
                }
                translate([r2, r2, 0])
                cylinder(r1,r=r2-r1);
            }

            translate([pcb_lengte+2*(rand_dikte+speling),pcb_breedte+2*(rand_dikte+speling),0])
            rotate([0,0,180]){
                translate([r2,r2,r1])
                rotate([0,0,180])
                rotate_extrude(convexity=10, angle=90){
                    translate([r2-r1, 0]) {
                        kwart_circle(r1);
                    }
                }
                translate([r2,r2,r1]){
                    cylinder(hoogte+rand_dikte+10,r=r2);
                }
                translate([r2, r2, 0])
                cylinder(r1,r=r2-r1);
            }

            translate([0,pcb_breedte+2*(rand_dikte+speling),0])
            rotate([0,0,270]){
                translate([r2,r2,r1])
                rotate([0,0,180])
                rotate_extrude(convexity=10, angle=90){
                    translate([r2-r1, 0]) {
                        kwart_circle(r1);
                    }
                }
                translate([r2,r2,r1]){
                    cylinder(hoogte+rand_dikte+10,r=r2);
                }
                translate([r2, r2, 0])
                cylinder(r1,r=r2-r1);
            }

            translate([r1,r2,r1])
            rotate([-90,0,0])
            cylinder(pcb_breedte+2*(rand_dikte+speling)-d2,r=r1);

            translate([pcb_lengte+2*(rand_dikte+speling)-r1,r2,r1])
            rotate([-90,0,0])
            cylinder(pcb_breedte+2*(rand_dikte+speling)-d2,r=r1);

            translate([r2,r1,r1])
            rotate([0,90,0])
            cylinder(pcb_lengte+2*(rand_dikte+speling)-d2,r=r1);

            translate([r2,pcb_breedte+2*(rand_dikte+speling)-r1,r1])
            rotate([0,90,0])
            cylinder(pcb_lengte+2*(rand_dikte+speling)-d2,r=r1);

        }
    }       
}

module achterkant(){
    difference(){
        union(){
            cube([pcb_lengte+2*(rand_dikte+speling),pcb_breedte+2*(rand_dikte+speling),dikte_onderplaat]);

            translate([rand_dikte+speling,rand_dikte+speling,dikte_onderplaat])
            cube([2*afstand_gat_pcb+gat_diameter,2*afstand_gat_pcb+gat_diameter,pcb_afstand]);

            translate([rand_dikte+speling-2*afstand_gat_pcb-gat_diameter+pcb_lengte,rand_dikte+speling,dikte_onderplaat])
            cube([2*afstand_gat_pcb+gat_diameter,2*afstand_gat_pcb+gat_diameter,pcb_afstand]);

            translate([rand_dikte+speling,rand_dikte+speling-2*afstand_gat_pcb-gat_diameter+pcb_breedte,dikte_onderplaat])
            cube([2*afstand_gat_pcb+gat_diameter,2*afstand_gat_pcb+gat_diameter,pcb_afstand]);

            translate([rand_dikte+speling-2*afstand_gat_pcb-gat_diameter+pcb_lengte,rand_dikte+speling-2*afstand_gat_pcb-gat_diameter+pcb_breedte,dikte_onderplaat])
            cube([2*afstand_gat_pcb+gat_diameter,2*afstand_gat_pcb+gat_diameter,pcb_afstand]);
        }
        union(){
            translate([rand_dikte+speling+afstand_gat_pcb+0.5*gat_diameter,rand_dikte+speling+afstand_gat_pcb+0.5*gat_diameter,dikte_onderplaat+pcb_afstand])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);


            translate([rand_dikte+speling+pcb_lengte-afstand_gat_pcb-0.5*gat_diameter,rand_dikte+speling+afstand_gat_pcb+0.5*gat_diameter,dikte_onderplaat+pcb_afstand])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);


            translate([rand_dikte+speling+afstand_gat_pcb+0.5*gat_diameter,rand_dikte+speling+pcb_breedte-afstand_gat_pcb-0.5*gat_diameter,dikte_onderplaat+pcb_afstand])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);


            translate([rand_dikte+speling+pcb_lengte-afstand_gat_pcb-0.5*gat_diameter,rand_dikte+speling+pcb_breedte-afstand_gat_pcb-0.5*gat_diameter,dikte_onderplaat+pcb_afstand])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);

            translate([rand_dikte/2+3, rand_dikte/2+3,0]){              
                schroef_cutout(5.6,6,3,1.65,0.8);
            }

            translate([pcb_lengte+2*(rand_dikte+speling)-rand_dikte/2-3, rand_dikte/2+3,0]){
                schroef_cutout(5.6,6,3,1.65,0.8);
            }

            translate([rand_dikte/2+3, pcb_breedte+2*(rand_dikte+speling)-rand_dikte/2-3, 0]){
                schroef_cutout(5.6,6,3,1.65,0.8);
            }

            translate([pcb_lengte+2*(rand_dikte+speling)-rand_dikte/2-3, pcb_breedte+2*(rand_dikte+speling)-rand_dikte/2-3, 0]){
                schroef_cutout(5.6,6,3,1.65,0.8);
            }

            edge(radius_kleine_rand,radius_grote_rand);
            
            translate([(rand_dikte*2+speling*2+pcb_lengte)/2-30,6,dikte_onderplaat-1])
            write(commit);

        }
    }
}

// achterkant();
// translate([-100+rand_dikte+speling,105+rand_dikte+speling,rand_dikte+pcb_afstand])
// import("dehydration-mod-controller-pcb-with-components.stl", convexity=3);

draaiknop_diameter_gat=7;
draaiknop_breedte=11.8;

lengte_scherm_pcb=72;
lengte_scherm=62.6;
scherm_pcb_gat_diameter=3;
breedte_scherm_pcb=43.1;
breedte_scherm=40.1;
rand_tot_midden_gat_scherm_pcb=2;

dikte_voorkant=3;

hoogte=28;

module moer(s,d,h=0){
    difference(){
        union(){
            translate([0,0,d/2])
            intersection_for(n = [0:2]){
                rotate([0,0,n*120])
                cube([s,2*s,d], true);
            }
        }
        cylinder(d,d=h);
    }
}

module schroef_cutout(dk,dke,d,k,e=0){
    union(){
        cylinder(e,d=dke);
        translate([0, 0, e])
        cylinder(1,dke/2,dke/2);
        translate([0, 0, 1+e])
        cylinder(k*dke/dk,dke/2,d/2);
        translate([0,0,k*dke/dk+1+e])
        cylinder(15,d=d);
    }
}

module voorkant(with_usb=true){
    difference(){
        union() {
            cube([pcb_lengte+2*(rand_dikte+speling),pcb_breedte+2*(rand_dikte+speling),dikte_voorkant]);
            cube([pcb_lengte+2*(rand_dikte+speling), rand_dikte, hoogte]);
            translate([0,pcb_breedte+rand_dikte+2*speling,0])
            cube([pcb_lengte+2*(rand_dikte+speling), rand_dikte, hoogte]);
            cube([rand_dikte,pcb_breedte+2*(rand_dikte+speling), hoogte]);
            translate([pcb_lengte+rand_dikte+2*speling,0,0])
            cube([rand_dikte,pcb_breedte+2*(rand_dikte+speling), hoogte]);
        }
        union(){
            translate([rand_dikte+2.5+3,0.5*pcb_breedte+rand_dikte+speling+(0.5*breedte_scherm_pcb-2),-0.1]){
                // translate([0,0,dikte_voorkant+1])
                // moer(5,2,2.5);
                // cylinder(10,d=3);
                schroef_cutout(4.7,5,2.5,1.5);
            }
            translate([rand_dikte+2.5+3,0.5*pcb_breedte+rand_dikte+speling-(0.5*breedte_scherm_pcb-2),-0.1]){
                // moer(5,2);
                // cylinder(10,d=3);
                schroef_cutout(4.7,5,2.5,1.5);
            }
            translate([rand_dikte+2.5+3+lengte_scherm_pcb-4,0.5*pcb_breedte+rand_dikte+speling+(0.5*breedte_scherm_pcb-2),-0.1]){
                // moer(5,2);
                // cylinder(10,d=3);
                schroef_cutout(4.7,5,2.5,1.5);
            }
            translate([rand_dikte+2.5+3+lengte_scherm_pcb-4,0.5*pcb_breedte+rand_dikte+speling-(0.5*breedte_scherm_pcb-2),-0.1]){
                // moer(5,2);
                // cylinder(10,d=3);
                schroef_cutout(4.7,5,2.5,1.5);
            }

            translate([rand_dikte+0.5+3+0.5*(lengte_scherm_pcb-lengte_scherm),-0.5*breedte_scherm+0.5*pcb_breedte+rand_dikte+speling+0.5,-0.1])
            cube([lengte_scherm, breedte_scherm,4]);

            translate([pcb_lengte+speling+rand_dikte-draaiknop_breedte*0.5+3+4,0.5*pcb_breedte+rand_dikte+speling,-0.1])
            cylinder(10,d=draaiknop_diameter_gat);  
            
            translate([rand_dikte+0.5+3,pcb_breedte/2+rand_dikte+speling-lengte_beeldscherm_connector_uitsparing/2,dikte_voorkant-hoogte_beeldscherm_connector_uitsparing]){
                cube([(lengte_scherm_pcb-lengte_scherm)/2,lengte_beeldscherm_connector_uitsparing,hoogte_beeldscherm_connector_uitsparing]);

                translate([lengte_scherm_pcb-(lengte_scherm_pcb-lengte_scherm)/2, 0, 0])
                cube([(lengte_scherm_pcb-lengte_scherm)/2,lengte_beeldscherm_connector_uitsparing,hoogte_beeldscherm_connector_uitsparing]);
            }

            translate([rand_dikte/2+3, rand_dikte/2+3, hoogte])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);

            translate([pcb_lengte+2*(rand_dikte+speling)-rand_dikte/2-3, rand_dikte/2+3,hoogte])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);

            translate([rand_dikte/2+3, pcb_breedte+2*(rand_dikte+speling)-rand_dikte/2-3, hoogte])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);

            translate([pcb_lengte+2*(rand_dikte+speling)-rand_dikte/2-3, pcb_breedte+2*(rand_dikte+speling)-rand_dikte/2-3, hoogte])
            brass_insert_hole(brass_insert_lengte,brass_insert_buiten_diameter);

            if(with_usb){
                translate([rand_dikte+speling,9.9,0]){
                    translate([30,0,hoogte-7.8-pcb_afstand])
                    rotate([0,-90,90]){
                        translate([0, -2.5, 0]) 
                        cylinder(10,d=8);
                        translate([0,0,5])
                        cube([8,5,10], true);
                        translate([0,2.5,0])
                        cylinder(10,d=8);
                    }

                    translate([30 + 14.5,0,hoogte-7.8-pcb_afstand])
                    rotate([0,-90,90]){
                        translate([0, -2.5, 0]) 
                        cylinder(10,d=8);
                        translate([0,0,5])
                        cube([8,5,10], true);
                        translate([0,2.5,0])
                        cylinder(10,d=8);
                    }
                }
            }

            translate([rand_dikte+0.5+pcb_lengte-18,9.9,hoogte-3.5-pcb_afstand-pcb_dikte])
            rotate([90,0,0])
            cylinder(10,d=7);

            edge(radius_kleine_rand,radius_grote_rand);

            translate([3,rand_dikte+speling+2*afstand_gat_pcb+gat_diameter,dikte_voorkant])
            cube([rand_dikte-3, pcb_breedte-4*afstand_gat_pcb-2*gat_diameter,hoogte]);
            
            translate([pcb_lengte+2*(rand_dikte+speling)-13,rand_dikte+speling+2*afstand_gat_pcb+gat_diameter,dikte_voorkant])
            cube([rand_dikte-3, pcb_breedte-4*afstand_gat_pcb-2*gat_diameter,hoogte]);

            translate([rand_dikte+speling+2*afstand_gat_pcb+gat_diameter, 3, dikte_voorkant])
            cube([pcb_lengte-4*afstand_gat_pcb-2*gat_diameter,rand_dikte-3,hoogte]);

            translate([rand_dikte+speling+2*afstand_gat_pcb+gat_diameter, pcb_breedte+2*(rand_dikte+speling)-13, dikte_voorkant])
            cube([pcb_lengte-4*afstand_gat_pcb-2*gat_diameter,rand_dikte-3,hoogte]);

            translate([(rand_dikte*2+speling*2+pcb_lengte)/2-30,6,dikte_voorkant-1])
            write(commit);

        }
    }
}

// $fn = 128;
$fn = 16;

front = false;
with_usb = true;

if (front) {
    voorkant(with_usb);
} else {
    achterkant();
}

module write(text) {
    linear_extrude(1)
    text(text, size=10);
}

module half_circle(r){
    difference(){
        circle(r);
        translate([0, r, 0]) {
            square(2*r, true);
        }
    }
}

module kwart_circle(r){
    difference(){
        circle(r);
        union(){
            translate([-r, -r, 0]) {
                square([r, r], false);
            }
            translate([0, r, 0]) {
                square(2*r, true);
            }
        }
    }
}