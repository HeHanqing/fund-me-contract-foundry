// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script,console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.sol";

contract DeployFundMe is Script{
  function run() external returns(FundMe){
    //Before startBroadcast -> Not a "real" tx
    HelperConfig helperConfig = new HelperConfig();
    address ethusdPriceFeed = helperConfig.activeNetworkConfig();

    vm.startBroadcast();
    //Mock
    FundMe fundMe = new FundMe(ethusdPriceFeed);
    vm.stopBroadcast();
    return fundMe;
  }
}