//+------------------------------------------------------------------+
//|                                      MyPracticeScript_Arrays.mq4 |
//|                                     Copyright © 2015, Lucas Liew |
//|                                 http://blackalgotechnologies.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2015, Lucas Liew"
#property link      "http://blackalgotechnologies.com"
#property version   "1.00"
#property strict

// Created by Lucas Liew

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
  // ------------- STATIC ARRAYS -------------
  
      // --- Declare Static Arrays ---
       
      int firstArray[5]; // One-Dimensional Array.
      int secondArray[2,3]; // Two-Dimensional Array
      double thirdArray[2][3][4]; // Three-Dimensional Array
      int fourthArray[2,4,2,1]; // Four-Dimensional Array (Max is 4)
      
      // --- Declare and Initialise Values (Static Arrays) ---
      
      double fifthArray[6] = {1,20,3,4,10,6}; // Can assign values to all the elements
      double sixthArray[3,3] = {1,2,3,4,10,6,7,8,9}; // Can assign values to all the elements. Read horizontal
      
      // --- Assigning Values ---
      
      sixthArray[2,1] = 500; // Only can assign by single element. Unless declare and initialise/assign together or use ArrayInitialize
 
      ArrayInitialize(secondArray, EMPTY_VALUE); // Sets every element as empty
      ArrayInitialize(thirdArray, 5); // Sets every element as 5
 
      for(int x = 0; x < 5; x++){
         
         firstArray[x] = x*2; // Indexing: First element starts from 0
      
      }
      
      // --- Retrieving Values ---
      
      double y = sixthArray[0,2]; // Remember first row or column starts from 0 not 1
      
      // --- Array Functions ---  (http://docs.mql4.com/array)
      
      double maxValue = ArrayMaximum(fifthArray, WHOLE_ARRAY, 0); // returns position of maximum value. Only applies to 1-d arrays
      
      Comment(sixthArray[2,1]);
      Print(maxValue);
     
      
      // Note: Cannot direct Comment or Print an entire Array Eg. Comment(sixthArray)
   
   // ------------- DYNAMIC ARRAYS -------------
   
      // --- Declare Dynamic Arrays ---
   
      int firstDynArray[]; 
      
      // --- Resizing: Giving your dynamic arrays a size so that you can use it. ---
      
      ArrayResize(firstDynArray,10,10); // Must resize before you can use it. 
      // Third Parameter: Extra/Reserve Elements. To reduce computational memory. (http://docs.mql4.com/array/arrayresize)
      
      ArrayResize(firstDynArray,50,0); // Can resize multiple times. Existing data stays. 
      
      ArrayResize(firstDynArray,20,0); // If resize to smaller size, the data in the 'extra' elements gets deleted
      
      double secondDynArray[][3];
      
      ArrayResize(secondDynArray,20,0); // Can only resize 1st dimension, aka only first dimension is dynamic
   
      // Assigning data, Retriving data and Array Functions concepts for Static Arrays applies to Dynamic Array
   
   
  }
//+------------------------------------------------------------------+