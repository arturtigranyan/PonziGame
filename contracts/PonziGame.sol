pragma solidity ^0.4.20;

contract ponziGame {

    address private boss;

    mapping(address => uint) public investors;

    function ponziGame () public {
        boss = msg.sender;
    }

    function investByTransfer() public payable {
        require(msg.value >= 100 wei);
        investors[msg.sender] += msg.value;
    }    

    function getPaidByFactor(uint256 amount) public {
           
    }

    function getPaidByOrder() public {
        
    }

    function rankedOnTotalInvestment() public {        
        
    }

    function vipInvestor() public {
        
    }

    function investmentFee() public {        
        
    }

    function feeOfEveryInvestment() public {

    }

    function feePaidRandomly() public {
        
    }

    
    function checkingTransferError() public {

    }

    function modifyContractParameter() public {

    }

    function checkingTotalInvestment() public {

    }
    
    function readCurrentBalance() public returns (uint256) {
        return this.balance;
    }

    function readTotalInvestment() public {

    }

    function readPayouts() public {

    }
    
    function readNumberOfInvestors() public {
        
    }

    function readCurrentVIPInvestors() public {

    }

    function readCurrentPayout() public {

    }

    function readCurrentFee() public {

    }

    function bossTerminateContract() public {
        
    }

    function splitBalance() public {

    }    

    function selfDestroying() public {
        
    }

}
