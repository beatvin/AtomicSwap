// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract BobContract {

    address public bobAddress;
    address public alexAddress;

    string public secretCode;
    bytes32 public secretCodeHash;

    uint public startTime;
    uint public timeToLive;

    constructor(address _alexAddress, bytes32 _secretCodeHash) {

        bobAddress = msg.sender;

        alexAddress = _alexAddress;

        secretCodeHash = _secretCodeHash;

        timeToLive = 1 hours;

    }

    modifier onlyAlex() {

        require(msg.sender == alexAddress,'You are not Alex!');

        _;

    }
    
    modifier onlyBob() {

        require(msg.sender == bobAddress,'You are not Bob!');

        _;

    }

    receive() external payable onlyBob {

        startTime = block.timestamp;

    }

    function getMyMoney(string memory _secretCode) external onlyAlex {


        require(block.timestamp < startTime+timeToLive,'Period expired!');

        require(keccak256(abi.encodePacked(_secretCode)) == secretCodeHash,'Invalid secret code!');

        secretCode = _secretCode;

        payable(alexAddress).transfer(address(this).balance);
        

    }


    function getMyMoneyBack() external onlyBob {


        require(block.timestamp > startTime+timeToLive ,'Period is not expired!');

        payable(bobAddress).transfer(address(this).balance);
        

    }
}
