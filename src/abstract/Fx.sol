// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {IUniOpt, Position, State} from "../interfaces/IUniOpt.sol";
import {VerifySignature} from "../utils/VerifySignature.sol";
import "../abstract/Dependencies.sol";

abstract contract Fx is IUniOpt, VerifySignature, Dependencies {


    mapping(address => bytes32[]) userHashes;
    mapping(bytes32 => Position) hashPosition;
    mapping(address => uint256) assetTotalLiable;
    mapping(address => bool) isAllowedAToken;


    event NewPosition(bytes32 positionHash);
    event PositionLiquid(bytes32 positionHash);

    function verifyLPsig(Position memory P) public pure returns (bool s) {
        bytes memory signature = P.LPsig;
        delete P.executionPrice;
        delete P.expriresAt;
        delete P.LPsig;
        delete P.taker;

        P.state = State.Staging;
        P.durationBalance[1] = 0;

        bytes32 h = getEthSignedMessageHash(keccak256(abi.encode(P)));
        address signer = recoverSigner(h, signature);

        return (signer == P.lper);
    }


    /// @notice gets all the aToken underlying assets and their prices
    function getAllAssetsPrices() public view returns (address[] memory assets, uint256[] memory prices) {
        // assets = AaveV3Ethereum.POOL.getReservesList();
        // prices = AaveV3Ethereum.ORACLE.getAssetsPrices(assets);
    }

    //// @notice gets aToken address for Aave depositable asset
    /// @param assetAddress underlying ERC20 token address
    function getATokenAddressFor(address assetAddress) public view returns (address aToken) {
        // (aToken,,) = AaveV3Ethereum.AAVE_PROTOCOL_DATA_PROVIDER.getReserveTokensAddresses(assetAddress);
    }

    /// @notice gets Aave Oracle price given a base underlying asset address, response uses 8 decimals
    /// @param Asset address of base depositable asset
    function getPriceOfAsset(address Asset) public view returns (uint256) {
        // return ORACLE.getAssetPrice(Asset);
    }



    ///////////
    /// View



    function getPosition(bytes32 hashOf) public view returns (Position memory) {
        return hashPosition[hashOf];
    }
}
