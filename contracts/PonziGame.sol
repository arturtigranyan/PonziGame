pragma solidity ^0.4.20;

contract ponziGame {

    struct Investment {
        address investor;
        uint amount;
        uint payoutFactor;
    }

    address private boss;
    address[] investors;
    
    uint top = 0;
    
    uint128 payoutFactor_;
    
    Investment[] investments;
    
    mapping(address => uint) public investorInvestment;
    
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
        
        investorInvestment[msg.sender] += msg.value;
        
        boss.transfer(msg.value * 5 / 100);
        
        while(investments[top].amount * investments[top].payoutFactor / 100 < this.balance){
            investments[top].investor.transfer(investments[top].amount * investments[top].payoutFactor / 100);
            top++;
        }
    }
    
    function investorsRankedByInvesment(uint8 index) public constant returns (address investor, uint totalInvested){
        investor = investments[index].investor;
        totalInvested = investorInvestment[investor];
    }
    
     function getEthBalance() constant returns(uint) {
        return this.balance;
    }
}