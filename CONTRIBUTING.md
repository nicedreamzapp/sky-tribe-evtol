# Contributing to Sky Tribe

Thank you for helping build an open flying machine. This project belongs to everyone who improves it.

## Ground rules
1. **Safety first, always.** No change may encourage anyone to carry a person before the aircraft is proven safe through extensive unmanned and ballasted testing (see the milestone ladder in the README). Test data and safety analysis are as welcome as design changes.
2. **Keep it open.** By contributing you agree your work is licensed under the project licenses (CERN-OHL-S-2.0 for hardware/CAD, GPL-3.0-or-later for code, CC-BY-SA-4.0 for docs). Nothing here becomes proprietary.
3. **Show your math.** Weight, thrust, power, and cost claims should cite a source or a calculation. Vendor spec sheets are a starting point, not proof — real numbers come off a test stand.
4. **No weapons work.** This is a peaceful freedom-of-movement project. Contributions to weaponize it will be declined.

## Where help is most valuable right now
- **The weight war** — the airframe is ~47 kg over the Part 103 limit. Lighter structure, smarter battery sizing, hybrid-power analysis.
- **Redundant flight control** — voting logic on top of ArduPilot/PX4 across 3 boards.
- **Water sealing at scale** — proving coated wet motors + dry electronics survive at U15-class thrust.
- **Test rigs** — thrust stands, tether frames, ballast fixtures, data logging.

## How to propose a change
- Open the CAD in [OpenSCAD](https://openscad.org) and edit the parametric `.scad` source (not renders).
- Describe *why* in plain language, with the numbers that back it.
- Small, well-explained changes are easier to accept than large opaque ones.
