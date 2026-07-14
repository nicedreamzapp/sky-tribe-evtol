// ============================================================
// MANNED QUAD eVTOL — V2 "SKY TRIBE" CONCEPT (amphibious)
// Rev 2026-07-13: rotors RAISED above canopy (bystander/spray
// safety), planing boat hull, foam sponsons, tail water thruster.
//
// Real components this model is sized around:
//   Motors:   4x T-Motor U15XXL KV29 (100 kg peak thrust ea, 24S, $1,999)
//   Props:    4x 62" (1575 mm) 2-blade carbon, NS62x24 class
//   ESCs:     4x FLAME 300A HV class, mounted in pylon roots
//   Autopilot: Embention Veronte 4x (triple-redundant, DAL B evidences)
//   Battery:  24S Li-ion ~14 kWh sealed/vented module, low & central
//   Chute:    ballistic parachute (Part 103 weight-EXEMPT)
//   Sponsons: foam-filled floats (Part 103 weight-EXEMPT as floats)
//
// MASS BUDGET (kg, honest first pass — 254 lb / 115.2 kg is the target):
//   motors 16.8 | props 4.8 | ESCs 4.4 | pylons/arms 12 | hull 28
//   battery 55 | avionics+wiring 8 | seat+harness 6 | canopy 6
//   thruster 5 | subtotal ~146 kg  (+ chute 9 exempt, sponsons 10 exempt)
//   >>> ~31 kg OVER Part 103 target — the engineering war is here. <<<
// All units mm. Y is up in the HTML viewer; Z is up here (OpenSCAD).
// ============================================================

// ---------- PARAMETERS ----------
rotor_dia    = 1575;   // 62" prop
motor_r      = 1450;   // rotor axis radius from centerline
rotor_plane  = 2100;   // rotor plane height above hull floor  << RAISED
pylon_root_h = 500;    // where pylons leave the hull shoulder
arm_od       = 60;
hull_len     = 2600;
hull_wid     = 900;
canopy_top   = 1600;
spons_len    = 2400;
spons_r      = 160;
spons_z      = -350;   // sponson centerline below hull floor
spons_y      = 750;    // half-spread
bat          = [600, 420, 260];
$fn = 48;

// ---------- HULL (carbon monocoque, planing belly) ----------
module hull_body() {
    color("ivory", 0.9) hull() {
        translate([ hull_len*0.42, 0, 250]) sphere(d=hull_wid*0.62);   // bow
        translate([ 0, 0, 300])            scale([1.5,1,0.75]) sphere(d=hull_wid);
        translate([-hull_len*0.45, 0, 180]) sphere(d=hull_wid*0.45);   // stern
        translate([ 0, 0, -80])            scale([1.35,0.92,0.3]) sphere(d=hull_wid); // planing pad
    }
    color("dimgray") translate([0,0,-190])                              // shallow V keel
        rotate([0,90,0]) cylinder(h=hull_len*0.72, d=140, center=true, $fn=3);
}

// ---------- CANOPY (polycarbonate, jettisonable) ----------
module canopy() {
    color("lightcyan", 0.30) translate([250, 0, canopy_top-620])
        scale([1.5, 0.95, 1]) sphere(d=820);
}

// ---------- SPONSONS (foam-filled floats — Part 103 exempt) ----------
module sponsons() {
    color("black", 0.9)
    for (y = [-spons_y, spons_y])
        translate([0, y, spons_z]) scale([spons_len/(2*spons_r), 1, 0.85])
            sphere(r=spons_r);
    // struts
    color("dimgray")
    for (y=[-spons_y,spons_y]) for (x=[-500,500])
        translate([x, y*0.92, spons_z/2]) cylinder(h=abs(spons_z), d=40, center=true);
}

// ---------- PYLON + MOTOR + ROTOR (x4, raised overhead) ----------
module rotor_unit(az) {
    rx = motor_r*cos(az); ry = motor_r*sin(az);
    // pylon from hull shoulder up & out to motor
    color("silver") hull() {
        translate([sign(rx)*350, sign(ry)*330, pylon_root_h]) sphere(d=arm_od);
        translate([rx, ry, rotor_plane-90]) sphere(d=arm_od);
    }
    // motor: U15XXL (finned can)
    color([0.15,0.15,0.15]) translate([rx,ry,rotor_plane-45])
        cylinder(h=90, d=150, center=true);
    color("gold") translate([rx,ry,rotor_plane-45])
        cylinder(h=94, d=120, center=true);
    // prop: 62" 2-blade
    color("black") translate([rx,ry,rotor_plane+15]) rotate([0,0,az*1.7])
        cube([rotor_dia, 55, 8], center=true);
    color("deepskyblue", 0.10) translate([rx,ry,rotor_plane+12])
        cylinder(h=4, d=rotor_dia, center=true);
}

// ---------- INTERIOR ----------
module battery()  { color("orange",0.85) translate([-200,0,60])  cube(bat, center=true); }
module avionics() { color("green", 0.9)  translate([400,0,150])  cube([220,260,140], center=true); } // Veronte 4x
module seat() {
    color([0.05,0.05,0.05]) translate([100,0,260]) cube([430,480,40], center=true);
    color([0.05,0.05,0.05]) translate([-120,0,560]) cube([40,480,640], center=true);
}
module chute()    { color("crimson")     translate([-700,0,620]) cylinder(h=260, d=180, center=true); } // ballistic, exempt
module thruster() {                                                    // water-mode pod
    color("navy") translate([-1350,0,-250]) rotate([0,90,0]) cylinder(h=340, d=130, center=true);
    color("black") translate([-1530,0,-250]) rotate([0,90,0]) cylinder(h=8, d=260, center=true);
}

// ---------- ASSEMBLY ----------
hull_body(); canopy(); sponsons();
for (a=[45,135,225,315]) rotor_unit(a);
battery(); avionics(); seat(); chute(); thruster();
