// ============================================================
// MANNED QUAD eVTOL — V5 (Matt's direction, 2026-07-13)
// - TRUSSED ARMS: straight main boom + diagonal brace per corner.
//   Triangulated = actually stiff and LOOKS stable (v3/v4 curved
//   gull arms rejected as "not stable").
// - WATER SIMPLIFIED: this is an AIRCRAFT that can land on water
//   and take off again (SwellPro model) — sealed buoyant hull,
//   potted electronics, motors high. NO thruster pod, NO boat
//   modes, NO pontoons, NO ballast. Retractable skids for land.
// Components: 4x U15XXL, 62" props @ 2.0 m rotor plane, 24S pack
// low/central, Veronte 4x, ballistic chute (exempt). Units mm, Z up.
// ============================================================
$fn = 40;
rotor_plane = 1400;   // Matt: just a bit above the cockpit (canopy tops ~1180)
rotor_dia = 1575;

// ---------- FUSELAGE (sealed, buoyant, mildly boat-bellied) ----------
module fuselage() {
    color("ivory") hull() {
        translate([1290,0,180]) scale([1.0,0.5,0.65]) sphere(95);    // nose
        translate([700,0,200])  scale([1.0,0.9,0.75]) sphere(330);
        translate([0,0,230])    scale([1.05,1.1,0.8]) sphere(420);
        translate([-800,0,210]) scale([1.0,1.0,0.78]) sphere(345);
        translate([-1260,0,250]) scale([0.7,0.9,0.95]) sphere(210);  // tail
        translate([50,0,-10])   scale([1.5,0.95,0.30]) sphere(420);  // sealed belly
    }
}

// ---------- HELICOPTER-STYLE SKIDS (Matt: real ground clearance) ----------
// belly bottom ~ -135; rails at -520 => ~0.4 m of air under the hull
module skids() {
    color([0.15,0.15,0.15]) for (s=[-1,1]) {
        translate([-100, s*440, -520]) rotate([0,90,0])
            cylinder(h=2100, d=55, center=true);                    // main rail
        boom([950, s*440, -520], [1300, s*440, -340], 27, 24);      // upswept nose
        for (x=[-560,560])                                          // struts
            boom([x, s*280, -40], [x, s*440, -505], 26, 24);
    }
}

// ---------- CANOPY (faired) ----------
module canopy() {
    color("lightcyan",0.35) hull() {
        translate([250,0,790]) scale([1.25,0.85,1.0]) sphere(390);
        translate([880,0,510]) scale([1.0,0.75,0.8]) sphere(190);
    }
}

// ---------- TRUSSED ARM (main boom + diagonal brace) ----------
module boom(p1, p2, r1, r2) {
    hull() { translate(p1) sphere(r1); translate(p2) sphere(r2); }
}
module truss_arm(f, s) {
    mp   = [f*1025, s*1025, rotor_plane];          // motor position
    high = [f*430,  s*370, 720];                   // upper shoulder root
    low  = [f*660,  s*460, 330];                   // lower hull root
    mid  = [f*760,  s*760, 1050];                  // brace meets boom here
    color("silver") {
        boom(high, [mp[0], mp[1], mp[2]-60], 42, 30);   // main boom
        boom(low,  mid, 26, 22);                        // diagonal brace
    }
    // gusset at root
    color("silver") translate(high) sphere(52);
    // motor: U15XXL
    color([0.13,0.13,0.13]) translate(mp) cylinder(h=95, d=150, center=true);
    color("gold") translate(mp) cylinder(h=99, d=118, center=true);
    // 62" prop + disc
    color("black") translate([mp[0],mp[1],mp[2]+58]) rotate([0,0,f*35+s*55])
        cube([rotor_dia,52,9], center=true);
    color("deepskyblue",0.10) translate([mp[0],mp[1],mp[2]+52])
        cylinder(h=3, d=rotor_dia, center=true);
}

// ---------- SYSTEMS ----------
module battery()  { color("orange",0.85) translate([-100,0,100]) cube([600,380,240], center=true); }
module avionics() { color("green",0.9)   translate([430,0,210])  cube([220,260,140], center=true); }
module seat() {
    color([0.05,0.05,0.05]) translate([120,0,340]) cube([430,470,40], center=true);
    color([0.05,0.05,0.05]) translate([-100,0,630]) rotate([0,-12,0]) cube([40,470,620], center=true);
}
module chute() { color("crimson") translate([-680,0,590]) cylinder(h=240, d=170, center=true); }

// ---------- ASSEMBLY ----------
fuselage(); canopy(); skids();
for (f=[-1,1]) for (s=[-1,1]) truss_arm(f, s);
battery(); avionics(); seat(); chute();
