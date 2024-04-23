// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;


abstract contract ERC20{
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns(bool success);
    function decimals() public virtual view returns (uint8);
}

contract TokenSale{
    
    uint tokenPriceInWei = 1 ether;
    ERC20 public token;
    address public tokenOwner;
    constructor(address _token){
        tokenOwner = msg.sender;
        token = ERC20(_token); //ERC20 token at address '_token'
    }
    function purchaseACoffee()public payable{
        require(msg.value >= tokenPriceInWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei; //If 1 ether send, trasnfer 1 token. If 1.5 ether send, transfer 1 token and return back 0.5 ether
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer * 10 ** token.decimals());  //(FROM, TO, AMT)
        payable(msg.sender).transfer(remainder); //pay rest of the money back

    }

}