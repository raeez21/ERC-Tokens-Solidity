# ERC-Tokens-Solidity

ERC or Ethereum Request for Comments is simply a guideline or a template that all Ethereum-based tokens should follow. Tokens are created by smart contracts which are not only responsible for creating tokens but also for handling transactions and keeping track of balances. Each token contract can be completely different from the other so if one wants the token to be available on an exchange, the exchange has to write a custom code that can talk to the contract and allow people to trade. 
The same thing goes for wallet providers. Supporting hundreds of tokens would be very complex and time-consuming.  So it needed a standard for creating new tokens.

There are 2 main standards out there:
1. ERC20 (fungible tokens)
2. ERC 721 (Non Fungible Tokens

## ERC20 
ERC20 is one of the most significant standards for Ethereum tokens. This tokens represent any fungible assets like reputation points in a game, lottery tickets, fiat currency, gold, etc.

The [CoffeToken-ERC20.sol](CoffeToken-ERC20.sol) contract defines a new ERC20 token called "CoffeeToken". This token can be viewed as a ticket to buy a coffee from a Coffee Machine after spending 1 CoffeeToken. It inherits from the OpenZeppelin standards to create token. You can also use openzeppelin wizard to make a token contract. The file consists of usual functions in ERC20 standards and also some custom functions. The `buyOneCoffee()` burns 1 CoffeeToken from the caller and emits out an event called `CoffeePurchased`. Also, `buyOneCoffeeFrom()` allows a caller to spend 1 token from another account on the callers behalf. 

[CoffeeToken_Sale.sol](CoffeeToken_Sale.sol)
This is a token sale contract which lets you transfer 1 CoffeeToken to someone if he gives us 1 ether. (If he gives 2 ether, send him 2 CoffeeTokens. If he gives 2.4 ether, send him 2 CoffeeTokens and send the balance ether to him). We need to deploy this contract with address of the [CoffeToken-ERC20.sol](CoffeToken-ERC20.sol) contract. Then from the [CoffeToken-ERC20.sol](CoffeToken-ERC20.sol) set an allowance for this [CoffeeToken_Sale.sol](CoffeeToken_Sale.sol) contract to spend 5 tokens using `increaseAllowance()` function. Then use the purchaseACoffee() to buy 1 CoffeeToken in exchange of 1 ether.  

## ERC721

