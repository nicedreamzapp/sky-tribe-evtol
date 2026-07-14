# Round 4 — Hydrofoil Landing Gear (foil = skid)
**Date:** July 14, 2026 · 101-agent sweep, 3-vote verification. Permanent reference for sizing our foils.

## Bottom line
Foiling a ~240 kg single-seat amphibian is **physically feasible with real prior art.** The smart choice for our weight is **fixed inverted-V surface-piercing foils** (self-balancing, no computer needed). The hard part isn't lift — it's the **takeoff "hump"** (needs ~3–4× the cruise power). And the one piece nobody has proven is **exactly your idea**: a foil strut that ends in a skid foot for hard-ground landing. That's our open ground.

## The sizing math (verified)
Lift: **L = ½ · ρ · V² · S · C_L** (ρ_water = 1000, so water makes huge lift). Worked check: 0.12 m² at C_L 0.60 and 6 m/s (~12 knots) in fresh water = **~1,300 N ≈ 132 kg**. So to lift our **240 kg we need ~0.15–0.20 m² of total foil area** at ~15 knots — small.
- **Real anchor:** a 650 kg ultralight seaplane (SEAGULL, peer-reviewed) used 0.2 m²/foil at 15 knots. Scaled to us ≈ **~0.07–0.10 m² per foil** (two foils). Foils cut its liftoff speed from 44 → ~20 knots and unloaded the hull by ~80%.
- **Minimum foiling speed: ~15–18 knots (17–21 mph).** Below that, the wings don't make enough lift and you sit as a hull.

## How it balances — this answers your question directly
Two proven paths:
1. **Fixed inverted-V surface-piercing foils (LISA Akoya "Seafoils")** — **self-stabilizing with ZERO pilot input and no controller.** As the craft rises, less foil is in the water, so lift drops automatically — it self-levels. Flew at Oshkosh 2012. **This is the best architecture for our Part 103 weight budget** — no actuators, no computer loop, lightest.
2. **Active fully-submerged foils (Candela C-8, Artemis ferries, foiling Moths)** — 10+ sensors adjust flaps ~100×/sec. Smoother and more efficient, but *requires* the control loop (submerged foils are unstable without it). The good news: it's cheap to build — a PID loop on accelerometers driving servos, which **an off-the-shelf drone flight controller runs already** (our triple-redundant brain can do it).

**Recommendation:** start with fixed V-foils (simple, self-stable, light); upgrade to active later if we want cruise efficiency.

## The real constraint: the takeoff hump
- **Candela C-8: 55 kW to take off, but only 16 kW to sustain foiling at 20 knots (~3.4×).** The whole water-motor sizing is driven by getting *over* the hump, not cruising.
- **Water motors (saltwater-ready, off-the-shelf):** Torqeedo Cruise 3.0 (3 kW, ~64 kg *static* thrust, IPx9K) or Lift eFoil motors (2.2 kWh, ~90 min). **Caveat:** that 64 kg is *static* thrust and collapses at 15–20 mph — **one pod is likely not enough to punch through our takeoff hump.** Plan for two, or a bigger motor, or use the lift-props (airboat mode) to help accelerate onto the foils.

## Retraction & the foil-as-skid (your idea)
- **Retractable foils are solved** — patents (screw-shaft stow into a wing slot), SEAGULL L-foils retract into floats, Artemis retractable high-aspect foils. Low mass, proven.
- **BUT: no source anywhere validates a foil strut ending in a ski/skid foot for hard-ground landing.** That specific dual-purpose part — foil in water, landing foot on ground — **is unproven prior art.** It's genuinely novel. It's also the thing we most need to test (does a foil-shaped foot survive a hard landing *and* work as a foil?).

## Honest caveats (the catches)
- **Weight is the real risk.** The "~1% of AUW" foil-mass figure comes from a 5,600 kg amphibian and does NOT scale down — hardware has a mass floor (struts, retract gear, motor). At 240 kg with a Part 103 254-lb limit already 47 kg over, the foil system's real mass could be the thing that sinks the budget.
- **Foiling's payoff is smoother/faster water, not a dramatic leap.** A Twin Otter study saw only ~3.5% takeoff gain from foils. **Just floating remains a totally legitimate choice** — foils are a "nice, fast, smooth" upgrade, not a necessity.
- **Nobody has built a sustained-cruise foiling personal aircraft** — only takeoff-assist foils (Akoya). We'd be early.

## What this means for our CAD/design
- Size the foils at **~0.15–0.20 m² total** (two foils, ~0.08 m² each) — small, which is why they can double as compact skid feet.
- Go **fixed inverted-V surface-piercing** first — self-balancing answers the "how does it stay level" worry with zero electronics.
- Budget **two water thrusters or one bigger one** for the takeoff hump; consider using the lift-props to help accelerate.
- **Prototype the foil-foot** early — it's the novel, unproven piece and the whole dual-purpose concept rides on it.
- Keep foiling as a **Phase-2 upgrade** — floating works today; foiling makes it fast and smooth later.

*Sources: SEAGULL (Springer 2021), MDPI Aerospace 2021 (amphibian foils), LISA Akoya, Candela, Artemis Technologies, Torqeedo, Lift Foils, US Patent 2,997,260, foils.org.*
