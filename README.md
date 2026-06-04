# FPGA Frogger Game

## Overview

This project is an FPGA-based Frogger-style arcade game designed using digital logic and hardware description language concepts. The game recreates the core mechanics of Frogger, where a player moves across the screen while avoiding moving obstacles and attempting to reach a target area.

The project demonstrates real-time hardware design using finite state machines, display control, user input handling, collision detection, and game-state logic.

## Project Motivation

The goal of this project was to design an interactive game directly in hardware rather than software. Instead of running on a traditional CPU, the game logic is implemented using digital circuits on an FPGA.

This project provided hands-on experience with synchronous digital design, timing, display output, state machines, and hardware-level debugging.

## Key Features

- FPGA-based game implementation
- Frogger-style player movement
- Moving obstacles
- Collision detection
- Win and loss conditions
- User input through buttons or switches
- Real-time video/display output
- Game reset functionality
- Finite state machine-based game control
- Hardware-level implementation of gameplay logic

## Game Description

The player controls a frog attempting to move from the starting area to a goal area across traffic while avoiding moving cars. The game updates in real time based on clocked digital logic.

The main gameplay elements include:

- A player-controlled frog
- Obstacle lanes with moving cars
- Collision detection between the player and obstacles
- A goal zone
- Reset behavior after winning, losing, or restarting the game

## System Architecture

At a high level, the design includes:

- Clock and reset logic
- User input logic
- Player movement controller
- Obstacle movement controller
- Collision detection logic
- Game state controller
- Display controller
- Graphics/color generation logic

```text
+----------------+
| User Inputs    |
| Buttons/Switch |
+-------+--------+
        |
        v
+----------------+        +----------------+
| Player Control |        | Obstacle Logic |
| Movement FSM   |        | Movement FSM   |
+-------+--------+        +--------+-------+
        |                          |
        +------------+-------------+
                     |
                     v
           +--------------------+
           | Collision Detection|
           +---------+----------+
                     |
                     v
           +--------------------+
           | Game State Control |
           | Start/Play/Win/Lose|
           +---------+----------+
                     |
                     v
           +--------------------+
           | Display Controller |
           | VGA/HDMI/Video Out |
           +---------+----------+
                     |
                     v
              +--------------+
              | Game Display |
              +--------------+
