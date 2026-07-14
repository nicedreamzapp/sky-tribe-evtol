# Round 2 — Water Tech · Racing Science · Batteries · Defense
**Date:** July 14, 2026 · **Method:** 106-agent sweep, 3-vote adversarial verification per claim. Permanent project reference — lives with the CAD.

## The four answers in one breath
Water landing is proven engineering (two-tier sealing, float-clear-then-launch). Racing speed does NOT scale — a manned quad cruises 50–65 mph no matter how much power you install. The Part 103 weight budget **demonstrably closes** (Jetson ONE = 253 lb with batteries). And the defense market is a documented ladder that starts at a $75k SBIR grant.

## 1. Water-capable drone technology (all verified 3-0)
- **The two-tier rule:** motors run WET with corrosion-resistant coatings; everything sensitive (avionics, battery) lives in sealed dry compartments. Don't waterproof every component — split wet-side/dry-side. JHU-APL's CRACUNS coated motors survived **2 months submerged in saltwater** with zero corrosion, running while submerged.
- **SwellPro SplashDrone 4** (best commercial water drone): IP67 body + coated ordinary hobby motors/ESCs — the coating is the magic, not exotic parts. Its **PowerFlip self-righting is active motor thrust** (3-second stick command), not passive shape — a capsized craft floats stable inverted until commanded to flip.
- **Never power through the water surface:** rotors see ~12–15% thrust fluctuation at the air-water interface. Every proven design **floats fully clear first, then takes off entirely in air** (Loon Copter pumps ballast, floats up, then lifts). Our sealed-hull + rotors-above-deck layout is exactly the validated architecture.
- **TJ-FlyingFish** (ICRA 2023, peer-reviewed): true air/water hybrid using T-Motor hobby parts — tilting motor pods with a 12:1 gear shift for underwater torque. Proof the dual-medium concept is real — at 1.6 kg. **Caveat that gates everything:** all of this is proven at 1–3 kg scale; at U15XXL scale, coating durability and bearing life must be re-proven on OUR thrust stand.
- **Refuted (do not repeat):** CRACUNS "launches from depth" (overstated) and the Naviator stacked-rotor water-exit story (0-3) — re-research before citing.

## 2. Racing-drone science, scaled (verified 3-0)
- **The hard ceiling:** peer-reviewed rotorcraft analysis puts a wingless multirotor's efficient cruise at **~56 mph**, with the power curve going near-vertical past ~100 mph (>300 kW). Our realistic cruise: **50–65 mph regardless of installed power.** The 2:1 thrust-to-weight buys climb authority and control crispness — the racing *feel* — not top speed. Speed beyond that requires wings, full stop.
- **The prop vindication:** hover power per kg scales with √(disk loading). VoloCity (12 kg/m²) needs 116 kW; Joby (55 kg/m²) needs 451 kW. Ours: **~32 kg/m²** — the 62" props are the single best decision in the design.
- What does transfer from racing: stiff unibody structure, motor thermal design, high control bandwidth, the tilted-forward cruise attitude (shape the tub for ~15° nose-down).

## 3. Weight & batteries — the budget CLOSES (Jetson 3-0; battery claims 2-1, treat as provisional)
- **Jetson ONE: 115 kg (253 lb) WITH batteries** — under the limit by one pound. Split: **~55 kg airframe** (aluminum spaceframe, 8 motors) + **~60 kg high-discharge Li-ion**, 20 min, 63 mph (software-limited). Our 4-motor carbon design has a proven-feasible target to beat.
- **Purchasable 2026 packs:** high-discharge Li-ion ~250–300 Wh/kg pack-level; Amprius silicon-anode up to 450 Wh/kg cell (500 verified third-party). A 14 kWh pack ≈ **55–70 kg** today.
- **Sion Licerion lithium-metal >500 Wh/kg: NOT purchasable yet** — first shipments Q3/late 2026, rechargeable version Q2 2027 (2-1 votes, company-sourced, slip-prone). Design for today's cells; treat next-gen as an upgrade path, not a dependency.
- **Unresolved (round 3+):** thermal-runaway containment architecture and its weight at 14 kWh; Pivotal BlackFly's carbon+amphibious weight breakdown (the closest analog to us — worth its own dig).

## 4. Defense — a documented ladder, not a fantasy (verified 3-0)
- Archer's actual path: two 2021 STTR awards totaling **$298k** → $745k Phase II (2022) → **$32M STRATFI** (2023) → contracts worth up to **$142M**, first manned Midnight delivered to USAF Edwards AFB August 2024. DoD buys *data, test reports, training, and services* — not just aircraft.
- **A small builder's first rung: SBIR/STTR Phase I, $75k–350k.** Note: Archer entered with a *manned* aircraft data package; the "unmanned variant first" hypothesis wasn't confirmed. Dollar ceilings ("up to $142M") ≠ obligated funds.

## What this means for OUR design (mentor synthesis)
1. The v5/v6 layout (sealed tub, rotors above deck, land-on-water) is the textbook-correct architecture — validated, not just cool.
2. Chase Jetson's 55 kg airframe with 4 big motors + carbon instead of 8 motors + aluminum. The weight war is winnable.
3. Sell the *feel* of racing (instant response, crisp control, 60 mph low over the water), never promise racing speed.
4. When ready for revenue diversification: file an SBIR Phase I. It's a $75k door that Archer walked through.
5. First hardware milestone unchanged and now better-justified: **thrust-stand one U15XXL, wet and dry.** The whole scale-gap caveat collapses into that one test rig.
