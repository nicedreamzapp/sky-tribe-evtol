// ============================================================
// MANNED QUAD eVTOL — V7 "REALISTIC STRUCTURE"
// Fixes Matt's notes (2026-07-14): arms/motor mounts looked
// fishy + cockpit "how would it work" + wants venting/airflow.
//
// REAL LOAD PATH: a central CF SPAR BOX carries everything —
// all 4 arms bolt to its 4 corners, the seat sits on it, the
// skids hang off it. Arms = tapered boom + brace to the SAME box
// (a true triangle to a real hardpoint, not poking into skin).
// Cockpit = open tub w/ floor pan, seat, panel, windscreen.
// COOLING: NACA side intakes -> battery box -> rear louvre
// exhaust; small scoops feed ESCs at the arm roots.
// Units mm, Z up. See PARTS_LIST_BOM.md for the matching BOM.
// ============================================================
$fn = 44;
rotor_plane = 1400;
rotor_dia   = 1575;
box_x = 1000;  box_y = 720;  box_z = 260;   // spar box
box_h = 250;                                 // box floor height

module boom(p1,p2,r1,r2){ hull(){ translate(p1) sphere(r1); translate(p2) sphere(r2); } }

// ---------- CENTRAL SPAR BOX (the real structure) ----------
module spar_box() {
    color([0.20,0.21,0.24]) {
        // 2 main spars (fore-aft) + 2 cross spars = torque box
        for (y=[-box_y/2, box_y/2])
            translate([0,y,box_h]) rotate([0,90,0]) cylinder(h=box_x,d=70,center=true);
        for (x=[-box_x/2, box_x/2])
            translate([x,0,box_h]) rotate([90,0,0]) cylinder(h=box_y,d=70,center=true);
        // corner hardpoint lugs (where arms bolt on)
        for (x=[-box_x/2,box_x/2]) for (y=[-box_y/2,box_y/2])
            translate([x,y,box_h]) sphere(60);
        // floor pan spanning the box
        translate([0,0,box_h-40]) cube([box_x+40,box_y+40,24],center=true);
    }
}

// ---------- ARM: boom + brace, both to the SAME corner lug ----------
module arm(f,s) {
    corner = [f*box_x/2, s*box_y/2, box_h];       // real hardpoint
    mp     = [f*1025,    s*1025,    rotor_plane];  // motor
    brace0 = [f*box_x/2*0.2, s*box_y/2*0.2, box_h+30]; // inboard box node
    color("silver") {
        boom(corner, [mp[0],mp[1],mp[2]-55], 40, 30);   // main boom
        boom(brace0, [ (corner[0]+mp[0])/2,(corner[1]+mp[1])/2,(corner[2]+mp[2])/2 ], 24, 20); // brace to mid-boom
        translate(corner) sphere(46);                    // bolted gusset
    }
    // ESC pod + cooling scoop at arm root
    color([0.12,0.12,0.13]) translate(corner+[f*60,s*60,60]) cube([150,90,80],center=true);
    color([0.3,0.5,0.7,0.6]) translate(corner+[f*140,s*60,60]) rotate([0,90,0]) cylinder(h=40,d=48,center=true);
    // motor U15XXL + prop
    color([0.13,0.13,0.13]) translate(mp) cylinder(h=95,d=150,center=true);
    color("gold") translate(mp) cylinder(h=99,d=118,center=true);
    color([0.9,0.9,0.9]) translate(mp+[0,0,52]) cylinder(h=14,d=60);   // prop hub
    color("black") translate(mp+[0,0,60]) rotate([0,0,f*35+s*55]) cube([rotor_dia,52,9],center=true);
    color("deepskyblue",0.10) translate(mp+[0,0,54]) cylinder(h=3,d=rotor_dia,center=true);
}

// ---------- COCKPIT TUB (open, with floor / panel / windscreen) ----------
module cockpit() {
    // sealed lower tub (also the float) around & below the spar box
    color([0.16,0.17,0.19]) hull() {
        translate([980,0,box_h-30]) rotate([0,16,0]) cube([300,360,150],center=true); // nose wedge
        translate([300,0,box_h-10]) cube([620,box_y+120,230],center=true);
        translate([-450,0,box_h])   cube([560,box_y+80,250],center=true);
        translate([-1050,0,box_h+40]) cube([160,300,180],center=true);                // tail
    }
    // seat (on the floor pan)
    color([0.05,0.05,0.05]) translate([90,0,box_h+120]) cube([440,460,40],center=true);
    color([0.05,0.05,0.05]) translate([-140,0,box_h+380]) rotate([0,-14,0]) cube([40,460,540],center=true);
    // instrument panel + sidestick
    color([0.1,0.1,0.12]) translate([430,0,box_h+230]) rotate([0,-28,0]) cube([40,440,220],center=true);
    color([0.7,0.05,0.05]) translate([430,0,box_h+230]) rotate([0,-28,0]) translate([22,0,0]) cube([6,300,120],center=true);
    color([0.2,0.2,0.22]) translate([250,-180,box_h+150]) cylinder(h=140,d=30);        // stick
    // windscreen + low canopy rails (open cockpit racer)
    color("lightcyan",0.32) hull() {
        translate([560,0,box_h+300]) rotate([0,26,0]) cube([300,440,30],center=true);
        translate([120,0,box_h+520]) cube([300,440,40],center=true);
        translate([-380,0,box_h+380]) rotate([0,-16,0]) cube([360,440,30],center=true);
    }
}

// ---------- COOLING: NACA side intakes + rear exhaust louvres ----------
module cooling() {
    // NACA-style flush intakes on the tub sides -> battery box
    color([0.05,0.15,0.30,0.8]) for (s=[-1,1])
        translate([250, s*(box_y/2+65), box_h]) rotate([0,0,s*90])
            scale([1,0.5,1]) cylinder(h=8,d=150,center=true);
    // rear exhaust louvres
    color([0.05,0.15,0.30,0.8]) for (i=[0:3])
        translate([-980, 0, box_h-40+i*45]) rotate([0,70,0]) cube([90,300,8],center=true);
    // battery inside the box (vented dry box)
    color("orange",0.85) translate([-80,0,box_h+10]) cube([620,box_y-120,200],center=true);
}

// ---------- HELICOPTER SKIDS (hang off the spar box) ----------
module skids() {
    color([0.14,0.14,0.14]) for (s=[-1,1]) {
        translate([-80,s*430,box_h-620]) rotate([0,90,0]) cylinder(h=2050,d=55,center=true);
        boom([920,s*430,box_h-620],[1260,s*430,box_h-450],27,24);
        for (x=[-box_x/2*0.8, box_x/2*0.8])
            boom([x,s*box_y/2, box_h-40],[x,s*430,box_h-605],26,24);
    }
}

module chute(){ color("crimson") translate([-820,0,box_h+250]) cylinder(h=200,d=150,center=true); }

// ---------- ASSEMBLY ----------
spar_box();
cockpit();
cooling();
for (f=[-1,1]) for (s=[-1,1]) arm(f,s);
skids();
chute();
