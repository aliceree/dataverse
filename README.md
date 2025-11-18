# Neon Timer

A minimalist minute timer with a custom seven-segment display look. The timer starts from a single input field: type the desired number of minutes, press `Enter`, and the screen switches to a glowing countdown made of virtual LCD segments. Pressing the space bar toggles pause/resume while keeping the segmented digits lit up.

Key behaviors:
- Initial state shows only the LCD-styled input cursor so you can enter any duration (floats are rounded to seconds).
- Once started, the input hides and only the neon countdown remains on screen; the display returns to the input when the timer hits zero.
- Space bar pauses/resumes the countdown; when paused, the digits freeze and continue once resumed.

## Run locally
1. Open `index.html` in any modern browser (Chrome, Edge, Firefox, Safari).
2. Type the number of minutes you want to track and hit `Enter`.
3. Use the space bar to pause or resume whenever needed.

## Live Demo
The same build is available at [aliceree.github.io/timer](https://aliceree.github.io/timer/).
