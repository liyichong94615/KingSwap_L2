pragma solidity >=0.6.0 <0.8.0;

import "./bridges/BasicAMBErc677ToErc677.sol";
import "./interfaces/IBurnableMintableErc20Extension.sol";
import "./interfaces/IERC677.sol";

/**
* @title HomeAMBErc677ToErc677
* @dev Home side implementation for erc677-to-erc677 mediator intended to work on top of AMB bridge.
* It is designed to be used as an implementation contract of EternalStorageProxy contract.
*/
contract HomeAMBErc677ToErc677 is BasicAMBErc677ToErc677 {
    /**
     * @dev Executes action on the request to deposit tokens relayed from the other network
     * @param _recipient address of tokens receiver
     * @param _value amount of bridged tokens
     */
    function executeActionOnBridgedTokens(address _recipient, uint256 _value) internal override {
        uint256 value = _shiftValue(_value);
        bytes32 _messageId = messageId();
        IBurnableMintableErc20Extension(address(erc677token())).mint(_recipient, value);
        emit TokensBridged(_recipient, value, _messageId);
    }

    /**
     * @dev Executes action on withdrawal of bridged tokens
     * @param _token address of token contract
     * @param _from address of tokens sender
     * @param _value requsted amount of bridged tokens
     * @param _data alternative receiver, if specified
     */
    function bridgeSpecificActionsOnTokenTransfer(IERC677 _token, address _from, uint256 _value, bytes memory _data)
        internal
        override
    {
        if (!lock()) {
            IBurnableMintableErc20Extension(address(_token)).burn(_value);
            passMessage(_from, chooseReceiver(_from, _data), _value);
        }
    }

    /**
     * @dev Withdraws the erc20 tokens or native coins from this contract.
     * @param _token address of the claimed token or address(0) for native coins.
     * @param _to address of the tokens/coins receiver.
     */
    function claimTokens(address _token, address _to) external onlyIfUpgradeabilityOwner {
        // For home side of the bridge, tokens are not locked at the contract, they are minted and burned instead.
        // So, its is safe to allow claiming of any tokens. Native coins are allowed as well.
        claimValues(_token, _to);
    }

    function executeActionOnFixedTokens(address _recipient, uint256 _value) internal override {
        IBurnableMintableErc20Extension(address(erc677token())).mint(_recipient, _value);
    }
}
