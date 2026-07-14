# Buoyancy & Water Stance
**Date:** 2026-07-14 · How the sealed craft floats. Toggle "water mode" in `sky_tribe_viewer.html` to see the waterline.

## The physics (Archimedes)
A floating body sinks until it pushes aside a weight of water equal to its own weight. Fresh water = 1 kg per liter, so:

| Case | Weight | Water it must displace |
|------|--------|------------------------|
| Empty | ~156 kg | ~156 L |
| With 85 kg pilot | ~241 kg | ~241 L |
| Pilot + 20 kg cargo | ~261 kg | ~261 L |

## The hull's buoyancy budget
The sealed lower hull (belly + cabin tub, waterproofed) encloses roughly **~650 L** of watertight volume. It only needs to submerge ~241 L to float with a pilot aboard.

- **Reserve buoyancy ≈ 650 / 241 ≈ 2.7×.** It floats HIGH, not swamped.
- **Waterline sits ~20 cm up from the bottom of the belly** — roughly at the base of the cockpit coaming.
- **The cabin, seat, pilot, battery, and avionics all stay above the waterline and dry** (and the hull is sealed anyway).
- **The landing skids hang below the surface** — they're underwater when floating, which is fine.

## Will it tip over?
No, and here's why:
- **Wide beam** (~0.9 m) gives a broad footprint on the water — high initial stability, like a jet-ski or pontoon hull.
- **Low center of gravity** — the ~58 kg battery sits at the keel, well below the waterline, acting like ballast.
- CG below the center of buoyancy + wide beam = it self-levels and resists roll.

## Sealing philosophy (two-tier — from the water-drone research)
- **Fully sealed & dry:** the whole cabin area — pilot, seat, battery, the three flight computers, all wiring. Nothing in here ever touches water.
- **Allowed to get wet:** the motors (brushless motors run wet fine with a corrosion coating — proven 2 months submerged in saltwater by JHU-APL), the skids, and the outer lower hull. These are designed to be splashed.
- So water can touch the *outside* and the *motors*; it can never reach the cabin.

## Propel on water: blades-in-water vs blades-in-air — which is faster?
**Blades in AIR (airboat mode) wins — it's faster AND safer.** Here's the honest physics:
- Aircraft propellers are *air* propellers. Water is ~800× denser than air. Dip a spinning aircraft prop into water and it **cavitates, stalls, loses most of its thrust, and risks shattering** — it's a terrible water propeller and a real damage risk.
- **Airboat mode** keeps the props in the air (where they're efficient), tilts the craft a few degrees, and pushes air backward to glide across the surface — exactly how Everglades fan-boats work. Same props, no water contact, no damage. This is the faster, proven method.
- There's also a geometry reality: with 2.7× reserve buoyancy the craft floats HIGH, so the blades (1.4 m up) sit well above the water anyway. To dip them you'd have to nearly swamp it.
- **If we ever want serious water speed,** the right tool is a small dedicated underwater thruster or water-jet (most efficient *in* water) as a bolt-on — not the lift props. But for "scoot across the bay," airboat mode is the answer and costs zero extra hardware.

**Verdict:** propel from the air with the blades above the water. Never drive the lift props into the water.

## Honest caveats
- These are **estimates from the current CAD volume**, not a measured hull. The real number comes from a displacement test of the actual molded hull (drop it in water, mark the line, weigh it).
- 2.7× reserve is comfortable; even a partial breach still floats.
- This is *floating stability*, not *takeoff-from-water*. Matt's current call: waterproof + floats if it lands on water, but not a boat that powers around. Taking off from the surface is a separate capability we can add later (rotors are already mounted high enough to clear spray).
