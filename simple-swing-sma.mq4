// Simple Swing SMA EA
// ver. 0.0.0
// MIT, Carlo Bisda
// carlobisda.com

// Made this EA so I can comment on it, and then share it, so hopefully those 
// who are trying to write in MQ4 as well can learn the inner workings of the
// code.

// GUI CONTROL, SETTINGS AND PARAMETERS
extern int MagicNumber=10001;
extern double Lots =0.1;
extern double StopLoss=50;
extern double TakeProfit=50;
extern int TrailingStop=50;
extern int Slippage=3;

// START EA
int start()
{
   // VARIABLE
  double MyPoint=Point;
  if(Digits==3 || Digits==5) MyPoint=Point*10; // SLIPPAGE VARIABLE
  
  double TheStopLoss=0;                         // MONEY MANAGEMENT VARIABLE
  double TheTakeProfit=0;

   // OPEN ORDER FUNCTIONS
  if( TotalOrdersCount()==0 )                   // CHECKING IF THERE IS ANY ORDERS ON BOARD
  {
     int result=0;                              // CHECK ORDER VARAIBLE
     if((Open[0]>iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,0))) // OPEN BUY LOGIC
     {
        result=OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,0,0,"MIT, CKDevelop 2021",MagicNumber,0,Blue); // BUY ACTION
        if(result>0)
        {
         TheStopLoss=0;
         TheTakeProfit=0;
         if(TakeProfit>0) TheTakeProfit=Ask+TakeProfit*MyPoint; // MONEY MANAGEMENT ACTIONS
         if(StopLoss>0) TheStopLoss=Ask-StopLoss*MyPoint;
         OrderSelect(result,SELECT_BY_TICKET); // DONT KNOW WHAT THIS IS?
         OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(TheStopLoss,Digits),NormalizeDouble(TheTakeProfit,Digits),0,Green);
        }
        return(0);
     }
     if((Open[0]<iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,0))) // OPEN SELL LOGIC
     {
        result=OrderSend(Symbol(),OP_SELL,Lots,Bid,Slippage,0,0,"MIT, CKDevelop 2021",MagicNumber,0,Red); //SELL ACTION
        if(result>0)
        {
         TheStopLoss=0; // MONEY MANAGEMENT ACTIONS
         TheTakeProfit=0;
         if(TakeProfit>0) TheTakeProfit=Bid-TakeProfit*MyPoint;
         if(StopLoss>0) TheStopLoss=Bid+StopLoss*MyPoint;
         OrderSelect(result,SELECT_BY_TICKET); // DONT KNOW WHAT THIS IS?
         OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(TheStopLoss,Digits),NormalizeDouble(TheTakeProfit,Digits),0,Green);
        }
        return(0);
     }
  }
  
  // CLOSE ORDER FUNCTIONS
  for(int cnt=0;cnt<OrdersTotal();cnt++)
     {
      OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);
      if(OrderType()<=OP_SELL &&   
         OrderSymbol()==Symbol() &&
         OrderMagicNumber()==MagicNumber 
         )  
        {
         if(OrderType()==OP_BUY)  
           {
              if((Close[0]<iMA(NULL,0,100,0,MODE_SMA,PRICE_CLOSE,0))) // CLOSE BUY LOGIC
              {
                   OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),Slippage,Red); // CLOSE BUY ACTION
              }
            if(TrailingStop>0)  
              {                 
               if(Bid-OrderOpenPrice()>MyPoint*TrailingStop)
                 {
                  if(OrderStopLoss()<Bid-MyPoint*TrailingStop)
                    {
                     OrderModify(OrderTicket(),OrderOpenPrice(),Bid-TrailingStop*MyPoint,OrderTakeProfit(),0,Green);
                     return(0);
                    }
                 }
              }
           }
         else 
           {
                if((Close[0]>iMA(NULL,0,200,0,MODE_SMA,PRICE_CLOSE,0))) // CLOSE SELL LOGIC
                {
                   OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),Slippage,Red); // CLOSE SELL ACTIOB
                }
            if(TrailingStop>0)  
              {                 
               if((OrderOpenPrice()-Ask)>(MyPoint*TrailingStop))
                 {
                  if((OrderStopLoss()>(Ask+MyPoint*TrailingStop)) || (OrderStopLoss()==0))
                    {
                     OrderModify(OrderTicket(),OrderOpenPrice(),Ask+MyPoint*TrailingStop,OrderTakeProfit(),0,Red);
                     return(0);
                    }
                 }
              }
           }
        }
     }
   return(0);
}

// CHECK TOTAL ORDER COUNT
int TotalOrdersCount()
{
  int result=0;
  for(int i=0;i<OrdersTotal();i++)
  {
     OrderSelect(i,SELECT_BY_POS ,MODE_TRADES);
     if (OrderMagicNumber()==MagicNumber) result++;

   }
  return (result);
}
