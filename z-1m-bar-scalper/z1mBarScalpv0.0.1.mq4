
extern int MagicNumber=34474212;
extern double Lots =0.01;
extern double StopLoss=1;
extern double TakeProfit=1;
extern int TrailingStop=1;
extern int Slippage=3;
//+------------------------------------------------------------------+
//    expert start function
//+------------------------------------------------------------------+
int start()
{
  double MyPoint=Point;
  if(Digits==3 || Digits==5) MyPoint=Point*10;
  
  double TheStopLoss=0;
  double TheTakeProfit=0;
  if( TotalOrdersCount()==0 ) 
  {
     int result=0;
     if((Open[0]>Close[1])) // Here is your open buy rule
     {
        result=OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,0,0,"EA Generator www.ForexEAdvisor.com",MagicNumber,0,Blue);
        if(result>0)
        {
         TheStopLoss=0;
         TheTakeProfit=0;
         if(TakeProfit>0) TheTakeProfit=Ask+TakeProfit*MyPoint;
         if(StopLoss>0) TheStopLoss=Ask-StopLoss*MyPoint;
         OrderSelect(result,SELECT_BY_TICKET);
         OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(TheStopLoss,Digits),NormalizeDouble(TheTakeProfit,Digits),0,Green);
        }
        return(0);
     }
     if((Open[0]<Close[1])) // Here is your open Sell rule
     {
        result=OrderSend(Symbol(),OP_SELL,Lots,Bid,Slippage,0,0,"EA Generator www.ForexEAdvisor.com",MagicNumber,0,Red);
        if(result>0)
        {
         TheStopLoss=0;
         TheTakeProfit=0;
         if(TakeProfit>0) TheTakeProfit=Bid-TakeProfit*MyPoint;
         if(StopLoss>0) TheStopLoss=Bid+StopLoss*MyPoint;
         OrderSelect(result,SELECT_BY_TICKET);
         OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(TheStopLoss,Digits),NormalizeDouble(TheTakeProfit,Digits),0,Green);
        }
        return(0);
     }
  }
  
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
