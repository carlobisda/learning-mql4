//--- my-practice-script.mq4 
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
    int x = 5;
    Print (x); // case sensitive 

    /*
        "/*" will turn everything inside into a comment
    int y = 555;
    Print (y);
        closing bracket below
    */

    // format

    // variables

    int x=10;
    int y=7;
    int z=5;

    z=x+y;

    // declaration
    int hello;

    //initialization
    hello=10;

    //delaration and initilization
    double hellothere = 100;

    }
//---