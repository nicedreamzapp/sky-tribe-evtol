const box_h=250, RP=1400, SILL_Y=600, SE=3.0, GLASS_OUT=1.012;
const seY=a=>Math.sign(Math.sin(a))*Math.pow(Math.abs(Math.sin(a)),2/SE);
const BS=[{x:1400,cy:box_h+70,w:45,h:55},{x:1050,cy:box_h+85,w:185,h:165},{x:650,cy:box_h+115,w:290,h:250},
 {x:150,cy:box_h+230,w:380,h:420},{x:-350,cy:box_h+215,w:375,h:415},{x:-800,cy:box_h+140,w:270,h:280},
 {x:-1250,cy:box_h+85,w:140,h:160},{x:-1650,cy:box_h+60,w:50,h:70}];
const at=x=>{const s=[...BS].sort((a,b)=>a.x-b.x);
 for(let i=0;i<s.length-1;i++)if(x>=s[i].x&&x<=s[i+1].x){const t=(x-s[i].x)/(s[i+1].x-s[i].x);
  return{cy:s[i].cy+t*(s[i+1].cy-s[i].cy),w:s[i].w+t*(s[i+1].w-s[i].w),h:s[i].h+t*(s[i+1].h-s[i].h)};}return null;};
// THE FIX: half-width AT A GIVEN HEIGHT. The old audit compared parts against the
// station's MAXIMUM half-width, which is why a battery hanging out through the belly
// passed the check.
const hw=(st,y)=>{const t=(y-st.cy)/st.h; if(Math.abs(t)>1)return 0;
  const s=Math.sign(t)*Math.pow(Math.abs(t),SE/2); return st.w*Math.pow(Math.sqrt(Math.max(0,1-s*s)),2/SE);};
const belly=st=>st.cy-st.h;
let f=0,w=0; const chk=(n,st,d)=>{if(st==='FAIL')f++;if(st==='WARN')w++;console.log(`${st.padEnd(4)} ${n.padEnd(34)} ${d}`);};
const ok=(c)=>c?'OK':'FAIL';

// --- box fits inside the hull, checked at its OWN corners ---
function boxInHull(name,cx,cy,cz,L,H,W){
  let worst=null;
  for(const dx of [-L/2,0,L/2]) for(const dy of [-H/2,H/2]){
    const st=at(cx+dx); if(!st){worst='beyond hull';continue;}
    const y=cy+dy, avail=hw(st,y), need=W/2;
    if(y<belly(st)) worst=`floor y=${y.toFixed(0)} below belly ${belly(st).toFixed(0)} at x=${(cx+dx).toFixed(0)}`;
    else if(avail<need) worst=`needs ${need}mm at y=${y.toFixed(0)} x=${(cx+dx).toFixed(0)}, hull gives ${avail.toFixed(0)}mm`;
  }
  chk(name, ok(!worst), worst||'inside the skin at every corner');
}
// PILOT
const eye=box_h+460, helmet=eye+113;
const pil=at(-190);
chk('pilot head clears roof', ok(pil.cy+pil.h>helmet), `roof ${(pil.cy+pil.h).toFixed(0)} vs helmet ${helmet} → ${(pil.cy+pil.h-helmet).toFixed(0)}mm`);
chk('eye above sill', ok(eye>SILL_Y), `eye ${eye} vs sill ${SILL_Y} → ${eye-SILL_Y}mm`);
const ft=at(865);
chk('pilot FEET inside hull', ok(box_h-20-36>belly(ft)), `foot floor ${box_h-20-36} vs belly ${belly(ft).toFixed(0)} → ${(box_h-20-36-belly(ft)).toFixed(0)}mm`);
chk('feet within hull width', ok(hw(ft,box_h-56)>173), `hull ${hw(ft,box_h-56).toFixed(0)}mm vs foot edge 173mm`);
let cowl=0; for(let x=680;x<=1400;x+=10){const s=at(x); if(s&&s.cy+s.h>cowl)cowl=s.cy+s.h;}
chk('cowl below eye (fwd view)', ok(cowl<eye), `cowl ${cowl.toFixed(0)} vs eye ${eye}`);
// BATTERY (both configs)
boxInHull('P1 pack 1090x120x400', -80, box_h-65, 0, 1090,120,400);
boxInHull('P2 pack 430x110x380',  -80, box_h-65, 0, 430,110,380);
// pack vs seat pan
const packTop=box_h-65+60, panBot=box_h+35-25;
chk('pack clears the seat pan', ok(packTop<=panBot), `pack top ${packTop} vs pan underside ${panBot}`);
// SEAT + SPAR BOX
boxInHull('seat pan', 90, box_h+35, 0, 430,50,430);
for(const sx of [500,-500]) chk(`spar box corner x=${sx}`, ok(hw(at(sx),box_h)>290), `hull ${hw(at(sx),box_h).toFixed(0)}mm vs z=290mm`);
// ARMS vs GLASS
let armOk=true;
for(const [fs,ss] of [[1,1],[1,-1],[-1,1],[-1,-1]]){
  const c={x:fs*500,y:box_h,z:ss*290}, e={x:fs*820,y:box_h+90,z:ss*820}, m={x:fs*1025,y:RP-55,z:ss*1025};
  for(const [A,B] of [[c,e],[e,m]]) for(let i=0;i<=120;i++){const t=i/120;
    const x=A.x+(B.x-A.x)*t, y=A.y+(B.y-A.y)*t, z=Math.abs(A.z+(B.z-A.z)*t);
    if(x>-700&&x<680&&y>SILL_Y){const st=at(x); if(st&&z<hw(st,y)*GLASS_OUT) armOk=false;}}
}
chk('arms clear the canopy', ok(armOk), 'no boom enters the glass on any corner');
// PROPS
const propR=787;
chk('prop tip vs fuselage', ok(Math.hypot(1025,1025)-propR>Math.max(...BS.map(s=>s.w))), `tip ${(Math.hypot(1025,1025)-propR).toFixed(0)}mm vs body half-width ${Math.max(...BS.map(s=>s.w))}mm`);
chk('prop-to-prop', ok(2*propR<2050), `${(2050-2*propR).toFixed(0)}mm clear`);
const roof=Math.max(...BS.map(s=>s.cy+s.h*GLASS_OUT));
chk('rotor plane above canopy', ok(RP-225>roof), `lowest prop ${RP-225} vs roof ${roof.toFixed(0)} → ${(RP-225-roof).toFixed(0)}mm`);
chk('coax spacing >=0.25D', ok(400>=0.25*2*propR), `400mm vs ${(0.25*2*propR).toFixed(0)}mm`);
// GEAR + PUSHER
const GY=box_h-560;
chk('gear below belly', ok(GY<Math.min(...BS.map(belly))), `gear ${GY} vs lowest belly ${Math.min(...BS.map(belly)).toFixed(0)}`);
chk('pusher clears ground', ok((box_h+60)-406>-560), `disc bottom ${(box_h+60)-406} vs ground -560`);
// SHAPE
const len=1400-(-1650), wid=Math.max(...BS.map(s=>s.w))*2;
chk('fineness ratio', ok(len/wid>3.5), `${len}/${wid} = ${(len/wid).toFixed(2)}`);
console.log(`\n${f} FAIL, ${w} WARN`);
