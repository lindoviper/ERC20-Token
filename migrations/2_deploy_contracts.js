var token = artifacts.require("./FirstErc20Token.sol");

module.exports = function(deployer) {
  deployer.deploy(token,100000);
};