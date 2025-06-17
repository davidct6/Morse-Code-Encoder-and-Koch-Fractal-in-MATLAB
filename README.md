# Morse Code Encoder and Koch Fractal in MATLAB

This project implements two tasks in MATLAB as part of **Problem Set 2b: M-File Programming**.

---

## ✉️ **1️⃣ Morse Code Encoder**

A simple Morse code encoder and beep generator:

### ✔️ Features

- Encode any text message into:
  - A **sequence of dots and dashes** (as a string).
  - A **numerical pulse sequence** (1 = tone, 0 = silence).
- Play the Morse code as audible beeps with customizable tone frequency and dot duration.
- Visualize the generated waveform.

### 📌 Components

1. `morse_encoder(message)`  
   - Loads `morse.mat` with mappings.
   - Prints the Morse code (symbols and spaces).
   - Returns a numerical pulse vector.

2. `morse_beep(pulse_seq, tone_freq, dot_duration, sampling_freq)`  
   - Generates and plays the Morse sound.
   - Plots the waveform.

3. A test script to encode **"MAE - SPRING 2024"**, play it at 8000 Hz and compare with 4000 Hz.

---

## ❄️ **2️⃣ Koch Fractal Curve**

A Koch snowflake/fractal curve generator:

### ✔️ Features

- Generate the **Koch curve** of any order **n**.
- Plot stacked intermediate curves for visualization.
- Supports **custom transformation patterns** and custom starting shapes:
  - Use `koch(n)` for standard Koch curve.
  - Use `genkoch(n, Patt, M0)` for any custom pattern.

---

## ✅ How to Use

1. Place all `.m` files and `morse.mat` in your MATLAB folder.
2. Call:
   - `pulse_seq = morse_encoder("hello world");`
   - `morse_beep(pulse_seq, 750, 0.06, 8000);`
   - `koch(5);`  
   - `genkoch(5, Patt, M0);`
3. Adjust parameters as needed.

---

## 📂 Deliverables

- MATLAB `.m` files with help comments.
- `morse.mat` with Morse code mapping.
- Example script for the given test cases.
- This `README.md`.

---

## 👤 Author

David Cerezo

---
