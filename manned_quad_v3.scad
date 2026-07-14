// ============================================================
// MANNED QUAD eVTOL — V3 "SKY TRIBE" (shape-language rev)
// v2 -> v3: same layout, NATURAL FORM:
//   - lofted boat hull (real bow, sheer line, transom stern)
//   - canopy faired into the deck (no floating bubble)
//   - gull-wing CURVED arms sweeping up to the motors
//   - catamaran sponsons with up-swept bows
// Components unchanged: 4x U15XXL, 62" props, rotor plane 2.0 m,
// 24S battery low/central, Veronte 4x, ballistic chute, pod thruster.
// Units mm, Z up.
// ============================================================
$fn = 40;

rotor_r_pos  = 1450;    // rotor axis radius from centerline
rotor_plane  = 2000;
rotor_dia    = 1575;

// ---------- LOFTED HULL ----------
module hull_body() {
    color("ivory") hull() {
        translate([1290,0,140]) scale([1.0,0.5,0.7])  sphere(90);    // bow point
        translate([700,0,180])  scale([1.0,0.85,0.75]) sphere(330);
        translate([0,0,220])    scale([1.05,1.0,0.82]) sphere(430);
        translate([-800,0,200]) scale([1.0,0.9,0.8])   sphere(350);
        translate([-1250,0,240]) scale([0.75,0.95,1.0]) sphere(215); // transom
        translate([0,0,-40])    scale([1.5,0.88,0.30]) sphere(430);  // planing belly
    }
    color("dimgray") translate([100,0,-135]) rotate([45,0,0])        // shallow V keel
        cube([1900,140,140], center=true);
}

// ---------- CANOPY (faired teardrop on the deck) ----------
module canopy() {
    color("lightcyan",0.35) hull() {
        translate([250,0,760]) scale([1.25,0.85,1.0]) sphere(390);
        translate([880,0,480]) scale([1.0,0.75,0.8]) sphere(190);
    }
}

// ---------- GULL-WING ARM (smooth bezier sweep root->tip) ----------
function bez(t,p0,p1,p2) = [for(i=[0:2]) (1-t)*(1-t)*p0[i] + 2*(1-t)*t*p1[i] + t*t*p2[i]];

module gull_arm(fore, side) {
    root = [fore*480, side*400, 420];
    tip  = [fore*1025, side*1025, rotor_plane-60];
    ctrl = [fore*760, side*880, 900];   // bulge out then up
    pts  = [for(t=[0:0.084:1.001]) bez(t, root, ctrl, tip)];
    color("silver")
    for (i=[0:len(pts)-2])
        hull() {
            translate(pts[i])   sphere(44 - 14*(i/(len(pts)-1)));
            translate(pts[i+1]) sphere(44 - 14*((i+1)/(len(pts)-1)));
        }
    // motor pod + prop
    mp = [fore*1025, side*1025, rotor_plane];
    color([0.13,0.13,0.13]) translate(mp) cylinder(h=95, d=150, center=true);
    color("gold") translate(mp) cylinder(h=99, d=118, center=true);
    color("black") translate([mp[0],mp[1],mp[2]+58]) rotate([0,0,fore*35+side*55])
        scale([1,1,0.8]) cube([rotor_dia,52,9], center=true);
    color("deepskyblue",0.10) translate([mp[0],mp[1],mp[2]+52])
        cylinder(h=3, d=rotor_dia, center=true);
}

// ---------- CATAMARAN SPONSONS (up-swept bows) ----------
module sponson(side) {
    color([0.08,0.08,0.08]) hull() {
        translate([1150, side*700, -300]) sphere(100);
        translate([500,  side*740, -350]) scale([1.6,1,0.9]) sphere(140);
        translate([-500, side*745, -350]) scale([1.6,1,0.9]) sphere(140);
        translate([-1150,side*710, -305]) sphere(105);
    }
    color("dimgray") for (x=[-520,520])                      // faired struts
        translate([x, side*560, -60]) rotate([side*-32,0,0])
            scale([1,0.45,1]) cylinder(h=520, d=110, center=true);
}

// ---------- INTERIOR / SYSTEMS ----------
module battery()  { color("orange",0.85) translate([-150,0,60])  cube([600,420,260], center=true); }
module avionics() { color("green",0.9)   translate([430,0,180])  cube([220,260,140], center=true); }
module seat() {
    color([0.05,0.05,0.05]) translate([120,0,300]) cube([430,470,40], center=true);
    color([0.05,0.05,0.05]) translate([-100,0,590]) rotate([0,-12,0]) cube([40,470,620], center=true);
}
module chute()    { color("crimson") translate([-680,0,560]) cylinder(h=240, d=170, center=true); }
module thruster() {
    color("navy") translate([-1330,0,-160]) rotate([0,90,0]) cylinder(h=300, d=120, center=true);
    color("black") translate([-1495,0,-160]) rotate([0,90,0]) cylinder(h=8, d=230, center=true);
}

// ---------- ASSEMBLY ----------
hull_body(); canopy();
for (f=[-1,1]) for (s=[-1,1]) gull_arm(f, s);
for (s=[-1,1]) sponson(s);
battery(); avionics(); seat(); chute(); thruster();
