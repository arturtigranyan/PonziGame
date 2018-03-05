var balance = 0;
var Investments = [];
var theBoss = 0;

function getPaidByFactor(address, amount){

    var investment = {
        amount: amount,
        address: address
    }
    
    Investments.push(investment);    
    balance += investment.amount;

    transfer("Boss", amount * 5 / 100)
    
    while(Investments[0].amount * 110 / 100 < balance){        
        transfer(Investments[0].address, Investments[0].amount * 110 / 100)     
        Investments.shift();   
    }

    console.log("Current balance is " + balance  + " Invesments " + Investments.length)    
  
}

function transfer(address, amount){
    balance -= amount;
    console.log(address + " gets peyout", amount + " wei")
}

pf = 110;
getPaidByFactor("abc", 100);
getPaidByFactor("xyz", 1);
pf = 130;
getPaidByFactor("cba", 100);
getPaidByFactor("abc", 10);
