tls=3;

b1=47;
a1=83;
a=93;
b=55;
c=32;

a2=tls+(a-a1)/2;
b2=tls+b/2;

a3=tls+a-(a-a1)/2;
b3_1=tls+(b-b1)/2;
b3_2=tls+b-(b-b1)/2;

$fn=128;

module box() {
//коробка
    difference() {
        union() {
            minkowski()
            {
                translate([tls,tls,0]) cube([a,b,tls/2]);
                cylinder(r=tls,h=tls/2);
            }
            translate([tls+0.1,tls+0.1,tls]) cube([a-0.1,b-0.1,tls]);
        }
        translate([tls*2,tls*2,tls]) cube([a-tls*2,b-tls*2,tls]);
    }
}

module ear() {
//крепежные уши
    d1=10;
    translate([0,-d1/2,d1/2]) rotate ([0,90,0]) {
        difference() {

            union() {
                translate([0,d1/2,0]) cylinder(d=d1,h=tls);
                translate([0,0,0]) cube([d1/2,d1,tls]);
            }
            //translate([0,d1/2,0]) cylinder(d=3,h=tls);
        }
    }
}

difference() {
    union() {
        box(); //коробка

        //крепежные уши
        translate([tls,b/2+tls,2*tls-0.1]) ear();
        translate([a,b/2+tls,2*tls-0.1]) ear();
        
    }
    translate([a3-25-43,53,0]) cube(43,30,42);
}


