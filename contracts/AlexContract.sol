// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract AlexContract {

    address public alexAddress;
    address public bobAddress;

    bytes32 public secretCodeHash;

    uint public startTime;
    uint public timeToLive;

    constructor(address _bobAddress, string memory _secretCode) {

        alexAddress = msg.sender;

        bobAddress = _bobAddress;

        secretCodeHash = keccak256(abi.encodePacked(_secretCode));

        timeToLive = 1 days;

    }

    modifier onlyAlex() {

        require(msg.sender == alexAddress,'You are not Alex!');

        _;

    }
    
    modifier onlyBob() {

        require(msg.sender == bobAddress,'You are not Bob!');

        _;

    }

    receive() external payable onlyAlex {

        startTime = block.timestamp;

    }

    function getMyMoney(string memory _secretCode) external onlyBob {


        require(block.timestamp < startTime+timeToLive ,'Period expired!');

        require(keccak256(abi.encodePacked(_secretCode)) == secretCodeHash,'Invalid secret code!');

        payable(bobAddress).transfer(address(this).balance);
        

    }


    function getMyMoneyBack() external onlyAlex {


        require(block.timestamp > startTime+timeToLive ,'Period is not expired!');

        payable(alexAddress).transfer(address(this).balance);
        

    }
}
