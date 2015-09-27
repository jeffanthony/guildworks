contract token { 
    mapping (address => uint) public coinBalanceOf;
    event CoinTransfer(address sender, address receiver, uint amount);

  /* Initializes contract with initial supply tokens to the creator of the contract */
  function token(uint supply) {
        if (supply == 0) supply = 10000;
        coinBalanceOf[msg.sender] = supply;
    }

  /* Very simple trade function */
    function sendCoin(address receiver, uint amount) returns(bool sufficient) {
        if (coinBalanceOf[msg.sender] < amount) return false;
        coinBalanceOf[msg.sender] -= amount;
        coinBalanceOf[receiver] += amount;
        CoinTransfer(msg.sender, receiver, amount);
        return true;
    }
};

var supply = 10000;

var tokenContract = web3.eth.contract(tokenCompiled.token.info.abiDefinition);


var token = tokenContract.new(supply, {from:web3.eth.accounts[0], data:tokenCompiled.token.code, gas: 1000000}, function(e, contract){if(!e) {if(!contract.address) {console.log("Contract transaction send: TransactionHash: " + contract.transactionHash + " waiting to be mined...")} else {console.log("Contract mined! Address: " + contract.address);  console.log(contract)}}});

