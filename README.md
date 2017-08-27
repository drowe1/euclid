Euclid's algorith is a way of finding the greatest common denomonator of two numbers.
The way the algorithm works is by taking the smaller of the two numbers and subtracting it from the larger number until you can no longer do so without going negative.
At that point switch numbers and subtract the now smaller number from the now larger number.
Continue flipping and subtracting until you can subtract to zero. (I included an example of this process at the bottom with real numbers for clarification)

This process can be represented by a rectangle with length and width the size of the two numbers.
The subtraction part of the process is represented by filling in the rectangle with the largest square possible.

Example with real numbers:
Take the numbers 54 and 888
Subtract 54 from 888 until you can't:
888-54 = 834
834-54 = 780
780-54 = 726
...
78-54 = 24
You can no longer subtract because doing so again would give a negative number
Your numbers are now 24 and 54
Switch numbers and continue the process:
54-24 = 30
30-24 = 6
Switch
24-6 = 18
18-6 = 12
12-6 = 6
6-6 = 0
6 is the GCD
