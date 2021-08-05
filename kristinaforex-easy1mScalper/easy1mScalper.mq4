// NAME: KRISTINA FOREX EASY 1M SCALPER
// AUTHOR: CARLO BISDA
// VERSION: 1.0.0
// LICENSE: MIT
//
// WARNING::
// THIS ALGO IS FOR EDUCATIONAL PURPOSES ONLY
// USE AT YOUR OWN RISK. ALGO IS BASED OFF KRISTINA FOREX YOUTUBE VIDEO
// https://www.youtube.com/watch?v=H4yJoCUa6IM

extern int MagicNumber=5555555;
extern double Lots =0.01;
extern double StopLoss=5;
extern double TakeProfit=10;
extern int TrailingStop=1;
extern int Slippage=3;

//    EXPERT START FUNCTION

int start()
{
  double MyPoint=Point;
  if(Digits==3 || Digits==5) MyPoint=Point*10;
  
  double TheStopLoss=0;
  double TheTakeProfit=0;
  if( TotalOrdersCount()==0 ) 
  {
     int result=0;
     if((Open[0]>iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,0))&&(20<iStochastic(NULL,0,5,3,3,MODE_SMA,1,MODE_MAIN,0))&&(25>iStochastic(NULL,0,5,3,3,MODE_SMA,1,MODE_MAIN,0))) // OPEN BUY RULE
     {
        result=OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,0,0,"CKDEVELOP LABS [2021]",MagicNumber,0,Blue);
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
     if((Open[0]<iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,0))&&(80>iStochastic(NULL,0,5,3,3,MODE_SMA,1,MODE_MAIN,0))&&(78<iStochastic(NULL,0,5,3,3,MODE_SMA,1,MODE_MAIN,0))) // OPEN SELL RULE
     {
        result=OrderSend(Symbol(),OP_SELL,Lots,Bid,Slippage,0,0,"CKDEVELOP LABS [2021]",MagicNumber,0,Red);
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
