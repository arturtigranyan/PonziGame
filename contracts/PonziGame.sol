pragma solidity ^0.4.20;

contract ponziGame {

    struct Investment {
        address investor;
        uint amount;
        uint payout;
    }

    address private boss;
    
    uint top = 0;
    
    uint totalInvestment;
    
    uint128 payoutFactor_;
    
    Investment[] investments;
    
    function ponziGame(uint128 payoutFactor) public {
        payoutFactor_ = payoutFactor;
    }

    function invest() payable {
        
        require(msg.value >= 100);
            
        investments.push(Investment(msg.sender, msg.value, msg.value * payoutFactor_ / 100 ));
        
        boss.transfer(msg.value * 5 / 100);
        
        while(investments[top].amount < this.balance){
            investments[top].investor.transfer(investments[top].amount);
            top++;
        }
    }
    
     function getEthBalance() constant returns(uint) {
        return this.balance;
    }
}