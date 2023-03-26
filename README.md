= FairTreasury
buyback and make machine for Algorand

== idea

based on
- blog: https://www.placeholder.vc/blog/2020/9/17/stop-burning-tokens-buyback-and-make-instead
- whitepaper: https://balancer.fi/whitepaper.pdf

depends on
https://github.com/algorandfoundation/specs/pull/79

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

**the math code is the main part and is summarised here: https://github.com/1m1-github/AlgoFixedPointMath/blob/main/README.md**

## watch a stream for an audio explanation of the project
https://www.youtube.com/watch?v=b6HxYjvkTj4
