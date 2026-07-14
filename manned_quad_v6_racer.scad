// ============================================================
// MANNED QUAD eVTOL — V6 "RACER TUB" (Matt: fuselage was weird,
// wants racing-drone look). Racing quads = low, tight, ANGULAR
// carbon monocoque: faceted wedge tub, raked low canopy, nothing
// bulbous. Keeps everything already approved:
//   - trussed arms (straight boom + diagonal brace)
//   - rotor plane 1400 mm (just above the cockpit)
//   - helicopter skids w/ upswept noses, ~0.4 m clearance
//   - sealed belly (can land on water & take off, SwellPro-style)
// Units mm, Z up.
// ============================================================
$fn = 40;
rotor_plane = 1400;
rotor_dia   = 1575;

module boom(p1, p2, r1, r2) {
    hull() { translate(p1) sphere(r1); translate(p2) sphere(r2); }
}

// ---------- ANGULAR RACING TUB (faceted carbon wedge) ----------
module tub() {
    color([0.16,0.17,0.19]) hull() {                       // carbon lower tub
        translate([1050,0,140]) rotate([0,18,0]) cube([340,300,150], center=true); // wedge nose
        translate([420,0,170])  cube([620,640,260], center=true);
        translate([-250,0,190]) cube([700,660,300], center=true);
        translate([-850,0,210]) rotate([0,-7,0]) cube([420,440,240], center=true);
        translate([-1180,0,260]) cube([150,280,170], center=true);  // tail
    }
    color("ivory") hull() {                                 // top deck panel
        translate([500,0,330])  cube([500,540,60], center=true);
        translate([-350,0,360]) cube([620,560,70], center=true);
        translate([-1150,0,330]) cube([120,240,50], center=true);
    }
}

// ---------- LOW RAKED CANOPY (racing pod) ----------
module canopy() {
    color("lightcyan",0.38) hull() {
        translate([620,0,420])  rotate([0,22,0]) cube([340,430,40], center=true); // windscreen
        translate([90,0,700])   cube([340,430,60], center=true);                  // crown
        translate([-450,0,560]) rotate([0,-18,0]) cube([420,430,50], center=true);// fastback
    }
}

// ---------- TRUSSED ARMS (approved) ----------
module truss_arm(f, s) {
    mp   = [f*1025, s*1025, rotor_plane];
    high = [f*430,  s*330, 420];
    low  = [f*660,  s*420, 160];
    mid  = [f*760,  s*740, 1000];
    color("silver") {
        boom(high, [mp[0], mp[1], mp[2]-60], 42, 30);
        boom(low,  mid, 26, 22);
    }
    color("silver") translate(high) sphere(52);
    color([0.13,0.13,0.13]) translate(mp) cylinder(h=95, d=150, center=true);
    color("gold") translate(mp) cylinder(h=99, d=118, center=true);
    color("black") translate([mp[0],mp[1],mp[2]+58]) rotate([0,0,f*35+s*55])
        cube([rotor_dia,52,9], center=true);
    color("deepskyblue",0.10) translate([mp[0],mp[1],mp[2]+52])
        cylinder(h=3, d=rotor_dia, center=true);
}

// ---------- HELICOPTER SKIDS (approved) ----------
module skids() {
    color([0.15,0.15,0.15]) for (s=[-1,1]) {
        translate([-100, s*440, -480]) rotate([0,90,0])
            cylinder(h=2100, d=55, center=true);
        boom([950, s*440, -480], [1300, s*440, -300], 27, 24);
        for (x=[-560,560])
            boom([x, s*300, 20], [x, s*440, -465], 26, 24);
    }
}

// ---------- SYSTEMS ----------
module battery()  { color("orange",0.85) translate([-150,0,120]) cube([600,380,220], center=true); }
module avionics() { color("green",0.9)   translate([430,0,190])  cube([220,260,130], center=true); }
module seat() {
    color([0.05,0.05,0.05]) translate([120,0,300]) cube([430,460,40], center=true);
    color([0.05,0.05,0.05]) translate([-110,0,560]) rotate([0,-14,0]) cube([40,460,560], center=true);
}
module chute() { color("crimson") translate([-780,0,430]) cylinder(h=200, d=160, center=true); }

// ---------- ASSEMBLY ----------
tub(); canopy(); skids();
for (f=[-1,1]) for (s=[-1,1]) truss_arm(f, s);
battery(); avionics(); seat(); chute();
