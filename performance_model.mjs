// Consistent model. My earlier passes had two errors:
//  1. I divided (induced + profile) by Figure of Merit — but FoM ALREADY includes
//     profile losses, so profile was counted twice.
//  2. I quoted SHAFT power as if it were battery draw. The battery pays ELECTRICAL
//     power: shaft / (motor x ESC efficiency).
const rho=1.225,g=9.81,A=7.79,FoM=0.72,coax=1.12,ELEC=0.88,CDA=0.60,TIP=120;
const MPH=v=>v*2.23694;
function shaftKW(W,V,pusher){
  const D=0.5*rho*V*V*CDA;
  const tilt=pusher?0:Math.atan(D/(W*g));
  const T=W*g/Math.cos(tilt);
  const vh2=T/(2*rho*A), vh=Math.sqrt(vh2);
  const Pideal_h=T*vh;                       // hover ideal
  const Ppro_h=Pideal_h*(1/FoM-1);           // what FoM implies profile costs in hover
  let vi=vh; for(let i=0;i<400;i++) vi=vh2/Math.sqrt(V*V+vi*vi);
  const mu=V/TIP;
  const Pi=T*vi;
  const Ppro=Ppro_h*(1+4.6*mu*mu);
  const Ppar=D*V;
  const rotor=(Pi+Ppro+(pusher?0:Ppar/0.70))*coax;
  const push=pusher?Ppar/0.82:0;
  return {shaft:(rotor+push)/1000, mu};
}
const elec=(W,V,p)=>shaftKW(W,V,p).shaft/ELEC;
function report(name,W,pusher,kwh,usable=0.80){
  const E=kwh*usable;
  const hov=elec(W,0.001,pusher);
  console.log(`\n=== ${name} — ${W} kg all-up, ${kwh} kWh (${E.toFixed(1)} kWh usable @ ${usable*100}%) ===`);
  console.log(`HOVER: ${hov.toFixed(1)} kW electrical → ${(E/hov*60).toFixed(1)} min`);
  let best=null, bestR=null;
  for(let V=2;V<=40;V+=0.5){
    const s=shaftKW(W,V,pusher); if(s.mu>0.30) break;
    const p=s.shaft/ELEC, t=E/p*60, r=t/60*MPH(V);
    if(!best||t>best.t) best={V,p,t};
    if(!bestR||r>bestR.r) bestR={V,p,r,t};
  }
  console.log(`MAX FLIGHT TIME: ${best.t.toFixed(1)} min  — loitering at ${MPH(best.V).toFixed(0)} mph on ${best.p.toFixed(1)} kW`);
  console.log(`MAX RANGE:       ${bestR.r.toFixed(1)} miles — at ${MPH(bestR.V).toFixed(0)} mph (${bestR.t.toFixed(1)} min aloft)`);
  return {hov,best,bestR};
}
report('P1 "the fat crazy one"',261,true,13);
report('P2 "the light one"',209,false,5);
console.log("\n=== if we ever close the genset (fuel is Part-103 exempt) ===");
report('P1 + 5 gal petrol via genset (~18 kWh usable-equivalent)',261,true,18/0.8,0.80);
