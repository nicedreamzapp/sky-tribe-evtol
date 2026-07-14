# Sky Tribe Quad — Bill of Materials (v7 realistic build)
**Date:** 2026-07-14 · Single-seat Part 103 amphibious eVTOL · Target empty ≤ 115.2 kg (254 lb), chute + floats exempt

Masses are honest first-pass estimates. Cost is ballpark USD for one prototype. This is the list we buy from and weigh against.

## A. PROPULSION
| # | Part | Spec | Qty | Mass ea | Cost ea |
|---|------|------|-----|---------|---------|
| A1 | T-Motor U15XXL KV29 motor | 100 kg peak thrust, 24S | 4 | 4.2 kg | $1,999 |
| A2 | 62" (1575 mm) 2-blade CF prop | NS62×24 class | 4 | 1.2 kg | $420 |
| A3 | FLAME 300A HV ESC | 24S, potted for wet-side | 4 | 1.1 kg | $360 |
| A4 | Motor mount plate (CF/alu) | bolts motor to arm tip | 4 | 0.4 kg | $90 |
| | **Propulsion subtotal** | | | **27.6 kg** | **~$11,500** |

## B. STRUCTURE (the part that was "fishy" — now a real load path)
| # | Part | Spec | Qty | Mass ea | Cost ea |
|---|------|------|-----|---------|---------|
| B1 | Central spar box | 2 main + 2 cross CF spars, torque box under seat — ALL four arms + seat + gear bolt here | 1 | 14 kg | $2,200 |
| B2 | Arm boom | tapered CF tube, spar-box corner → motor | 4 | 2.4 kg | $340 |
| B3 | Arm brace strut | triangulates each boom to the box | 4 | 0.6 kg | $80 |
| B4 | Cockpit pod / monocoque | sealed CF tub (also the float), floor pan, windscreen frame | 1 | 22 kg | $3,500 |
| B5 | Helicopter skid gear | 2 CF rails + upswept toes + 4 struts | 1 | 6 kg | $600 |
| | **Structure subtotal** | | | **~54 kg** | **~$8,300** |

## C. ENERGY & AVIONICS
| # | Part | Spec | Qty | Mass | Cost |
|---|------|------|-----|------|------|
| C1 | 24S ~14 kWh Li-ion pack | high-discharge, in vented dry box | 1 | 58 kg | $9,000 |
| C2 | Battery mgmt + contactors | cell monitor, precharge, kill | 1 | 3 kg | $700 |
| C3 | **DIY triple-redundant flight ctrl** | 3× CubePilot Orange+ running ArduPilot/PX4 (open source), custom voting — built by us w/ AI, NOT bought proprietary | 3 | 0.8 kg | $300 ea |
| C4 | GNSS + IMU redundancy set | 2× GPS, air data (open-source stack) | 1 | 0.8 kg | $1,400 |
| C5 | Wiring, connectors (IP67) | wet-side sealed | — | 5 kg | $900 |
| | **Energy+avionics subtotal** | | | **~68 kg** | **~$13,200** |

> **Flight-control decision (Matt, 2026-07-14):** rejected the $18k proprietary Veronte. Software is free/open (ArduPilot flies millions of drones + full-size aircraft); we build our OWN triple-redundant controller from 3 cheap open boards + AI-written voting/tuning. Saves ~$16.8k. The redundancy (3 brains voting) is the part we KEEP — a single-controller hobby setup is fine for a $500 drone, fatal under a pilot. Part 103 needs zero certification, so we skip the cert-paperwork tax entirely. Real cost = ruthless TEST discipline (tether → ballast → manned), not license fees.

## D. COCKPIT & CONTROLS
| # | Part | Spec | Qty | Mass | Cost |
|---|------|------|-----|------|------|
| D1 | Seat + 4-point harness | composite pan | 1 | 5 kg | $600 |
| D2 | Sidestick + throttle | fly-by-wire inceptors | 1 | 1.5 kg | $1,200 |
| D3 | Instrument display | glass panel, sunlight-readable | 1 | 1 kg | $800 |
| D4 | Foot area / rudder pedals | yaw trim | 1 | 1 kg | $300 |
| | **Cockpit subtotal** | | | **8.5 kg** | **~$2,900** |

## E. SAFETY & THERMAL (chute is weight-EXEMPT under Part 103)
| # | Part | Spec | Qty | Mass | Note |
|---|------|------|-----|------|------|
| E1 | Ballistic parachute | whole-aircraft, rocket-deploy | 1 | 9 kg | **EXEMPT** — doesn't count |
| E2 | Battery cooling ducts + fans | NACA intakes, rear louvre exhaust | 1 | 2 kg | counts |
| E3 | Motor/ESC air scoops | dry-side airflow to arm roots | 4 | 0.2 kg | counts |
| E4 | Fire barrier / vent membrane | thermal-runaway venting overboard | 1 | 1.5 kg | counts |
| | **Safety+thermal (counted)** | | | **~4.3 kg** | |

## MASS ROLL-UP (the number that rules the project)
| Group | Counted mass |
|-------|-------------|
| A Propulsion | 27.6 kg |
| B Structure | 54 kg |
| C Energy & avionics | 68 kg (now ~$13.2k, was $30k) |
| D Cockpit | 8.5 kg |
| E Thermal (counted) | 4.3 kg |
| **EMPTY WEIGHT (counted)** | **≈ 162 kg** |
| **PROTOTYPE PARTS COST** | **≈ $36,600** (incl. chute; after DIY flight-control saved ~$17k vs proprietary) |
| Part 103 limit | 115.2 kg |
| **OVER BY** | **≈ 47 kg** |
| (Exempt: chute 9 kg + any floats — not counted) | |

## THE WEIGHT WAR — where the 47 kg comes off
1. **Battery is 58 kg and the single biggest lever.** Jetson flies 20 min on ~60 kg, so we can't just delete it. A smaller pack (say 9 kWh / ~38 kg) buys back 20 kg at the cost of ~12 min flight — a real trade to put to Matt.
2. **Structure at 54 kg is heavy for carbon** — Jetson's whole airframe is 55 kg *including* 8 motor mounts. Aggressive CF layup + the spar-box doing double duty should reach ~40 kg (−14 kg).
3. **Avionics 68 kg is battery-dominated** — see #1.
4. **Honest verdict:** as-drawn it's ~47 kg over. Jetson proves ~253 lb is achievable, so the target is real — but it demands ruthless battery sizing + a featherweight airframe. This is THE engineering problem, and it's why milestone M0 is closing this spreadsheet before we cut carbon.

*Cross-refs: RESEARCH_REPORT_2026-07-13.md (Part 103 rules), RESEARCH_REPORT_ROUND2_2026-07-14.md (Jetson 55 kg airframe benchmark, battery Wh/kg).*
