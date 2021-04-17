// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/// @title Flash Action
/// @author Amethyst C. (AlphaSerpentis)
/// @notice Performs flash exercise and flash loan of options
/// @dev Enables a user to flash exercise their position or perform an arbitrage move on Convexity (Opyn v1)
contract FlashAction {
    /// @notice Operating fee taken for every flash action
    /// @dev Operating fee in percentage (10000 = 100.00%)
    uint16 public operatingFee;
    /// @notice Address of the admin
    /// @dev Admin capable of producing calls to the contract
    address public admin;

    constructor(address _admin) {
        require(_admin != address(0), "Zero address");
        admin = _admin;
    }

    modifier onlyAdmin {
        _onlyAdmin();
        _;
    }

    function _feeCollection(uint256 _grossProfit) internal view returns(uint256 feeToCollect) {
        feeToCollect = _grossProfit * operatingFee / 10000;
    }
    function _onlyAdmin() internal view {
        require(msg.sender == admin, "FlashAction: Unauthorized");
    }
}