# Round 3 — Propulsion & Energy Frontier
**Date:** July 14, 2026 · **Method:** 105-agent sweep, 3-vote adversarial verification. 23 claims confirmed. (Synthesis step hit a model rate limit; findings below are the verified raw claims.) Permanent engineering reference — what's PROVEN, what's promising, what's pseudoscience.

## THE HEADLINE — the legal loophole is real and it may win the weight war
**FAA Office of the Chief Counsel (verified 3-0):** under Part 103, **usable fuel is EXCLUDED from the 254 lb empty weight, but batteries COUNT.** The reasoning: empty weight includes only airframe, engines, permanent equipment, and *unusable* fuel; usable fuel is an allowance excluded from the number — but batteries "remain installed and keep virtually the same weight when depleted," so they count in full.

**What this means for us:** our 58 kg battery is the reason we're 47 kg overweight. A **hybrid gasoline genset** feeding the electric motors, with only a small battery for takeoff/landing peaks, could move most of that mass *out* of the counted empty weight — because up to **5 US gallons of gasoline (~14 kg, ~165 kWh chemical) doesn't count.** This is the single most promising path to closing the Part 103 weight budget AND jumping from ~20 min to potentially hours of endurance.

## 1. Hybrid gensets — proven, buyable, honest numbers (all 3-0)
- **Pegasus GE70:** 4 kW peak at 3.5 kg = **1.14 kW/kg** (best small 2-stroke benchmark).
- **Foxtech NOVA-2000:** 1.8 kW continuous / 2 kW peak, 48 V, 4 kg unit = ~0.45 kW/kg.
- **Efficiency penalty (real):** ~750 g/kWh fuel burn — ~3× worse than big aviation piston engines. Gasoline's ~12 kWh/kg becomes only **~1.3 kWh of electricity per kg of fuel** in a small 2-stroke. Still crushes batteries: 5 gal ≈ 14 kg fuel → ~18 kWh electric delivered, vs our 14 kWh / 58 kg battery.
- **Proven endurance:** hybrid drones fly **hours** vs tens of minutes — Foxtech claims ~5 h max, ~1 h on a DJI M600 with just 2 L. But those are 18–21 kg drones; scaling a ~25 kW genset to lift a person is unproven and brings **noise, vibration, cooling, and fire** penalties a pure-electric craft doesn't have.
- **Honest read:** a genset that continuously makes our full ~25 kW hover load at 1 kW/kg would weigh ~25 kg + fuel — heavier than ideal, but if it moves mass off the *counted* weight, it can still win the Part 103 math. Worth a serious trade study; NOT worth abandoning the clean simplicity of battery-electric until the numbers are run on OUR craft.

## 2. Hydrogen — powerful but not at our scale yet (3-0)
- **Joby's LH2 demonstrator flew 523 miles**, landed with 10% fuel — 3–5× the range of the same airframe on batteries. Uses a 40 kg **liquid**-hydrogen tank (not compressed), fuel-cell + small battery hybrid (battery only for takeoff/landing peaks).
- **But:** best flying fuel-cell hardware is ZeroAvia's 2.5 kW/kg (cell level); >3 kW/kg system is a *2025 target*, not shipping. Intelligent Energy's smallest aviation stack is ~200 kW — 8× our need. LH2 tanks carry a severe mass penalty (need 35–40% fuel-system efficiency to compete; best tanks reach 65–70%). **Verdict: hydrogen is real and the long-term winner for range, but there is no off-the-shelf ~25 kW stack for a one-person craft in 2026.** Revisit in a few years.

## 3–6. The exotic frontier — where the physics gate matters
*(Full details in the raw claims; these are the disciplined conclusions.)*
- **Beamed power (laser/microwave):** demonstrated only at small kW over short/fixed distances; needs a ground station and a clear beam — useless for a free-roaming personal aircraft. Not a path.
- **Solar:** disc loading kills it — a quad's rotors need far more power per m² than sunlight (~1 kW/m²) can supply. Solar flies featherweight high-altitude gliders (Zephyr), never a hovering person-carrier.
- **Ionic/EHD propulsion (MIT ion plane):** real but thrust density is thousands of times too low to hover 250 kg. Physics, not engineering, forbids it at our scale.
- **Refuted pseudoscience — cite and dismiss:** EmDrive (German precision tests showed the "thrust" was measurement artifact — zero real thrust), Mach-effect thrusters (unreplicated), "antigravity" claims (no peer-reviewed support). **These violate conservation of momentum. We never spend a dollar or an hour on them.**

## 7. The hard floor no invention can beat
Actuator-disc physics sets a **minimum hover power** for lifting 250 kg on four ~1.6 m props — roughly **25 kW** for our craft. No motor, fuel, or "new energy" can go below the momentum-theory floor; it's set by air, mass, and disc area alone. Bigger discs are the only lever (why the 62" props matter). Every propulsion choice is just a different way to *feed* that ~25 kW — battery, genset, or fuel cell. The question is never "beat the floor," it's "carry enough energy to feed the floor for long enough at the lowest counted weight." **Today that answer is: battery for simplicity now, hybrid genset as the weight-and-endurance play to study next.**

## Action items this round created
1. **Run the hybrid-genset trade study on OUR craft** — does moving battery mass into uncounted fuel close the 47 kg gap? (High priority — this is the loophole.)
2. Keep hydrogen on the watch list; re-check fuel-cell specific power yearly.
3. Physics-gate is now documented: beamed/solar/ionic/exotic are closed at our scale — don't revisit without new peer-reviewed evidence.
