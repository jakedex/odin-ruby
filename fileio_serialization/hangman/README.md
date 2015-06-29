#Hangman
A simple command line implementation of the game Hangman. You have 8 incorrect guesses to get the secret word (which is randomly selected from the [dictionary.txt](http://scrapmaker.com/view/twelve-dicts/5desk.txt)).

To play the game, enter `$ rake` from the hangman directory

##Game
The game starts by displaying the menu shown below. Save/Load functionality has been implemented - just type `save` during any turn to save the game.
```
Welcome to Hangman, would you like to:
1. Play Hangman
2. Load saved game
3. Delete saved game
4. Quit
Enter selection (1-4):
```
A sample output of the game in process:
```
Incorrect guesses: iepd
Guesses left: 4
_o____a_
Enter guess: a
You've already guessed that letter, try again:
```
When a player wins:

`You won! The word was nonrural.`
