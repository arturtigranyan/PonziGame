pragma solidity ^0.4.20;

contract ponziGame {

    struct Investment {
        address investor;
        uint amount;
        uint payoutFactor;
    }

    address private boss;
    
    uint top = 0;
    
    uint totalInvestment;
    
    uint128 payoutFactor_;
    
    Investment[] investments;
    
    function ponziGame(uint128 payoutFactor) public {
        payoutFactor_ = payoutFactor;
    }
    
    function setPayoutFactor(uint128 newPayout) public {
        require(newPayout >= 110 && newPayout <= 130);
        payoutFactor_ = newPayout;
    }

    function invest() payable {
        
        require(msg.value >= 100);
        
        investments.push(Investment(msg.sender, msg.value, payoutFactor_));
        
        boss.transfer(msg.value * 5 / 100);
        
        while(investments[top].amount * investments[top].payoutFactor / 100 < this.balance){
            investments[top].investor.transfer(investments[top].amount * investments[top].payoutFactor / 100);
            top++;
        }
    }
    
     function getEthBalance() constant returns(uint) {
        return this.balance;
    }
}