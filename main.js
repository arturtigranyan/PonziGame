var testContract = web3.eth.contract([]);
var test = testContract.new(
   {
     from: web3.eth.accounts[0], 
     data: '0x60606040523415600e57600080fd5b603580601b6000396000f3006060604052600080fd00a165627a7a723058204e22460480dfac1f20149172b3f3254f20c8c9d78f09a1977b4b170f417c0fe70029', 
     gas: '4700000'
   }, function (e, contract){
    console.log(e, contract);
    if (typeof contract.address !== 'undefined') {
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
 })