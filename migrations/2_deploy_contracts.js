var ConvertLib = artifacts.require("./ConvertLib.sol");
var EHR = artifacts.require("./EHR.sol");

module.exports = function (deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, EHR);
  deployer.deploy(EHR);
};
