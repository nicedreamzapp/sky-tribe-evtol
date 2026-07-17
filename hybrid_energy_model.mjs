// Is fuel actually the answer? Check it properly instead of repeating the slogan.
const GAL=3.785, DENS=0.745, LHV=12.2;      // L/gal, kg/L, kWh/kg (lower heating value)
const HOVER=52.4, CRUISE=41.4;              // kW ELECTRICAL (corrected model)
function fuelKWh(gal, eff){ return gal*GAL*DENS*LHV*eff; }
console.log("=== what 5 gallons is actually worth ===");
const kg5=5*GAL*DENS;
console.log(`5 US gal = ${kg5.toFixed(1)} kg of petrol = ${(kg5*LHV).toFixed(0)} kWh THERMAL`);
console.log("genset efficiency turns that into electricity:");
for(const eff of [0.18,0.22,0.25,0.30]){
  const e=fuelKWh(5,eff);
  console.log(`  ${(eff*100).toFixed(0)}% → ${e.toFixed(0)} kWh elec → hover ${(e/HOVER*60).toFixed(0)} min · cruise ${(e/CRUISE*60).toFixed(0)} min`);
}
console.log("\n(My earlier '5 gal ≈ 18 kWh' assumed ~10% efficiency — too pessimistic.");
console.log(" Real small gensets run 20-30%. So fuel is worth MORE than I said.)");

console.log("\n=== but the genset has to be big enough to HOVER ===");
console.log(`hover needs ${HOVER} kW electrical — a genset sized for cruise alone cannot hold a hover.`);
for(const [name,kw,kg] of [["Pegasus GE70",4,3.5],["Turbotech TG-R90",85,64]]){
  console.log(`  ${name.padEnd(18)} ${kw} kW / ${kg} kg → ${kw>=HOVER?'covers hover':'TOO SMALL for hover'}`);
}
const need=52, dens=1.2;                    // kW/kg for a purpose-built genset
console.log(`  a right-sized ~${need} kW genset at ${dens} kW/kg ≈ ${(need/dens).toFixed(0)} kg (does not exist off the shelf)`);

console.log("\n=== weight ledger: battery vs hybrid (things that COUNT under Part 103) ===");
const battery={pack:58};
const hybrid={genset:44, buffer:10, fuelsys:8};
const hSum=Object.values(hybrid).reduce((a,b)=>a+b);
console.log(`battery-only : ${battery.pack} kg counted → 13 kWh`);
console.log(`hybrid       : genset 44 + buffer 10 + fuel system 8 = ${hSum} kg counted`);
console.log(`               + ${kg5.toFixed(0)} kg of fuel that Part 103 does NOT count`);
console.log(`               → ${fuelKWh(5,0.25).toFixed(0)} kWh + 2 kWh buffer = ${(fuelKWh(5,0.25)+2).toFixed(0)} kWh`);
console.log(`weight delta : ${(hSum-battery.pack>0?'+':'')}${(hSum-battery.pack).toFixed(0)} kg for ${((fuelKWh(5,0.25)+2)/13).toFixed(1)}x the energy`);

console.log("\n=== P1 is Experimental — the 5 gal cap does NOT apply to it ===");
for(const g of [5,10,15]){
  const e=fuelKWh(g,0.25);
  console.log(`  ${g.toString().padStart(2)} gal (${(g*GAL*DENS).toFixed(0)} kg) → ${e.toFixed(0)} kWh → cruise ${(e/CRUISE*60).toFixed(0)} min`);
}
