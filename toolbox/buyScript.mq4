/* 
Name: BuyScript
Author: Carlo Bisda
Version: 0.0.0
License: MIT
Link: https://github.com/carlobisda
*/ 

#property copyright "Carlo Bisda"
#property link      "https://github.com/carlobisda"


//#property show_inputs
extern double Lots = 0.01;
extern bool   UseMoneyMgmt = false;
extern double RiskPercent = 2;
extern bool   UseStop = true;
extern bool   UseTakeProfit = true;
extern double StopLoss = 10;
extern double TakeProfit = 10;
extern string Note="0 in Entry field means Market Order Sell";
extern double Entry = 0.0000;

string Input = " Buy Price ";



//script program start function  
int start()
  { 
  double Risk = RiskPercent / 100;
  if (UseMoneyMgmt)  
   Lots = NormalizeDouble( AccountBalance()*Risk/StopLoss/(MarketInfo(Symbol(), MODE_TICKVALUE)),2); 
  int Mode = OP_BUYSTOP;
  if (Ask > Entry && Entry > 0) Mode = OP_BUYLIMIT; 
  if (Entry == 0)  {Entry = Ask; Mode = OP_BUY;}
  double SLB = Entry - StopLoss*Point, TPB = Entry + TakeProfit*Point;
  if (UseStop == false) SLB = 0;
  if (UseTakeProfit == false) TPB = 0;
  if(Lots > 0)
   OrderSend(Symbol(),Mode, Lots, Entry, 2,SLB , TPB, "Buy Script", 0, NULL, LimeGreen);


           
   return(0);
  }
//script end
