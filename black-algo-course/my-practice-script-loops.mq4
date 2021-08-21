//--- my-practice-script-loops.mq4 
//--- copyright 2021, CK Development
//--- https://github.com/carlobisda

#property copyright "Copyright 2021, CK Development"
#property link      "https://github.com/carlobisda"
#property version   "0.0.1"
#property strict
#property 

// "//"" is how you comment, i just add the --- for stylization
//--- script program start function
void OnStart()
    {
//---
  
// SUM VALUES FOR 1 TO 10

    int x, total;

    x = 1;

    while(x <= 10)
    {
        total = total + x;
        x = x + 1;
    }

    Comment(total);

// FOR LOOP, MORE EFFECIENT THAN WHILE LOOP

    for(x = 1; x <= 10; x++) // "x++" = "x = x + 1"
    {
        total = total + x;
    }

    Comment(total);
//---