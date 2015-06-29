#Mastermind
A command line implementation of the 1970 classic, Mastermind. If you are unfamiliar with the 2 player code-breaking game, check out the [Wikipedia article on Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)).

To play the game, enter `$ rake` from the mastermind directory. 

##Game
The game consists of the player attempting to guess the computer's secret code. This secret code is a particular sequence of four of the eight colors (red, green, blue, yellow, brown, orange, black, and white). **_Colors can be repeated in a code._**

The introductory message sums up the game's objective quite well:
```
Welcome to mastermind. Attempt to guess the secret code in 12 turns.
The secret code consists of four of the following colors: Red, Green, Blue, Yellow, Brown, Orange, Black, White.
Here is the game board:

O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O
O | O | O | O

After you make a guess, feedback is displayed on the right of the board.
Black (B) means that you guessed the correct color in the correct position.
White (W) means that you guessed the correct color in the incorrect position.
```