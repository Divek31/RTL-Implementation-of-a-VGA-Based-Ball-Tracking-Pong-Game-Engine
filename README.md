# VGA-Based Pong Game: RTL Implementation using Verilog

## 🚀 Project Overview
This project implements a dedicated hardware engine for a real-time Pong Game using **Verilog HDL**. Unlike software-based games, this system utilizes **Hardware Parallelism** to generate VGA video signals and manage object physics simultaneously at the RTL level.

## 🛠️ Tech Stack
- **Language:** Verilog HDL
- **Tool:** Xilinx Vivado ML Edition
- **Target Standard:** VGA 640x480 @ 60Hz (25.175 MHz Pixel Clock)

## 🏗️ System Architecture
The design is modular, consisting of:
1. **Clock Wizard:** Converts input clock (100MHz) to Pixel Clock.
2. **VGA Sync Generator:** Manages H-Sync and V-Sync timings for monitor synchronization.
3. **Graphic Logic:** Handles the movement of the 10x10 ball and its coordinates.
4. **Collision Engine:** Implements physics to detect boundaries and trigger "Bounce" logic.

## 🎮 Features
- **Zero-Lag Rendering:** Pure hardware implementation ensures no software overhead.
- **Synthesizable Code:** Ready for deployment on FPGA boards like Nexys or Basys3.
- **Dynamic Physics:** Real-time coordinate updating and velocity reversal on collision.

## 📊 Simulation Results
The project was verified using **Behavioral Simulation** in Vivado. 
- **Timing Accuracy:** Confirmed that Sync pulses align with the VGA standard.
- **Logic Validation:** Verified that `Ball_X` reverses direction instantly upon hitting the screen boundary (640px).

## 📂 File Structure
- `top_pong.v`: Top-level module connecting all sub-units.
- `vga_sync.v`: VGA timing controller.
- `graphic_logic.v`: Object rendering and movement physics.
- `tb_pong.v`: Testbench for verification.

---
**Developed by:** Divek Kumar  
**Domain:** Electronics and Communication Engineering (ECE)
