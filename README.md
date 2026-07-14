# Sky Tribe — Open Amphibious Personal eVTOL
*A single-seat electric flying machine that lands on water and takes off again. Built in the open, for everyone.*

> **Mission:** This project is about freedom of movement, not force. Quiet electric flight. Fewer barriers between people and places. A machine that treats the ocean as a friend — never a weapon. We build it to unite, to explore, and to give people more free will in how they move through the world.

## What this is
A fully open-source design for a **single-seat, four-rotor electric VTOL** aircraft, targeting the U.S. FAA **Part 103 ultralight** category (no pilot license, no aircraft certification required — but a hard 254 lb empty-weight limit). It is sealed and buoyant so it can **land on water and take off again**, like the waterproof RC drones, scaled up to carry one person.

Everything is open: the CAD, the parts list, the flight-control approach, and the research behind every decision. No proprietary black boxes. If a genius already gave their work away (open-source flight software, published physics), we build on it and give ours away too.

## Safety comes before any human ever flies it
**No person goes aboard until this is proven safe** — tested thousands of times, unmanned first, then ballasted, across different loads and conditions and reviewed by many people. The build order is non-negotiable:

1. **M0** — Close the weight budget on paper (see `PARTS_LIST_BOM.md`).
2. **M1** — Thrust-stand ONE motor. Vendor numbers die on the stand.
3. **M2** — Full frame, **tethered unmanned hover**.
4. **M3** — Ballasted (sandbag) tethered hover, thousands of cycles.
5. **M4** — Manned, tethered, over water.
6. **M5** — Free flight over water.

We keep three independent flight computers voting so no single failure can drop the aircraft. The cost of building our own brain is not money — it is **test discipline**.

## Current design (v7)
- **Propulsion:** 4× T-Motor U15XXL (100 kg peak thrust each), 62" props, ~32 kg/m² disk loading
- **Structure:** central carbon spar box carries all four arms + seat + landing gear (one continuous load path)
- **Energy:** 24S ~14 kWh Li-ion (~89 V, ~160 Ah, ~860 cells, ~60 kg) — the biggest weight problem, honestly documented
- **Flight control:** DIY triple-redundant, built on open-source **ArduPilot/PX4** running on 3× cheap boards — not a proprietary box
- **Water:** sealed buoyant hull, motors mounted high, floats then flies (never powers up through the surface)
- **Safety:** whole-aircraft ballistic parachute (Part 103 weight-exempt)

**Honest status:** as drawn the airframe is ~47 kg over the Part 103 limit. The weight war (battery sizing + carbon layup) is the central engineering problem. Jetson ONE proves 253 lb *is* achievable, so the target is real.

## Repository map
| File | What it is |
|------|-----------|
| `manned_quad_v7.scad` | Current CAD (OpenSCAD parametric source — the real design, editable) |
| `manned_quad_v2..v6*.scad` | Design history, oldest → newest |
| `PARTS_LIST_BOM.md` | Full bill of materials — every part, mass, cost |
| `RESEARCH_REPORT_2026-07-13.md` | Industry, regulations, components (fact-checked) |
| `RESEARCH_REPORT_ROUND2_2026-07-14.md` | Water tech, racing physics, batteries, defense (fact-checked) |
| `quad_v2_viewer.html` | Interactive 3D viewer (exploded parts + labels) |

Open the CAD with [OpenSCAD](https://openscad.org): `openscad manned_quad_v7.scad`

## How to contribute
Anyone may use, study, modify, and share this design under the licenses below. Improvements that keep it open are welcome — especially on the weight budget, the redundant flight-control code, and water-sealing at scale. Test data is as valuable as design changes.

## License
Open hardware and open source, chosen so it can **never be locked up**:
- **Hardware / CAD:** [CERN-OHL-S-2.0](https://ohwr.org/cern_ohl_s_v2.txt) (strongly reciprocal — derivatives stay open)
- **Software** (flight-control code we write): [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.txt)
- **Documentation / research:** [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/)

See `LICENSE` for details. You are free to build one. You are not free to take it private.
