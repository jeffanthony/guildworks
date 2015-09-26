var supply = 10000;

var tokenContract = web3.eth.contract(tokenCompiled.token.info.abiDefinition);


var token = tokenContract.new(supply, {from:web3.eth.accounts[0], data:tokenCompiled.token.code, gas: 1000000}, function(e, contract){if(!e) {if(!contract.address) {console.log("Contract transaction send: TransactionHash: " + contract.transactionHash + " waiting to be mined...")} else {console.log("Contract mined! Address: " + contract.address);  console.log(contract)}}})

