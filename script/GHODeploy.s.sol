// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {UniOpt} from "../src/UniOpt.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("SPARK_PVK1"));

        GHOptim G = new UniOpt();
        string memory ghotoken;  /// = string.concat("GHOtoken: ", '"', vm.toString(GHO_MAINNET_ADDRESS), '"');
        string memory ghoptim = string.concat("GHOptim: ", '"', vm.toString(address(G)), '"');
        string memory log = string.concat("export const contractAddr = {", ghoptim, " , ", ghotoken, "}");
        console2.log(log);
        vm.writeFile("./public/deployments.js", log);
        vm.stopBroadcast();
    }
}
