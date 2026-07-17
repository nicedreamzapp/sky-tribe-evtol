const box_h=250, SE=3.0, SILL=600, GO=1.012;
const BS=[{x:1400,cy:box_h+70,w:45,h:55},{x:1050,cy:box_h+85,w:185,h:165},{x:650,cy:box_h+115,w:290,h:250},
 {x:150,cy:box_h+230,w:380,h:420},{x:-350,cy:box_h+215,w:375,h:415},{x:-800,cy:box_h+140,w:270,h:280},
 {x:-1250,cy:box_h+85,w:140,h:160},{x:-1650,cy:box_h+60,w:50,h:70}];
const at=x=>{const s=[...BS].sort((a,b)=>a.x-b.x);
 for(let i=0;i<s.length-1;i++)if(x>=s[i].x&&x<=s[i+1].x){const t=(x-s[i].x)/(s[i+1].x-s[i].x);
  return{cy:s[i].cy+t*(s[i+1].cy-s[i].cy),w:s[i].w+t*(s[i+1].w-s[i].w),h:s[i].h+t*(s[i+1].h-s[i].h)};}return null;};
console.log("what sticks out through the skin/glass?\n");
// [name, cx, cy, L, H]
const items=[
 ["instrument panel", 500, box_h+215, 50, 190],
 ["glass screen",     530, box_h+225, 10, 140],
 ["flight computer",  430, box_h+120, 180, 70],
 ["stick knob",       330, box_h+270, 60, 60],
 ["throttle",         315, box_h+190, 120, 26],
 ["seat headrest",   -300, box_h+490, 60, 150],
 ["chute canister",  -790, box_h+180, 170, 200],
];
for(const [n,cx,cy,L,H] of items){
  let bad=null;
  for(const dx of [-L/2,0,L/2]){
    const st=at(cx+dx); if(!st) continue;
    const top=cy+H/2, roof=st.cy+st.h;          // hull/glass outer surface at that station
    if(top>roof*1.0) bad=`top y=${top.toFixed(0)} vs body roof y=${roof.toFixed(0)} at x=${(cx+dx).toFixed(0)} → ${(top-roof).toFixed(0)}mm PROUD`;
  }
  console.log(`${bad?'*** OUT ***':'   ok    '} ${n.padEnd(18)} ${bad||''}`);
}
