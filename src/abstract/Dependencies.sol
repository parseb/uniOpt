// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IPool} from "aave-v3-core/interfaces/IPool.sol";
import {IAToken} from "aave-v3-core/interfaces/IAToken.sol";
import {IAaveOracle} from "aave-v3-core/interfaces/IAaveOracle.sol";

abstract contract Dependencies {

    address public immutable DEPLOYER;
    address public immutable DevChest;
    IPool public lbPOOL;
    IAaveOracle public ORACLE;

    constructor() {
        DEPLOYER = msg.sender;
        DevChest = msg.sender;
        
    }
    error NotDeployer();

    function changeDep(address dep_,address lbP_, address oracle_) external {
        if (msg.sender != DEPLOYER) revert NotDeployer();
    }




}
