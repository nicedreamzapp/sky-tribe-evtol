# Manned eVTOL Industry — Deep Research Report
**Date:** July 13, 2026 · **Method:** 106-agent research workflow — 5 search angles, 24 sources fetched, 119 claims extracted, top 25 adversarially verified by 3-vote panels (22 confirmed, 3 refuted)

## Bottom line for Matt

The industry has split in two. The winged air-taxi lane (Joby, Archer, Vertical) is a multi-billion-dollar certification war with **zero US commercial passenger flights to date** — closed to small teams. But the **single-seat Part 103 ultralight lane is demonstrably open**: Jetson ONE is sold out through 2027 at $148K with a ~$100M order book and **no FAA certification of any kind**. Your concept lives in the open lane.

## Verified findings (all survived 3-0 adversarial verification unless noted)

### 1. Part 103 is THE path — and the 254 lb line is everything
14 CFR Part 103: no airworthiness certificate, no pilot certificate, no medical, no registration. Hard limits: **empty weight under 254 lb / 115.2 kg (batteries COUNT toward it)**, single occupant, max 55 kt, recreation/sport only, no commercial ops. A **ballistic parachute is EXCLUDED from the weight count** (deployable safety device) — free safety margin. Floats are also excluded — huge for the amphibious concept. This is exactly how Jetson, Pivotal, Lift Hexa, and Ryse Recon all sell today. *(Source: current eCFR text, verified July 2026)*

### 2. MOSAIC opens the growth path — 11 days from now
MOSAIC final rule (published July 24, 2025): LSA certification provisions take effect **July 24, 2026**. It expands light-sport to rotorcraft and powered-lift (2 seats max) with electric propulsion. Consensus standards for powered-lift don't exist yet, so it's prospective — but it's the ladder from Part 103 toy → certificated 2-seat product. *(FAA.gov + Federal Register 90 FR 35034)*

### 3. The giants are still pre-revenue
As of May 2026 **no eVTOL company has flown a paying passenger in the US**. Joby: ~82% through the final certification stage, first FAA-conforming aircraft flying, ~$2.6B cash, Toyota alone has invested $894M. Archer: finished Phase 3 April 2026, ~$2B raised. Vertical: up to $850M secured, targeting 2028 EASA cert. eVTOL stocks broadly down in 2026.

### 4. What killed the failures (the cautionary tale)
- **Lilium**: ~$1.5B raised since 2016-17 → insolvent Oct 2024 when Germany refused a €50M guarantee; rescue buyer pledged €200M, delivered €5M, dead Feb 2025.
- **Volocopter**: ~$544M raised, one of the lowest burn rates in the industry, ~75% through EASA audits → insolvent Dec 26, 2024. *(2-1 vote on one element)*
- **Lesson:** even frugal, certification-advanced players die when capital markets close before revenue. Never build a business that needs type certification before dollar one of income.

### 5. Demand in the personal niche is real
Jetson ONE: **$148,000** ($8K non-refundable deposit), production sold out 2026 AND 2027, earliest new delivery 2028, 650+ units / ~$100M order book, predominantly US buyers. Sell-before-certify works in this category. *(Jetson order page fetched live July 2026)*

### 6. Your exact propulsion is off the shelf
T-Motor U15XXL KV29: **$1,999/motor** (~$8K for four before props/ESCs), marketed by T-Motor for "Manned Aircraft & 100kg Heavy-Lift Drone," 12–24S. Four give your 180–220 kg AUW a thrust-to-weight of ~1.8–2.2, hover near half throttle. Caveat: 100 kg is peak thrust and a vendor number.

### 7. Certifiable flight control is buyable, not a science project
Embention **Veronte 4x**: three internal autopilot cores + optional fourth dissimilar core, voting arbiter designed with no single point of failure, DO-178C/DO-254 DAL B evidence (DAL A ongoing), DO-160G tested, ETSO-C198 in progress with an EASA-approved cert basis (a first for eVTOL flight controls). Explicitly marketed for piloted eVTOL fly-by-wire. A small team buys its certification paper trail instead of writing it.

### 8. The physics verdict (peer-reviewed)
Multirotors are the MOST efficient config in hover and the WORST in cruise/range. At directly comparable scale (EHang 184: 260 kg, 14.4 kWh): ~47 kW hover, **~20.5 min endurance**, ~42 km practical range vs 107 km (lift+cruise) and 203 km (vectored jet). **Plan on 15–20 minutes hover as the realistic ceiling on current Li-ion.** Endurance scales roughly linearly with pack energy density (that analysis used 2019-era 157 Wh/kg; 2026 cells are better). The product must be a short-hop recreational/experience vehicle, not a range play. *(Bacchini & Cestino, Aerospace 2019, math independently recomputed by verifiers)*

### 9. Viability synthesis (medium confidence — judgment, not verified fact)
The lane for a small AI-assisted team: (a) hit 254 lb empty at higher useful load than Jetson, (b) differentiate on flight-control software / redundancy on top of COTS autopilots, (c) use MOSAIC LSA as the growth route to 2-seat certificated products. The physics constraint cuts both ways — the same short endurance that makes Part 103 feasible caps the product at a ~20-minute experience machine. **The amphibious angle (Matt's) is untouched by every competitor examined.**

## Refuted during verification (do not cite)
Three claims from evtolindex.org's certification tracker were killed 0-3 (stale data), including its EHang and Joby status entries.

## Known gaps (flagged honestly by the verify pass)
- **EHang/China**: no EHang claims survived verification — its real CAAC status/order book is uncharacterized here (they are flying passengers in China per unverified sources).
- **Pivotal, Lift Hexa, Ryse Recon**: pricing/delivery claims didn't survive; only their Part 103 positioning is confirmed. (Unverified fetches saw: Pivotal Helix $190K–$260K; Ryse Recon ~$150K, farm-market angle.)
- **2026 battery state of the art** and ballistic-chute vendors: not verified this round — queued as the next research question.

## Open questions for round 2
1. EHang's actual verified certification + passenger ops status.
2. Best 2026 aviation-suitable pack (Wh/kg, C-rate, thermal runaway containment) — Amprius/Sion/solid-state — and what it does to the 20-min ceiling.
3. Can a 4× U15XXL quad + pilot seat + 24S pack + frame close under 254 lb empty? Full mass budget. (Jetson does it with 8 smaller motors.)
4. Lift's pay-per-flight and Ryse's farm angle vs direct $148K sales — better wedge?

## Key sources
eCFR Part 103 · FAA MOSAIC page + Federal Register 2025-13972 · CNBC 2026-05-29 · Joby Q1 2026 shareholder letter (SEC) · jetson.com/order (live) · store.tmotor.com (live) · embention.com · Bacchini & Cestino, *Aerospace* 2019 (DOI 10.3390/aerospace6030026) · evtol.news · autoevolution · Aviation Week
