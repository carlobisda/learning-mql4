
PROGRAMMING BASICS; FUNCTIONS, TIME AND SELF LEARNING

    UNDERSTANDING THE THOUGHT PROCESS
        DEBUGGING
            SOLVE THE 1ST ERROR, WILL FIX 99% OF THE TIME
            USE DEBUGGING TOOL

    WHAT IS A FUNCTION?
        FUNCTIONS ARE SELF CONTAINED MODULES OF CODE THAT ACCOMPLISH
        A SPECIFIC TASK. FUNCTIONS USUALL TAKE DATA IN, PROCESS AND 
        RETURN A RESULT. ONCE A FUNCTION IS WRITTEN, IT CAN BE USED
        OVER AND OVER AGAIN. 
        
        FUNCTIONS CAN BE CALLED FROM INSIDE OTHER FUNCTIONS.

            I.E: FUNCTIONS ARE A SET OF CODES THAT ACCPETS INPUTS &
            RELEASE OUTPUTS (LIKE FACTORIES)

                INPUTS:     1. VALUES 2. NO INPUT
                OUTPUTS:    1. VALUES 2. ACTIONS 3. VALUES + ACTIONS

            =========================================================================
            INPUT                   FUNCTION                        OUTPUTS
            
            VALUES -->              FACTORY                         VALUES
            CALL, NO VALUES -->     SET OF CODES, ASSEMBLY LINE     ACTIONS
                                                                    VALUES + ACTIONS
            =========================================================================

            TYPES OF FUNCTION
                USER DEFINED (CREATED BY US)
                Lucas1(),sumAndDivide(number1, number2),
                donkeykong(value1, value2, value3)...

                IN-BUILT FUNCTIONS (CREATED BY METAQUOTES)
                    Comment(yourstring), Ordersend(..., .., ...), iMA(..., ..., ...)

            STRUCTURE OF A FUNCTION
                CALLING VS BUILDING USER DEFINED FUNCTIONS
                    
                    CALLING A USER DEFINED FUNCTIONS
                    sumandproduct(1,2,3)
                    hello = sumandproduct(1,2,3); // assigning output to variable

                    BUILDING A USER DEFINED FUNCTION
                    double sumandproduct(double a, double b, double c) { // HEADER & OUTPUT TYPE
                        double output
                        output = a + b * c;
                        return(output);
                    }

                    CALLING IN-BUILT FUNCTIONS
                    Ticket=OrderSend(Symbol(), OP_BUY, Lots, Ask, Slippage, StopLossLevel, TakeProfitLevel,
                    "Buy(#"+MagicNumber+")",MagicNumber, 0, DodgerBlue);

                        sumandproduct(a, b, c)
                            Inputs: Value - Integers a, b and c
                            Outputs: Value - Solution to (a+b)/c

                        OrderSend(Currency, Direction, Volume, ...)
                            Inputs: Value - Currency, Direction, Volume, Price etc.
                            Outputs:
                                Value - Id of the trade. Returns - 1 if trade fails
                                Action - Fires a trade

                    BUILDING A BUILT IN FUNCTION
                    **NOPE

                    NESTED FUNCTIONS (Functions in a Function)
                    void ClosePendingPositions(int TYPE)
                        {
                            int totalorders=Orders Total():
                            int orderscroll;
                            for(orderscroll=0;orderscroll<totalorders;orderscroll++)
                                {
                                    OrderSelect(ordescroll, SELECT_BY_POS,MODE_TRADES):
                                    if((OrderSymbol()==Symbol())&&(OrderMagicNumber()==Magic)&&((OrderType()==TYPE)))
                                    {
                                        OrderDelete(OrderTicket());
                                    }
                                }
                        }
            EXAMPLES
            
            WHY USE FUNCTIONS?
