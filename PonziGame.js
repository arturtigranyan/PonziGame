var balance = 0;
var Investments = [];
var theBoss = 0;

var payoutFactor = 110;

function invest(address, amount, payout){

    var investment = {
        amount: amount,
        address: address,
        payout: payout 
    }
    
    Investments.push(investment);    
    balance += investment.amount;

    transfer("Boss", amount * 5 / 100)
    
    while(Investments[0].amount * Investments[0].payout / 100 < balance){        
        transfer(Investments[0].address, Investments[0].amount * Investments[0].payout / 100)  
        Investments.shift();   
    }

    console.log("Current balance is " + balance  + " Invesments " + Investments.length)
}

function transfer(address, amount){
    balance -= amount;
    console.log(address + " gets peyout", amount + " wei")
}

payoutFactor = 110;
invest("abc", 100, 110);
invest("xyz", 1, 110);
payoutFactor = 130;
invest("cba", 100, 130);
invest("abc", 10, 130);
