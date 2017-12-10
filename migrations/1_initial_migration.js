var Migrations = artifacts.require("./Migrations.sol");
var NitrousToken = artifacts.require("./NitrousToken.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(NitrousToken);
};
