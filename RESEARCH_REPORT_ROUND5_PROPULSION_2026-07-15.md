# Sky Tribe — Round 5 Research: Propulsion & Architecture (no taboos)
**Date:** 2026-07-15 · **Method:** deep-research harness, 104 agents, 22 sources fetched, 107 claims extracted, 25 verified by 3-vote adversarial panel → **24 confirmed, 1 refuted**

## The one-line verdict
**Electric multirotor is confirmed #1 — we're on the right propulsion. But the flat quad was the weakest link in the whole design, and the X8 decision (made 2026-07-15) is now literature-backed, not just instinct.**

---

## 1. Architecture — the X8 call was RIGHT (and hexa is a trap)

- **A manned flat quad is ruled out by the numbers** (DLR HorizonUAM, verified verbatim): single-rotor failure on a quad is *catastrophic* — partial lift loss is uncontrollable for a passenger vehicle. Quads showed the **highest catastrophic failure rate of four VTOL configs studied (~8×10⁻⁴/hr)**. Studies conclude **at least eight rotors (coax X8 or flat octo)** is what actually satisfies motor-out safety. Motor-out on a quad-shaped layout also demands ~2× installed power (each corner sized for ≥50% of hover thrust). *Caveat: those reliability budgets are air-taxi certification stringency, way beyond Part 103 — but the physics of "dead corner = uncontrollable" applies to any manned quad.*
- **Hexacopter is NOT a middle path** (Du/Quan, AIAA JGCD 2015, verified): the standard alternating-spin hexa is **uncontrollable after ANY single rotor failure** despite having six motors. Even the special fault-tolerant spin arrangement still has two unsurvivable rotor positions. **Motor-out survival depends on spin-direction geometry, not rotor count.** Six motors ≠ redundancy.

## 2. Honest correction: the coax penalty is BIGGER than we assumed

