// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract Lottery {
    address public manager;  // public for ease of access to JS front end
    address[] public players;
    
    constructor() {
        manager = msg.sender;
    }
    
    function enter() public payable {
        require(msg.value >= 1 wei);
        players.push(msg.sender);
    }
    
    function random() private view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
         
    }
    
    function pickWinner() public {
        require(msg.sender == manager);
        uint index = random() % players.length;
        payable(players[index]).transfer(address(this).balance);
        players = new address[](0);
    }
    
    function getPlayers() public view returns(address[] memory) {
        return players;
    }
}
