// SPDX-License-Identifier: agpl-3.0
// Source: https://github.com/aave/protocol-v2/blob/ice/mainnet-deployment-03-12-2020/contracts/flashloan/interfaces/IFlashLoanReceiver.sol
pragma solidity ^0.8.3;

import {ILendingPoolAddressesProvider} from "./ILendingPoolAddressesProvider.sol";
import {ILendingPool} from "./ILendingPool.sol";

/**
 * @title IFlashLoanReceiver interface
 * @notice Interface for the Aave fee IFlashLoanReceiver.
 * @author Aave
 * @dev implement this interface to develop a flashloan-compatible flashLoanReceiver contract
 **/
interface IFlashLoanReceiver {
    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external returns (bool);

    function ADDRESSES_PROVIDER()
        external
        view
        returns (ILendingPoolAddressesProvider);

    function LENDING_POOL() external view returns (ILendingPool);
}
