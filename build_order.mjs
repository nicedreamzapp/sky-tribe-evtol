const f=n=>'$'+n.toLocaleString();
// What does each milestone ACTUALLY need? The ladder already says M2 and M3 are
// unmanned and ballasted — so the cockpit, canopy, seat, chute and foil gear are
// not needed to prove the thing hovers. They are needed the day a human gets in.
const M1=[["1 motor",1100],["1 prop",420],["1 ESC",360],["thrust stand + load cells + logging",2500],["bench PSU / test pack",900]];
const M2=[["central spar box",2200],["4 arm booms",1360],["8 motors",8800],["4 coax prop pairs",3360],["4 ESC pairs",2880],
          ["battery 13 kWh",9000],["3 flight computers",900],["plain test skids (NOT the foil gear)",300],
          ["wiring / HV safety / fusing",1800],["tether rig, ballast, anchors",1500],["telemetry + cameras",1200]];
const M4=[["cockpit tub",3500],["framed canopy",1400],["seat + harness",600],["panel / stick / pedals",2300],
          ["ballistic parachute",5000],["hydrofoil landing gear",3400],["rear pusher",1500],["cargo bay",400]];
const show=(name,rows,note)=>{
  let t=0; console.log(`\n=== ${name} ===`);
  for(const [n,c] of rows){ t+=c; console.log(`  ${n.padEnd(40)} ${f(c).padStart(8)}`); }
  console.log(`  ${'TOTAL'.padEnd(40)} ${f(t).padStart(8)}   ${note}`);
  return t;
};
const a=show("STEP 1 — M1: does the motor make its number?", M1, "answers the only question that gates everything");
const b=show("STEP 2 — M2/M3: a FLYING PLATFORM, no cockpit", M2, "unmanned + ballasted. No human, so no cockpit needed");
const c=show("STEP 3 — M4/M5: everything a PERSON needs", M4, "only once it has hovered thousands of times");
console.log(`\n=== the point ===`);
console.log(`  fly-the-platform (steps 1+2):        ${f(a+b)}`);
console.log(`  the human-carrying half (step 3):    ${f(c)}`);
console.log(`  you can defer ${f(c)} until the machine has already proven it hovers.`);
console.log(`\n  And if M1 says the motor makes 50 kg instead of 70, you have spent ${f(a)}`);
console.log(`  finding out — not ${f(a+b+c)} building an aircraft around a motor that cannot lift it.`);
