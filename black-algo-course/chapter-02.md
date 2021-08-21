
SECTION 18

just shows the basic syntax of MQL4

format
   
    shows the coding format, stick to the coding basics
    and should be alright, no hard rules here.

identifiers
   
    pretty simple, same as classes but there are rules to it
        1. 31 chars max
        2. can only contain chars 0-9, strings, and underscore
        3. cannot start with a digit
        4. case sensitive
        5. cannot use reserved word

variables
    
    official definition = section of memory
    layman terms = variables are units that store information

data types
    
    int & double is are data types
    the main data types are;
        1. int = integer, no decimals
            int apple = 5;
        2. bool = boolean, true or false
            bool apple = true;
        3. string = text
            string apple = "apples are my favorite";
        4. double = huge numbers with decimal points (requires more memory than int)
            double apple = -23203123.8593476;
        5. color = 
            color apple = Red
        6. datetime = store dates and times value
            datetime apple = D'2021.02.18 14:12:55';

expressions and operators
        
    arithmatic operators
        +
        -
        *
        /
        ++
        --

    assignment operators
        =
        +=
        -=
    
    relational operators
        ==, equals but not the same as "="
        >, greater than
        >=, greater or equals to
        <, less than
        <=, less than or equals to

    logical operators
        &&, and
        ||, or
        !, not

    operational precedence
        i.e: 
            z = a + b / c; // thats pretty good coding
            z = a = (b / c); // this is better coding
        check out MQL4 reference guide for more details

conditional operators

    if-else, was told to read the official MQL4 reference guide for
    more details about conditional operator; if-else BUT tbh,
    this is pretty much the same if you've coded in other
    languages so we ok.

    switch!!
        not really used but good to read on anyways

    

