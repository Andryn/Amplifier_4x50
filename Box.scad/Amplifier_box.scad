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
        minkowski()
        {
            translate([tls,tls,0]) cube([a,b,c]);
            cylinder(r=tls,h=tls);
        }
        translate([tls,tls,tls]) cube([a,b,c]);
    }
}
module     stand() {
//стойки для платы
    difference() {
        translate([0,0,0]) cylinder(d=8,h=5);
        translate([0,0,0]) cylinder(d=3,h=5);
    }
}

module ear() {
//крепежные уши
    difference() {
        union() {
            translate([0,b/3/2,0]) cylinder(d=b/3,h=tls);
            translate([0,0,0]) cube([b/3/2,b/3,tls]);
        }
        translate([0,b/3/2,0]) cylinder(d=5,h=tls);
    }
}
module hole1() {
//отверстие под провода по длинной стороне
    rotate ([90,0,0]) cylinder(d=4,h=tls);
    
}

module hole2() {
//отверстие под провода по короткой
    rotate ([0,90,0]) cylinder(d=4,h=tls);
    
}

module hole3() {
//отверстие под крышку
    rotate ([0,90,0]) cylinder(d=3.5,h=tls);
    
}
difference() {
    union() {
        box(); //коробка
        ///стойки для платы
        translate([a2,b2,tls]) stand();
        translate([a3,b3_1,tls]) stand();
        translate([a3,b3_2,tls]) stand();
        //крепежные уши
        translate([-b/3/2,b/2-b/3/2+tls,0]) ear();
        translate([a-tls+b/3-0.2,b/2-b/3/2+tls,tls]) rotate ([0,180,0]) ear();
    }
    t1=14.5+4.5+tls;
    translate([t1,tls,10+tls]) hole1();
    t2=t1+5;
    translate([t2,tls,10+tls]) hole1();
    t3=t2+6;
    translate([t3,tls,10+tls]) hole1();
    t4=t3+5;
    translate([t4,tls,10+tls]) hole1();
    t5=t4+5;
    translate([t5,tls,10+tls]) hole1();
    t6=t5+5;
    translate([t6,tls,10+tls]) hole1();
    t7=t6+5;
    translate([t7,tls,10+tls]) hole1();
    t8=t7+5;
    translate([t8,tls,10+tls]) hole1();
    t9=t8+5;
    translate([t9,tls,10+tls]) hole1();
    t10=t9+5;
    translate([t10,tls,10+tls]) hole1();
    t11=t10+5;
    translate([t11,tls,10+tls]) hole1();
    t12=t11+6;
    translate([t12,tls,10+tls]) hole1();
    t13=t12+5;
    translate([t13,tls,10+tls]) hole1();

    tt1=b2+9.5;
    translate([0,tt1,10+tls]) hole2();
    tt2=tt1+5;
    translate([0,tt2,10+tls]) hole2();
    tt3=tt2+5;
    translate([0,tt3,10+tls]) hole2();
    translate([0,b2,c-2-2]) hole2();
    translate([tls+a,b2,c-2-2]) hole2();
    
    translate([a2+25,53,2.5+5+tls]) cube(43,30,42);
}


