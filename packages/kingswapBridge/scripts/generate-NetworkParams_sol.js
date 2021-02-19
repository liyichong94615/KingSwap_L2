#!/usr/bin/env node
const { writeContent } = require('../../../scripts/shared/generateSol.lib');

writeContent `// Auto-generated by \`../scripts/generate-NetworkParams_sol.js\` (updates in this file will be lost).
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

/// @dev Network-dependant params (i.e. addresses, block numbers, etc..)
contract NetworkParams {
    // Layer1 (aka "home") chain:  "${'layer1 chain'}"
    // Side-chain (aka "foreign"): "${'side-chain'}" 

    /*
    // == HomeAMBErc677ToErc677::initilize() params ==
    // the AMB bridge contract on the side-chain
    _bridgeContract = ${'xAmbAddress'};
    // the mediator contract on the layer1 chain
    _mediatorContract = ${'ambErc20ExtAddress'}
    // the ERC20/ERC677 contract on the side-chain
    _erc677token = ${'xKingTokenAddress'};

    // == ForeignAMBErc677ToErc677::initilize() params ==
    // the AMB bridge contract on the layer1 chain
    _bridgeContract = ${'ambAddress'};
    // the mediator contract on the side-chain
    _mediatorContract = ${'xAmbErc20ExtAddress'}
    // the ERC20/ERC677 contract on the layer1 chain
    _erc677token = ${'kingTokenAddress'};

    // Limits per transaction in Wei [ _dailyLimit, _maxPerTx, _minPerTx ]
    // As soon as the limit is exceeded, transactions will fall
    _dailyLimitMaxPerTxMinPerTxArray = [
      100000000000000000000000,// maximum for one day
      10000000000000000000000, // maximum for one transaction
      10000000000000000,       // minimum for transaction
    ]
    // Execution limits [ _executionDailyLimit, _executionMaxPerTx ]
    _executionDailyLimitExecutionMaxPerTxArray = [
    
    ]
    */
}
`([__dirname, '../contracts/NetworkParams.sol'])
