# EC 3-1n-A-Row

## Contributors:

Keven DeOliveira,
Eric Cho,
Seifallah Ibrahim,
Harry Katsaros

## Overview
For our EC311 final project, our group chose to recreate a two player version of the iconic game Tic Tac Toe. Our version of the game follows all of the conventional rules. Therefore, player one and two alternate taking turns choosing areas on the 3 by 3 grid. Red squares represent all of the locations chosen by player one and blue squares represent all spots chosen by player two. A player's move is only valid if the location they choose has not already been chosen earlier in the game. The two players are able to choose these locations with the switches on the FPGA board. If either player is able to connect three of their squares horizontally, vertically, or diagonally, they win. If player 1 wins, the RGB light on the FPGA lights red and blue if player 2 wins. However if all 9 spots are chosen, the game is a tie and the RGB light turns green. Once either player wins or there is a tie, the users can reset the board by using the reset switch. This reset switch can be activated at any time to restart the game. 

## How to Run:
To run this design you will need:
- An FPGA board with VGA compatability (we used a Nexys4-DDR)
- A monitor with VGA compatability
- Vivado Software (we used version 2019.1)

- First create a new project on Vivado and import the sources from the Design Sources.
- Import the Constraints File. 
    - The provided Constraints File is for the Nexy4-DDR board. Other boards may require their own files.
- Optional: If you wish to see how each module works individually, you may import the files to test them from the Test Benches folder.
- Generate the bitstream and program board.

## How to Play:
- Set SW15 to low: this acts as the reset switch.
- Use SW0 and SW1 to change current player (SW0 high = player 1, SW1 high = player2)
- Use SW2-SW5 to choose designated play position.
  - Squares are numbered from left to right, top row to bottom row, as 1 2 3 4 5 6 7 8 9.
  - Example: Top left square is posiiton 1 (0001). Middle row, middle column square is position 5 (0101).
- Have fun!
- Set SW15 to high then low to reset game.

## Overview of Code Structure
**TOP:** Interconnects all of our other modules. Primarily interacts with the decoder to allocate specific switches and enable variables. 

**TTT_Decoder:** Utilizes 9-bit one hot encoding to decode switch inputs

**VGA_DISPLAY:** Uses a horizontal and vertical sync to allocate pixels accordingly. This allows us to make our external display. 

**detect_3inarow:** Checks to see if any of the nine winning positions are completely filled in by 3 pieces

**detect_win:** Confirms if the same user placed all three of the pieces that are in a row.  If so a winner is assigned by the appropriate two bit allocations

**ill_move_detect:** Checks to see if a player has moved in a spot that is already occupied

**nospace_detect:** Uses an inclusive OR statement to check if the 3 by 3 board is completely full

**pos_registers:** Creates 9 separate position registers using sequential logic. Each of the 9 position registers represents one space on the board

**rgb_LED:** Creates a different colored LED output that would light red if player 1 wins, blue if player 2 wins, and green if the game ends in a tie

**vga_clkdiv:** Separates the clock accordingly so our VGA can operate. 
