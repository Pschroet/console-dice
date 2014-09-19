console-dice
============

A simple script which enables your console/shell to roll any sided dice

* To make it executable, just add the directory of the files to your system path.
* The Usage is roll %1d%2 (where %1 is the number of dice and %2 the sides of the dice)
 * there can be more than one set of dice, each set is separated by empty spaces (e. g. roll 1d20 2d6)
 * the argument -x activates exploding dices, which means that another die will be rolled, every time the highest number is rolled, if that roll is also the highest number, another die will be rolled and so on
