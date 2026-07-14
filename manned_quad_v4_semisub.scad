// ============================================================
// MANNED QUAD eVTOL — V4 "SEMI-SUB" study (Matt's call: NO pontoons)
// The hull IS the flotation: semi-submersible stance, flared hard
// chines for roll stability, water-ballast tanks to squat low in
// boat mode and purge before takeoff (pump + valves, ~3 kg).
// Blades stay overhead; water propulsion = airboat mode on the lift
// props + optional stern pod. Rendered with waterline slab to show
// the semi-submerged stance. Units mm, Z up.
// ============================================================
$fn = 40;
rotor_plane = 2000;  rotor_dia = 1575;
WATERLINE = 260;     // semi-submerged: water sits at deck-chine level

// ---------- LOFTED HULL with flared chines (no pontoons) ----------
module hull_body() {
    color("ivory") hull() {
        translate([1290,0,160]) scale([1.0,0.55,0.7])  sphere(95);   // bow
        translate([700,0,190])  scale([1.0,1.0,0.75])  sphere(340);
        translate([0,0,210])    scale([1.05,1.35,0.80]) sphere(440); // chine flare
        translate([-800,0,200]) scale([1.0,1.25,0.78])  sphere(360); // chine flare
        translate([-1270,0,240]) scale([0.7,1.0,0.95])  sphere(220); // transom
        translate([0,0,-30])    scale([1.5,1.05,0.30])  sphere(440); // planing belly
    }
    color("dimgray") translate([100,0,-125]) rotate([45,0,0])
        cube([1900,140,140], center=true);
    // retractable beaching skids (land stance)
    color([0.2,0.2,0.2]) for (y=[-380,380]) for (x=[-620,620])
        translate([x,y,-215]) cylinder(h=170, d=46, center=true);
}

// ---------- CANOPY ----------
module canopy() {
    color("lightcyan",0.35) hull() {
        translate([250,0,780]) scale([1.25,0.85,1.0]) sphere(390);
        translate([880,0,500]) scale([1.0,0.75,0.8]) sphere(190);
    }
}

// ---------- GULL-WING ARMS + ROTORS ----------
function bez(t,p0,p1,p2) = [for(i=[0:2]) (1-t)*(1-t)*p0[i] + 2*(1-t)*t*p1[i] + t*t*p2[i]];
module gull_arm(fore, side) {
    root = [fore*480, side*430, 430];
    tip  = [fore*1025, side*1025, rotor_plane-60];
    ctrl = [fore*760, side*900, 920];
    pts  = [for(t=[0:0.084:1.001]) bez(t, root, ctrl, tip)];
    color("silver") for (i=[0:len(pts)-2]) hull() {
        translate(pts[i])   sphere(44 - 14*(i/(len(pts)-1)));
        translate(pts[i+1]) sphere(44 - 14*((i+1)/(len(pts)-1)));
    }
    mp = [fore*1025, side*1025, rotor_plane];
    color([0.13,0.13,0.13]) translate(mp) cylinder(h=95, d=150, center=true);
    color("gold") translate(mp) cylinder(h=99, d=118, center=true);
    color("black") translate([mp[0],mp[1],mp[2]+58]) rotate([0,0,fore*35+side*55])
        cube([rotor_dia,52,9], center=true);
    color("deepskyblue",0.10) translate([mp[0],mp[1],mp[2]+52])
        cylinder(h=3, d=rotor_dia, center=true);
}

// ---------- WATER BALLAST TANKS (squat low / purge to fly) ----------
module ballast() {
    color("cyan",0.55) for (y=[-300,300])
        translate([-350,y,20]) cube([700,160,180], center=true);
}

// ---------- INTERIOR / SYSTEMS ----------
module battery()  { color("orange",0.85) translate([-100,0,90])  cube([600,380,240], center=true); }
module avionics() { color("green",0.9)   translate([430,0,200])  cube([220,260,140], center=true); }
module seat() {
    color([0.05,0.05,0.05]) translate([120,0,330]) cube([430,470,40], center=true);
    color([0.05,0.05,0.05]) translate([-100,0,620]) rotate([0,-12,0]) cube([40,470,620], center=true);
}
module chute()    { color("crimson") translate([-680,0,580]) cylinder(h=240, d=170, center=true); }
module stern_pod() {
    color("navy") translate([-1360,0,-60]) rotate([0,90,0]) cylinder(h=280, d=115, center=true);
    color("black") translate([-1515,0,-60]) rotate([0,90,0]) cylinder(h=8, d=220, center=true);
}

// ---------- WATER (semi-submerged stance visual) ----------
module water() {
    color([0.12,0.38,0.55,0.45]) translate([0,0,WATERLINE-1500])
        cube([9000,9000,3000], center=true);
}

// ---------- ASSEMBLY ----------
// Matt 2026-07-13: like the RC waterproof drones (SwellPro class) —
// land IN the water, float naturally low on the sealed hull, take off
// straight from the surface. PASSIVE buoyancy sets the waterline
// (220 kg needs 220 L submerged; this hull has ~3x that volume, so it
// floats with roughly the bottom third wet — same stance as the RC
// ones). Ballast tanks deleted: not needed, the drones don't have them.
hull_body(); canopy();
for (f=[-1,1]) for (s=[-1,1]) gull_arm(f, s);
battery(); avionics(); seat(); chute(); stern_pod();
water();
