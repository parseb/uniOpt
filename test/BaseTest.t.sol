// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {stdJson} from "forge-std/StdJson.sol";
import {UniOpt} from "../src/UniOpt.sol";
import {IERC20Permit} from "openzeppelin-contracts/contracts/token/ERC20/extensions/IERC20Permit.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

interface IERC20P is IERC20, IERC20Permit {}

 contract BaseTest is Test {

    UniOpt UO;
    IERC20 DAI;

    

    function setUp() public {

        UO = new UniOpt();

    }


    function testIsDeployed() public {
        assertTrue(address(UO).code.length > 1, "no code" );
    }     

}