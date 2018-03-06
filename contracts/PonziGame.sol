pragma solidity ^0.4.20;

contract ponziGame {

    struct Investment {
        address investor;
        uint amount;
    }

    address private boss;
    
    uint top = 0;
    
    Investment[] investments;

    function invest() payable {
        
        require(msg.value > 100);
            
        investments.push(Investment(msg.sender, msg.value));
        
        boss.transfer(msg.value * 5 / 100);
        
        while(investments[top].amount * 110 / 100  < this.balance){
            investments[top].investor.transfer(investments[top].amount * 110 / 100);
            top++;
        }
    }
    
     function getEthBalance() constant returns(uint) {
        return this.balance;
    }

}