# Max-and-Sena-Snake-game

This is a simple Snake game made by Max and Sena, characters from **[내일은 실험왕]**. (These are not my images and from google)
It's designed for beginners around 6th grade elementary to 2nd grade middle school level.

---

## Main Features

- Control the snake using **W (up), A (left), S (down), D (right)** keys.
- Collect items (apples) to grow the snake longer.
- The game ends if the snake hits the screen edges.
- Background music and sound effects for item collection and game over.
- Press **spacebar** to reset and restart the game.

---

## How to Use

1. Run the Processing sketch with all required sound and image files in the data folder:
   - `itemSound.wav` (sound effect when collecting an item)
   - `bgSound.mp3` (background music)
   - `gameover.wav` (game over sound)
   - `head.jpg`, `snakebody.jpg`, `background.png`, `ball.png`, `go.png` (images for snake parts, background, item, and game over screen)
   
2. Use the **W, A, S, D** keys to move the snake around the screen.
3. Try to collect the items that appear randomly to increase your snake's length.
4. Avoid hitting the edges of the window, or the game will end.
5. Press **spacebar** anytime to restart the game.

---

## Code Overview

- The snake's position is tracked by arrays storing X and Y coordinates.
- The snake moves in increments of 40 pixels per frame.
- The game checks collision between the snake's head and the item to grow the snake.
- The game plays sounds using the Minim audio library.
- The game over state displays an image and stops the background music.

---

Enjoy playing and learning from the code!
