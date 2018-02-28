pragma solidity ^0.4.16;

contract ponziGame {

    address owner;

    function ponziGame (address newOwner) public {
        if(msg.sender != owner) return;
    }

    // Only One can transfer ownership to a new one

    function investByTransfer() payable returns (bool) {
        // Investors can invest by transferring => 100 wei
        owner.transfer(msg.value);
        return true;
    }

    function investMultipleTimes() public {
        // Each investor can invest multiple times

    }

    function getPaidByFactor() public {
        // Investors get paid by the factor between 1.1x and 1.3x
    }

    function getPaidByOrder() public {
        // Investors get paid in the investment order (FIFO)
        // As soon as there is enough balance

    }

    function rankedOnTotalInvestment() public {
        // All investors are ranked based on their total investment
        // Rank 1 is the hiest contributor
    }

    function vipInvestor() public {
        // At any time the top N investors according to the ranking
        // 5 <= N <= 10 are VIP investors
    }

    function investmentFee() public {
        // Each investment costs a fee between 1% and 5%
    }

    function feeOfEveryInvestment() public {
        // The fee of every 2 out of 3 investments is paid to the boss
    }

    function feePaidRandomly() public restricted {
        // The fee of every third investment is paid to a random
        // Investor who is VIP at that time

        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);

    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function checkingTransferError() public {
        // If there is an error transfering a fee to a VIP investor
        // The fee is paid to the boss
    }

    function modifyContractParameter() public {
        // the one can modify the following parameters of the contract
        // The payout factor (valid range: [1.1, 1.3])
        // The number of VIP investors (valid range: [5, 10])
        // The investment fee (valid range [1%, 5%])


    }

    function checkingTotalInvestment() public {
        // Every investor can check the total investments they made
    }

    function readCurrentBalance() public {

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

    function terminateContract() public {
        // Only the one can terminate the contract
    }

    function splitBalance() public {
        // Upon termination the available balance is split eually
        // between the VIP investors
        // If the balance in wei is less than
        // the number of VIP investors, then it’s transferred to
        // the top ranked investor only

    }

    function selfDestroying() public {
        // Upon termination the contract is self-destroyed
        function kill() public { /* do cleanup 1 */ mortal.kill(); }
        selfdestruct()
    }

}
