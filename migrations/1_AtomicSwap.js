const AlexContract = artifacts.require("AlexContract");
const BobContract = artifacts.require("BobContract");

module.exports = function(deployer,network) {


    if (network == 'goerliAlex'){

        deployer.deploy(AlexContract,'0xbf7A496d4e1312Bb3895f34a5C7ceA951Cd1638F','weWillWin');

    }

    if (network == 'ropstenBob'){

        deployer.deploy(BobContract,'0x5Dd1187ab3f21eFc415acE15d9f94d043948ed7F','0xb49effff646fec7e72befb10b5088fbc266c4e605a84ecb1168310cac199b2be');

    }


};