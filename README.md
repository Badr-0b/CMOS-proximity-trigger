# Analog CMOS ASIC — Schmitt Trigger + Logic Gate Array
**Process Node:** SkyWater SKY130 (sky130A PDK)  
**Design Style:** Full-custom analog CMOS  
**Status:** Complete (IO pins not yet integrated)

---

## Overview

A full-custom analog ASIC designed entirely from scratch using the SKY130 open-source PDK. The design implements a Schmitt trigger-based digital logic chain using only CMOS transistors — no resistors, no capacitors, no passives. All threshold behavior is intrinsic to the MOSFET sizing and topology.

This chip is part of a larger PCB-level system (documented separately) where an IR proximity sensor drives a capacitor-delay timer that eventually triggers an external buzzer after approximately 8 seconds.

---

## Circuit Architecture

<img width="1464" height="712" alt="image" src="https://github.com/user-attachments/assets/d48b9372-c40f-4dea-abd0-8f453ad4eaf0" />

## Layout

<img width="1311" height="880" alt="ASIC" src="https://github.com/user-attachments/assets/98b9b015-c222-4cee-990b-10c93dda339f" />
<img width="1352" height="925" alt="image" src="https://github.com/user-attachments/assets/dfb8d4e8-0ce8-4753-b77c-95bb3ada2359" />
<img width="712" height="461" alt="image" src="https://github.com/user-attachments/assets/0cc11735-1636-4f6e-a870-5510dd74e734" />

final dimensions are ~15um x ~19um, about the size of a large bacterium.

### Schmitt Trigger
- **Topology:** 6-MOSFET CMOS Schmitt trigger (standard inverting configuration)
- **Reference:** Adapted from: *"A Biomimetic Circuit for Electronic Skin With Application in Hand Prosthesis"* (ResearchGate)
- **Threshold:** V_th ≈ Vin / 2 (symmetric, set by transistor geometry)
- **Note:** The circuit internally includes an inverting output stage; a dedicated external NOT gate was added on the output path. In retrospect, the NOT output could have been tapped from the internal node of the Schmitt trigger, eliminating one gate. Left as-is by design choice.

### AND Gate
- Implemented as **NAND + NOT** (standard CMOS AND decomposition)
- Takes the Schmitt trigger output as input
- Output drives the buzzer pin

### NOT Gate (secondary path)
- Takes the Schmitt trigger output
- Provides an active-low version of the detection signal on a separate output pin

---

## Design Constraints

- **No passives:** Resistors and capacitors are deliberately excluded. All logic thresholds and switching behavior are determined purely by MOSFET geometry.
- **CMOS only:** All devices use sky130 MOSFET primitives (NFET/PFET)
- **Single supply:** Designed for sky130-compatible supply voltages

---

## Toolchain

| Tool | Purpose |
|------|---------|
| **xschem** | Schematic capture and SPICE netlist generation |
| **SKY130 PDK** | Process design kit (sky130A) |
| **Magic VLSI** | Layout verification |
| **KLayout** | GDS viewing and 2.5D/3D visualization |
| **WSL2 (Ubuntu)** | Development environment |

> **Note:** The full place-and-route pipeline used to generate the final GDS from the netlist is proprietary and not documented here. See `LICENSE.md`.

> **Note:** Never do this in WSL2 again. Save yourself the hassle and just get Ubuntu on a Virtual Machine.

---

## License

Copyright © 2025. All rights reserved.  
See `LICENSE.md` for full terms. **Do not copy, reproduce, or redistribute any part of this design or toolchain without explicit written permission.**

---

## Notes

- IO ring (sky130_fd_io) not yet integrated; may be added in a future revision
- The broader PCB system this chip targets is maintained in a separate repository
- Future ASIC projects will shift toward digital RTL flows using [REDACTED]
