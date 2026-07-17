// Honest hybrid BOM. Earlier I said "genset 44 kg" as if that covered the whole
// system — but a snowmobile engine ALONE is ~42 kg. Everything a running engine
// needs was quietly missing.
const battery=[["24S 13 kWh Li-ion pack",9000,58]];
const hybrid=[
 ["Engine — salvage snowmobile ~90 kW (derated hard)", 1800, 42],
 ["Generator — Emrax 188-class PM machine",            4800,  7],
 ["Rectifier / power electronics (3ph AC -> DC bus)",  1200,  4],
 ["Engine mounts + shaft coupling",                     500,  4],
 ["Radiator, pump, coolant, plumbing",                  900, 14],
 ["Fuel system — tank, pump, lines, vent (dry)",        400,  6],
 ["Exhaust + silencer",                                 200,  3],
 ["ECU + wiring + instrumentation",                     300,  2],
 ["Buffer battery 2 kWh (engine-out landing)",         1400, 10],
];
const sum=a=>a.reduce((s,x)=>[s[0]+x[1],s[1]+x[2]],[0,0]);
const [b$,bkg]=sum(battery), [h$,hkg]=sum(hybrid);
console.log("HYBRID SYSTEM");
for(const [n,c,k] of hybrid) console.log(`  ${n.padEnd(48)} ${('$'+c.toLocaleString()).padStart(7)}  ${k.toString().padStart(3)} kg`);
console.log(`  ${'TOTAL'.padEnd(48)} ${('$'+h$.toLocaleString()).padStart(7)}  ${hkg} kg`);
console.log(`\nBATTERY IT REPLACES\n  ${battery[0][0].padEnd(48)} ${('$'+b$.toLocaleString()).padStart(7)}  ${bkg} kg`);
console.log(`\nDELTA: ${(h$-b$>0?'+':'')}$${(h$-b$).toLocaleString()}  and  ${(hkg-bkg>0?'+':'')}${hkg-bkg} kg`);
console.log(`\n*** I previously told Matt "+4 kg". The real figure is +${hkg-bkg} kg. ***`);
console.log(`    That claim counted a 44 kg "genset" — but the engine alone is 42 kg,`);
console.log(`    and the radiator, rectifier, mounts, exhaust and fuel system were missing.`);

console.log("\n=== what that does to the aircraft ===");
const P1_EMPTY=176, P1_PACK=58;
const p3empty=P1_EMPTY-P1_PACK+hkg;
const fuel=14, pilot=85;
console.log(`P3 empty:  ${P1_EMPTY} - ${P1_PACK} + ${hkg} = ${p3empty} kg   (CAD currently claims 181 — wrong)`);
const auw=p3empty+pilot+fuel;
console.log(`P3 all-up: ${p3empty} + ${pilot} pilot + ${fuel} fuel = ${auw} kg  (P1 is 261)`);
for(const per of [60,70,80]){
  const T=8*per*0.88;
  console.log(`  T/W at ${per} kg/motor: ${(T/auw).toFixed(2)}${T/auw<1.5?'  *** TOO LOW ***':''}`);
}
console.log("\n=== does it still earn its place? ===");
const G=3.785,D=0.745,LHV=12.2;
for(const [name,eff,note] of [["4-stroke",0.25,""],["2-stroke (lighter engine, thirstier)",0.20,""]]){
  const e=5*G*D*LHV*eff;
  console.log(`${name.padEnd(38)} 5 gal -> ${e.toFixed(0)} kWh -> hover ${(e/52.4*60).toFixed(0)} min, cruise ${(e/41.4*60).toFixed(0)} min`);
}
console.log(`battery today                           13 kWh -> hover 12 min, cruise 15 min`);
console.log(`\ncost per extra minute aloft: $${((h$-b$)/(49-12)).toFixed(0)}/min of hover gained`);
