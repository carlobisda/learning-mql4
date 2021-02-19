//--- my-practice-script-conditional.mq4 
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
    int x = 1000;
    int y = 100;

    if(x == 10) {
        Print(x);
        Print("I love apples");
        Print("But avocados are ok too");
        if(y == 100){
            Print("I just printed a nested if");
        }

    } else if(x == 1000) {
        Print("Im printing the else..");
    } else if(y == 100) {
        Print("Y is a 10");
    }
    

    }
//---
