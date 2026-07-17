const box_h=250, SE=3.0;
const BS=[{x:1400,cy:box_h+70,w:45,h:55},{x:1050,cy:box_h+85,w:185,h:165},{x:650,cy:box_h+115,w:290,h:250},
 {x:150,cy:box_h+230,w:380,h:420},{x:-350,cy:box_h+215,w:375,h:415},{x:-800,cy:box_h+140,w:270,h:280},
 {x:-1250,cy:box_h+85,w:140,h:160},{x:-1650,cy:box_h+60,w:50,h:70}];
const at=x=>{const s=[...BS].sort((a,b)=>a.x-b.x);
 for(let i=0;i<s.length-1;i++)if(x>=s[i].x&&x<=s[i+1].x){const t=(x-s[i].x)/(s[i+1].x-s[i].x);
  return{cy:s[i].cy+t*(s[i+1].cy-s[i].cy),w:s[i].w+t*(s[i+1].w-s[i].w),h:s[i].h+t*(s[i+1].h-s[i].h)};}return null;};
const hw=(st,y)=>{const t=(y-st.cy)/st.h; if(Math.abs(t)>1)return 0;
  const s=Math.sign(t)*Math.pow(Math.abs(t),SE/2); return st.w*Math.pow(Math.sqrt(Math.max(0,1-s*s)),2/SE);};
let f=0;
function box(name,cx,cy,L,H,W){
  let bad=null;
  for(const dx of [-L/2,0,L/2]) for(const dy of [-H/2,H/2]){
    const st=at(cx+dx); if(!st){bad='beyond hull';continue;}
    const y=cy+dy;
    if(y<st.cy-st.h) bad=`floor y=${y.toFixed(0)} below belly ${(st.cy-st.h).toFixed(0)} at x=${(cx+dx).toFixed(0)}`;
    else if(y>st.cy+st.h) bad=`roof breach at x=${(cx+dx).toFixed(0)}`;
    else if(hw(st,y)<W/2) bad=`needs ${W/2}mm at y=${y.toFixed(0)} x=${(cx+dx).toFixed(0)}, hull gives ${hw(st,y).toFixed(0)}mm`;
  }
  if(bad)f++;
  console.log(`${bad?'FAIL':'OK  '} ${name.padEnd(26)} ${bad||'fits inside the skin'}`);
}
console.log("=== does the genset hardware physically fit? ===");
box('engine block',      -520, box_h+90, 360,330,340);
box('generator',         -770, box_h+90, 130,210,210);
box('fuel tank 5gal',     -80, box_h-60, 700,110,300);
box('buffer battery',     150, box_h-100,400, 90,220);
box('radiator (each side)',-300, box_h+180,380,260,44);
console.log("\n=== engine vs the pilot's seat back (x=-190, reclined) ===");
const engFwd=-520+180;
console.log(`${engFwd<-190?'OK  ':'FAIL'} engine front face at x=${engFwd} vs seat back x=-190 → ${(-190-engFwd).toFixed(0)}mm gap`);
if(engFwd>=-190)f++;
console.log("\n=== CG (rotors are centred on x=0) ===");
const items=[["airframe",118,0],["pilot",85,150],["chute",9,-790],["engine+gen",49,-560],["fuel",14,-80],["buffer",10,150],["radiator",14,-300]];
const m=items.reduce((a,b)=>a+b[1],0), mo=items.reduce((a,b)=>a+b[1]*b[2],0);
const cg=mo/m;
console.log(`all-up ${m} kg, CG at x=${cg.toFixed(0)} mm  → front rotors carry ${(Math.abs(cg)/1025*100).toFixed(1)}% more than the rear`);
const dry=items.filter(i=>i[0]!=='fuel');
const m2=dry.reduce((a,b)=>a+b[1],0), cg2=dry.reduce((a,b)=>a+b[1]*b[2],0)/m2;
console.log(`fuel burnt off:   CG moves to x=${cg2.toFixed(0)} mm → shift of only ${Math.abs(cg2-cg).toFixed(0)}mm (fuel sits on the CG)`);
console.log("\n=== thrust check ===");
for(const per of [60,70]){
  const T=8*per*0.88;
  console.log(`at ${per} kg/motor: T/W = ${(T/m).toFixed(2)}${(T/m)<1.5?'  *** TOO LOW ***':''}`);
}
console.log(`\n${f} FAIL`);
