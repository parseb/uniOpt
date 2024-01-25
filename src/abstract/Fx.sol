// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {IUniOpt, Position, State} from "../interfaces/IGHOptim.sol";
import {VerifySignature} from "../utils/VerifySignature.sol";

abstract contract Fx is IUniOpt, VerifySignature {


    mapping(address => bytes32[]) userHashes;
    mapping(bytes32 => Position) hashPosition;

    constructor() {
        genesis = msg.sender;
    }

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



    ///////////
    /// View



    function getPosition(bytes32 hashOf) public view returns (Position memory) {
        return hashPosition[hashOf];
    }
}