We budgeted ~5–8% for the X8's stacked-rotor loss. **The verified number is ~9–15% for an optimized design** (NASA Ames CFD: a coax pair gives 182% of one rotor, not 200%; bench tests: ~14% thrust-per-watt penalty, up to 19–23% on the worst metric). Key details:
- The loss falls almost entirely on the **lower rotor** (~64% of its isolated thrust — it drinks the top rotor's downwash).
- A **stopped lower rotor adds ~180 gf of backwash drag** — relevant to motor-out thrust math.
- Mitigations: **graded/higher pitch on the lower prop**, and the penalty **shrinks at higher disk loading**.
- Literature is admittedly messy at small scale (13–28" props); direction transfers to our 54" props, exact percentages don't.

**Design rules that survived verification:**
- **Coax vertical spacing ≥ 0.25 rotor diameters** — thrust is nearly insensitive to spacing above that; below it you pay. For 54" props that's ≥ ~343 mm between the two prop planes. *(CAD updated to 350 mm same day.)*
- **Small prop-disc overlap (0–20%) with vertical offset is harmless to slightly beneficial** (+1–2% thrust at constant power) — arm geometry has slack if we ever tighten the footprint.
- The NASA Ames / Army AFDD hover-chamber dataset (coax/tandem/tilt vs equal-solidity single rotors) is the apples-to-apples benchmark to design against.

**BOM implication:** X8 needs ~9–15% more battery for equal endurance vs the quad, not 5–8%. Fold into the next BOM refresh.

## 3. Propulsion ranking (verified where possible)

1. **Distributed electric multirotor — CONFIRMED #1.** Nothing that survived verification beats it at 25 kW / Part 103 scale. We're using it.
2. **Series-hybrid genset — right idea, HARDWARE GAP FOUND.** The Part 103 fuel exemption genuinely favors fuel over batteries (14 CFR 103.1 verified: fuel excluded, 5 US gal cap, batteries count). **But no off-the-shelf genset fits our ~25–30 kW floor in 2026:**
   - Pegasus GE70: **4 kW peak / 3.5 kg** — drone-scale, 6–9× too small, and it's Pegasus's *largest* unit.
   - Turbotech TG-R90 turbogenerator: **85 kW / 64 kg dry**, multi-fuel incl. H2 (bench-demo'd w/ Safran 2024), flight-proven on experimental eVTOLs — but 3× oversized and eats 56% of our entire empty-weight budget.
   - **The 20–40 kW middle is an empty market in 2026.** Options: recheck for new entrants before the hybrid trade study; consider paralleling smaller units; or accept the 1-hr config waits for the market to fill in.
3. **Micro-turbine direct drive / H2 fuel cells / everything else** — nothing at our scale survived verification this round (see coverage caveats).

## 4. Exotics — the physics gate held

| Concept | Verdict | Why |
|---|---|---|
| EHD / ionic wind hover | **CLOSED** | Verified trade-off (MIT/Barrett, Proc. R. Soc. A): thrust density and efficiency trade against each other — the famous ~100 N/kW exists only at ~1–3 N/m², orders of magnitude below the ~200–500 N/m² a hovering manned craft needs. Newer ducted multi-stage work pushed density ~10× (our older "750 m² needed" number was REFUTED — killed 1-2 in verification) but it's still tens of N/m². Closed for hover; interesting for near-silent fixed-wing cruise someday. |
| Static maglev / "hover on Earth's field" | **CLOSED** | Earnshaw's theorem: no static arrangement of magnets/charges can stably levitate. Earth's ~50 µT field has nothing usable to push against for free flight. |
| Beamed power hover | **FRONTIER, far off** | Best 2025 demo (DARPA POWER/PRAD): **800 W at 8.6 km for 30 seconds** — a record, and still ~30× short of our hover floor, delivered for 1/120th of our minimum flight. Watch, don't build. |
| Tesla-lineage | Same as beamed power — resonant/wireless transmission is his real legacy and it's the row above. No verified antigravity anything. |

## 5. Coverage caveats (what this round did NOT confirm)
Nothing survived verification on: real-program rationales (Jetson ONE 8-motor layout, LIFT Hexa's 18 rotors — extracted but not confirmed), fuselage aero critique (fineness ratio, tail cone, spray ingestion), H2 stacks at our scale, variable-pitch/rim-driven/cycloidal rotors, flywheels, ground effect. **Treat those as open, not settled.** Two claims passed 2-1 (coax equal-throttle loss; GE70 power density) — verified against primaries but carry metric-mismatch caveats.

## 6. Open questions for Round 6
1. Actual coax penalty at OUR scale (62"→54" props, our disk loading, graded-pitch lower rotors) — full-scale test or validated CFD decides 9% vs 15%.
2. Can the 115.2 kg budget absorb the X8 conversion + 9–15% bigger battery? (Two-prototype program partially defuses this — P1 heavy doesn't care.)
3. Does ANY 20–40 kW genset ship in 2026? Recheck before committing the hybrid trade study.
4. The unverified areas above need their own pass — especially water ops (spray ingestion at our rotor height) before M5.

## Key sources (all fetched & verified 2026-07-15)
- DLR HorizonUAM powertrain reliability: arxiv.org/pdf/2309.10631
- Hexa controllability (Du/Quan): arxiv.org/pdf/1403.5986
- NASA Ames coax CFD (Yoon 2017): ntrs.nasa.gov/api/citations/20170000654
- Rutgers coax experiments (Aerospace 2022): mdpi.com/2226-4310/9/8/452
- Overlap/offset (Weishaupl & Prior): eprints.soton.ac.uk/433170
- Pegasus GE70: pegasusaero.ca/ge70 · Turbotech TG-R90: turbotech-aero.com/solutions
- EHD trade-off (Masuyama & Barrett): royalsocietypublishing.org (Proc. R. Soc. A 2015)
- DARPA power-beaming record: darpa.mil/news/2025 · Earnshaw: math.ucr.edu/home/baez
- Part 103 text: ecfr.gov 14 CFR 103 · FAA: faa.gov/media/13046
