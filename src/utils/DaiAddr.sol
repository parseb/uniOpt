// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;


library DAIData {
    struct Token {
        address tokenAddress;
        uint256 chainId;
        string logoUri;
        string chainName; // Added chainName field
    }

    function getDAI(uint256 chainId) external pure returns (Token memory) {
        if (chainId == 1) {
            return Token(
                0x6B175474E89094C44Da98b954EedeAC495271d0F,
                1,
                "https://tokens.1inch.io/0x6b175474e89094c44da98b954eedeac495271d0f.png",
                "Ethereum" // Added chainName value
            );
        } else if (chainId == 10) {
            return Token(
                0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1,
                10,
                "https://cryptologos.cc/logos/multi-collateral-dai-dai-logo.svg?v=010",
                "Optimism" // Added chainName value
            );
        } else if (chainId == 56) {
            return Token(
                0x1AF3F329e8BE154074D8769D1FFa4eE058B1DBc3,
                56,
                "https://tokens.1inch.io/0x6b175474e89094c44da98b954eedeac495271d0f.png",
                "Binance Smart Chain" // Added chainName value
            );
        } else if (chainId == 100) {
            return Token(
                0x44fA8E6f47987339850636F88629646662444217,
                100,
                "https://tokens.1inch.io/0x6b175474e89094c44da98b954eedeac495271d0f.png",
                "xDai" // Added chainName value
            );
        } else if (chainId == 137) {
            return Token(
                0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063,
                137,
                "https://tokens.1inch.io/0x6b175474e89094c44da98b954eedeac495271d0f.png",
                "Polygon" // Added chainName value
            );
        } else if (chainId == 250) {
            return Token(
                0x8D11eC38a3EB5E956B052f67Da8Bdc9bef8Abf3E,
                250,
                "https://tokens.1inch.io/0x8d11ec38a3eb5e956b052f67da8bdc9bef8abf3e.png",
                "Fantom" // Added chainName value
            );
        } else if (chainId == 42161) {
            return Token(
                0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1,
                42161,
                "https://tokens.1inch.io/0x6b175474e89094c44da98b954eedeac495271d0f.png",
                "Arbitrum" // Added chainName value
            );
        } else {
            return Token(
                address(0),
                0,
                "",
                "" // Added chainName value
            );
        }
    }
}

