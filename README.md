# 📉 Beam Deflection Calculator & Visualizer (MATLAB)

This MATLAB program calculates the **deflection of a beam** under a point load using beam theory and plots the deflection profile based on user input.

📅 **Date:** May 10, 2024  
👤 **Author:** Shota Matsumoto  
🎓 **Assignment:** CPE 3rd Assignment

---

## 🧠 Overview

The program:
- Takes physical parameters of a beam (length, load, modulus, moment of inertia, etc.)
- Computes the **deflection** at a given position `x` using beam bending theory
- Plots the deflection of the beam across its length with clear labels and legend

---

## 🔢 Inputs

The program prompts the user for the following **validated** inputs:

| Variable | Description |
|----------|-------------|
| `L`      | Total length of the beam *(must be > 0)* |
| `x`      | Point along the beam to evaluate deflection *(0 < x < L)* |
| `P`      | Point load applied to the beam *(must be > 0)* |
| `a`      | Location of the point load along the beam *(0 < a < L, a ≠ x)* |
| `E`      | Young’s modulus of the beam material *(must be > 0)* |
| `I`      | Second moment of area *(must be > 0)* |

---

## 🧮 Deflection Calculation

Depending on the position of `x`, the program uses the appropriate formula:

### 📍 Case 1: `x < a`
```matlab
V = (P*b)/(6*E*I*L) * [(-L² + b²)*x + x³]
