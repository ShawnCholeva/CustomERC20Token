Deploying a custom token to the Ethereum Blockchain
=

Getting Started
-
These instructions will explain how to compile and deploy a custom ERC-20 compliant token to the Ethereum blockchain.

### Before we start:

1.  Download and Install NodeJS
2.  Install the truffle framework globally by running "npm install truffle -g"
3.  Install geth for your operating system from https://geth.ethereum.org/downloads/
        -  This was done using geth 1.7.3.

### Deploying to Ropsten Testnet:
1.  Navigate to the root folder of the application where the truffle.js is located.
2.  Run "truffle compile", this will output the contracts to the build directory we will deploy from.
3.  In a new command line window, run the command "geth --testnet --fast --rpc --rpcapi eth,net,web3,personal".  This will create a geth instance of the testnet and start mining the blockchain.
4.  In a new command line window, run "geth attach http://127.0.0.1:8545".  This will attach the window to the geth instance of the testnet we ran in the previous command.
5.  If an account is not created, run "geth --testnet account new" to create a new wallet.  You will also have to choose a password for this wallet.
6.  Before we can deploy the contract, you will need to send some ether to your geth account.  The way I did this, was to use the metamask chrome extension.  Once the chrome extension is installed, switch the chrome network to the Ropsten Testnet, then you can navigate to https://faucet.metamask.io/ and begin sending yourself some ether.  Once your testnet address received the ether you can transfer it to your geth account by sending it to the address that you got when you ran "geth --testnet account new" or an existing address.  Keep in mind that the ether will not appear in the geth account, until the block for the transfer has been mined and the states have been updated.
7.  Next run "personal.unlockAccount(eth.accounts[0])", this will make it so the account won't need authentication when deploying to the test network and also allows you to spend your ether.
    - eth.accounts[0] will point to the first wallet created in the testnet, if you want to try with a different wallet, you can specify the address string or the index of the correct wallet you want to use
8.  In the command line window where we ran "truffle compile", you can now run "truffle migrate --network ropsten", if you don't see your contract deploy to the network, add the --reset flag to the end of the        migrate command.
9.  Copy the addres from the migrate command, where it says "NitrousToken: 0x......", this address can now be added to the ropsten testnet wallet custom token and it will prepopulate the symbol and decimal amount.
10.  You have now deployed a custom token to the testnet!
