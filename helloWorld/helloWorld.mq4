/* 
Name: HelloWorld
Author: Carlo Bisda, 2021
Version: 1.0.0
License: MIT
Link: https://github.com/carlobisda
*/ 

// HEAD
// MOSTLY WHERE GLOBAL VARIABLES AND SPECIAL CODE INSTRUCTIONS SHOULD BE PLACED
#property description "Hello World"
#property version "1.0.0"
#property link "https://github.com/carlobisda"
#property indicator_chart_window

int Count=0;

// SPECIAL FUNCTION BLOCK

// CODE WHERE YOU RUN ONCE IN THE BEGINNING OF THE PROCESS
int init()
    {
    Alert ("Hello World!");
    return();
    }

// CODE WHERE THE MAIN CALCULATION PART OF THE CODE SHOULD BE PLACED
int start()
    {
    double Price = Bid;
    Count++;
    Alert("New tick ",Count," Price=",Price);
    return;
    }

// CODE TO BE EXECUTED IN THE END OF THE PROGRAM
int denit()
    {
    Alert ("Goodbye World");
    return;
    }

// PROGRAM END
