# Verilog-Smart-Parking-FSM

## FPGA Smart Parking System using Verilog FSM

A Verilog HDL implementation of a smart parking management system using a Moore Finite State Machine (FSM).   
The system controls vehicle entry via password verification and provides visual feedback through LEDs and state displays.

---
## Project Overview

It is designed as a Moore Finite State Machine that manages authentication, parking flow, and system status.

The system responds to:

- Car detection sensor
- Password verification signal
- Clock-driven state transitions

Outputs include:

- Red LED → access denied / wrong password
- Green LED → access granted
- System state display signals

---

## FSM States

The controller operates using the following states:

- ***IDLE*** – waiting for car arrival
- ***PASSWORD_WAIT*** – user entering password
- ***WRONG*** – incorrect password detected
- ***CORRECT*** – access granted
- ***WAIT*** – system ready for next car

State transitions occur synchronously with the clock.

---

## Features

- Password-based access logic
- Retry handling for incorrect password
- LED status indication
- Simulation testbench included

---


