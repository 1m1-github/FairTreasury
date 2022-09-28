# AlgoTreasury
buyback and make machine for Algorand

## idea

based on
- blog: https://www.placeholder.vc/blog/2020/9/17/stop-burning-tokens-buyback-and-make-instead
- whitepaper: https://balancer.fi/whitepaper.pdf

this smart contract (SC) is:
- a treasury for a project (coin issuance pool)
- a liquidity provider for the project coin vs multiple fee coins
- a buyback machine for the project coin

we have N different coins with weights $(w_1, ..., w_N)$ and initial balances $(B_1, ..., B_N)$

the SC maintains a *constant product* 

$$V = \prod_{i} B_i^{w_i}$$

the network adds fee coins to the SC, therebuy triggering buy backs (via arbitrageurs)

the network sends users/producers project coins in exchange for various activities (e.g. being a user, providing liquidity elsewhere, marketing etc.)

there are no liquidity provider tokens ~ the project itself is the only liquidity provider in this SC 
~ others can interact only by swapping the project coin vs one of the fee coins

SC allows update of $w_i$

maybe: each swap incurs a small fee (0.05%) that goes to AlgoTreasury for dev ~ AlgoTreasury has its own AlgoTreasury SC

## implementation

- we have logic code to define the functionality of the SC
- we have math code to calculate the quantities involved in fair swaps

**the math code is the main part, will be translated from existing and tested Solidity code and will be available independently via an ABI**

## $log$, $exp$, $pow$ for fixed point values with upto $36^*$ decimal precision exposed via ABI

the main challenge in the implementation is the need to conduct high precision fixed point calculations of $log$, $exp$, $pow$

they will be approximated using their Taylor expansions

the implementation will follow the below linked Solidity implementations by the team (balancer) that wrote the whitepaper ~ it is open license, the code has been in use for sometime by a well sized community and it is v2

to result in 18 decimal precision, we need to work with 256bit intermediary precision

arithmetic with 256bit `int` in `AVM` will be implemented using `b*` and `b/` (https://developer.algorand.org/docs/get-details/dapps/avm/teal/opcodes/#b_2)

the SC will expose $log$, $exp$, $pow$ and other mathematical functions via the currently suggested Algorand ABI (https://developer.algorand.org/docs/get-details/dapps/smart-contracts/ABI)

## existing Solidity code to be copied

- log, exp: https://github.com/balancer-labs/balancer-v2-monorepo/blob/592b0534f782b9bfb668990f7821e041a9b775d4/pkg/solidity-utils/contracts/math/LogExpMath.sol
- pow: https://github.com/balancer-labs/balancer-v2-monorepo/blob/592b0534f782b9bfb668990f7821e041a9b775d4/pkg/solidity-utils/contracts/math/FixedPoint.sol
- mult, div: https://github.com/balancer-labs/balancer-v2-monorepo/blob/592b0534f782b9bfb668990f7821e041a9b775d4/pkg/solidity-utils/contracts/math/Math.sol
- swap (_calcOutGivenIn): https://github.com/balancer-labs/balancer-v2-monorepo/blob/592b0534f782b9bfb668990f7821e041a9b775d4/pkg/pool-weighted/contracts/WeightedMath.sol


## watch a stream of the implementation
https://www.youtube.com/watch?v=b6HxYjvkTj4

* the Solidity implementation speaks of 18 decimal precision using 256bit values ~ Algorand currently allows 512bit values ~ we are assuming, for now, that doubling the precision of the intermediary values will double the precision of the result ~ to be calculated ~ the 512bit max was given by an Algorand internal dev and remains to be confirmed; dev is highly capable
