pragma solidity ^0.4.20;

contract ponziGame {

    struct Investment {
        address investor;
        uint amount;
        uint payoutFactor;
    }
    
    address private boss;
    address[] vipInvestors_;
    
    
    uint top = 0;
    
    uint8 payoutFactor_;
    
    Investment[] investments;
    
    mapping(address => uint) public investorInvestment;
    
    function ponziGame(uint8 payoutFactor, uint8 vipInvestors) public {
        
        payoutFactor_ = payoutFactor;
        
        vipInvestors_.length = vipInvestors; 
    }
    
    function setPayoutFactor(uint8 newPayout) public {
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
    
    function getTotalInvestments(uint8 index) public constant returns (address investor, uint totalInvested){
        investor = investments[index].investor;
        totalInvested = investorInvestment[investor];
    }
    
    function getVipInvestors(uint8 index) public constant returns (address vipInvestor, uint totalInvested){
        require(0 <= index && index < vipInvestors_.length);
        vipInvestor = investments[index].investor;
        totalInvested = investorInvestment[vipInvestor];
    }
    
    function updateVipInvestor(address investor) public {
        uint8 insert = 0;
        uint newInvestment = investorInvestment[investor];
        
        if(insert < vipInvestors_.length){
            vipInvestors_[insert] = investor;
        }
        
    }
    
    function getEthBalance() constant returns(uint) {
        return this.balance;
    }
}