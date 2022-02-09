
const NFTCon = artifacts.require("NFTContract");
const TestToken = artifacts.require("TestFT");
const Swap = artifacts.require("Swap");

module.exports = function(deployer) {
 
  deployer.deploy(NFTCon);
  deployer.deploy(TestToken);
  deployer.deploy(Swap,"0xC3F8890e8e8ce4C32E82921f3Ce7EBb1bA271803","0x3902914c68A6342147262A9AD5f096E5849117d3");
 console.log("deployed successfully");
}