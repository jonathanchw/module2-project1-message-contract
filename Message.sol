// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title Message Contract
 * @author Jonathan
 * @notice This contract allows storing a message and a number on the blockchain.
 * @custom:security This contract is for educational purposes only and must not be used in production.
 */
contract Message {
    /*//////////////////////////////////////////////////////////////
                                State Variables
    //////////////////////////////////////////////////////////////*/
    /// @notice Stored message
    string private s_message;

    /// @notice Stored number
    uint256 private s_number;

    /// @notice Variables to store numbers for addition
    uint256 private s_a;
    uint256 private s_b;

    /// @notice Address of the last transaction sender
    address public s_sender;

    /// @notice Origin of the transaction
    address public s_origin;

    /// @notice Contract owner
    address public s_owner;

    /// @notice Reentrancy guard flag
    uint8 private s_flag = 0;

    /*//////////////////////////////////////////////////////////////
                                Events
    //////////////////////////////////////////////////////////////*/
    /// @notice Emitted when a message is updated
    event MessageUpdated(address indexed who, string message);

    /*//////////////////////////////////////////////////////////////
                                Modifiers
    //////////////////////////////////////////////////////////////*/
    /// @notice Restricts access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == s_owner, "Only the owner can execute this function");
        _;
    }

    /// @notice Prevents reentrancy
    modifier reentrancyGuard() {
        require(s_flag == 0, "Reentrancy detected");
        s_flag = 1;
        _;
        s_flag = 0;
    }

    /*//////////////////////////////////////////////////////////////
                                Constructor
    //////////////////////////////////////////////////////////////*/
    constructor() {
        s_owner = msg.sender;
    }

    /*//////////////////////////////////////////////////////////////
                                Functions
    //////////////////////////////////////////////////////////////*/

    /**
     * @notice Stores a message and a number on the blockchain
     * @param _message The message to store
     * @param _number The number to store
     */
    function setMessageAndNumber(string calldata _message, uint256 _number) external reentrancyGuard {
        s_message = _message;
        s_number = _number;
        s_sender = msg.sender;
        s_origin = tx.origin;

        emit MessageUpdated(msg.sender, _message);
    }

    /**
     * @notice Returns the stored message
     * @return message The stored message
     */
    function getMessage() external view returns (string memory message) {
        return bytes(s_message).length > 0 ? s_message : "not set";
    }

    /**
     * @notice Returns the stored number
     * @return number The stored number
     */
    function getNumber() external view returns (uint256 number) {
        return s_number;
    }

    /**
     * @notice Stores two numbers for addition
     * @param _a First number
     * @param _b Second number
     */
    function setSumNumbers(uint256 _a, uint256 _b) external {
        s_a = _a;
        s_b = _b;
    }

    /**
     * @notice Returns the sum of the stored numbers
     * @return sum The result of the addition
     */
    function sum() external view returns (uint256) {
        return s_a + s_b;
    }
}