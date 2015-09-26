function checkAllBalances() { 
var i =0; 
eth.accounts.forEach( function(e){
    console.log("  eth.accounts["+i+"]: " +  e + " \tbalance: " + web3.fromWei(eth.getBalance(e), "ether") + " ether & " + token.coinBalanceOf.call(eth.accounts[i])/100 + "% of Tech Enterprises REP"); 
i++; 
})
}; 
