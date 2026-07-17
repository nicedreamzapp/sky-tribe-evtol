const f=n=>'$'+n.toLocaleString();
console.log("=== 1. ONE AIRCRAFT, PARTS ONLY ===");
const p1=46600, p1hi=53800;
console.log(`P1 (battery)      ${f(p1)}  — up to ${f(p1hi)} if the motors turn out to be U15XXL-class`);
console.log(`P3 (hybrid)       ${f(p1-9000+11500)}  — same airframe, battery swapped for the genset`);
console.log(`P2 (light)        ${f(p1-9000+3500-1500)}  — smaller pack, no pusher`);

console.log("\n=== 2. WHAT THE PARTS LIST DOES NOT INCLUDE ===");
const missing=[
 ["Thrust stand + load cells + logging (M1 — the gate)", 2500],
 ["Tether rig, ballast, anchors (M2/M3)",                1500],
 ["Carbon layup: moulds, vacuum, oven/consumables",      8000],
 ["Machining / fab of spar box + fittings",              6000],
 ["Wiring, connectors, HV safety gear, fusing",          1800],
 ["Ground station, telemetry, cameras",                  1200],
 ["Spares — props, ESCs, one motor",                     4000],
 ["Crash allowance (M2/M3 WILL break things)",           8000],
 ["Insurance / hangar / transport",                      3000],
];
let m=0; for(const [n,c] of missing){ m+=c; console.log(`  ${n.padEnd(52)} ${f(c).padStart(8)}`); }
console.log(`  ${'SUBTOTAL'.padEnd(52)} ${f(m).padStart(8)}`);

console.log("\n=== 3. THE PROGRAM AS ACTUALLY SCOPED (P1 then P2) ===");
const scen=[
 ["P1 parts (battery)",            p1],
 ["everything above",              m],
];
let t=scen.reduce((a,b)=>a+b[1],0);
for(const [n,c] of scen) console.log(`  ${n.padEnd(52)} ${f(c).padStart(8)}`);
console.log(`  ${'P1 FLYING, ALL IN'.padEnd(52)} ${f(t).padStart(8)}`);
console.log(`  ${'+ P2 second airframe (reuses stand/moulds/tooling)'.padEnd(52)} ${f(p1-9000+3500-1500+6000).padStart(8)}`);
console.log(`  ${'+ P3 genset conversion of P1'.padEnd(52)} ${f(11500).padStart(8)}`);
const grand=t+(p1-9000+3500-1500+6000)+11500;
console.log(`  ${'WHOLE PROGRAM'.padEnd(52)} ${f(grand).padStart(8)}`);

console.log("\n=== 4. CHEAPEST PATH TO THE ONLY QUESTION THAT MATTERS ===");
console.log(`  ONE motor + prop + ESC + thrust stand:  ${f(2000+840/2+720/2+2500)}`);
console.log("  That is M1. It answers whether ANY of this flies, before the big money.");
console.log("\n  Everything above is estimate, not quotes. Labour is $0 — it assumes you build it.");
