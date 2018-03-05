pragma solidity ^0.4.20;

contract ponziGame {


    struct Investments {
        address investor;
        uint amount;
    }
    
    address private boss;
    uint256 top = 0;
    
    Investments[] investment;

    function getPaidByFactor() payable {
        
        investment.push(Investments(msg.sender, msg.value));
        
        boss.transfer(msg.value * 5 / 100);
        
        while(investment[top].amount * 110 / 100  < this.balance){
            investment[top].investor.transfer(investment[top].amount * 110 / 100);
            top++;
        }
    }
    
     function getEthBalance(address _addr) constant returns(uint) {
        return _addr.balance;
    }

}