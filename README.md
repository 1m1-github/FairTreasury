# AlgoTreasury
Buyback and make machine for Algorand

Based on https://www.placeholder.vc/blog/2020/9/17/stop-burning-tokens-buyback-and-make-instead and https://balancer.fi/whitepaper.pdf.

This smart contract (SC) is:
- a treasury for a project/DAO (coin issuance pool)
- a liquidity provider for the project coin vs multiple fee coins
- a buyback machine for the project coin

Define a basket of coins: C1, ..., CN.
Define weights: W1, ..., WN.
Define initial balances: B1, ..., BN.

The SC maintains a constant product V = Prod_i (Bi^Wi).

The network adds fee coins to the SC, therebuy triggering buy backs (via arbitrageurs).

The network sends users/producers project coins in exchange for various activities (e.g. being a user, providing liquidity elsewhere, marketing etc.)

There are no liquidity provider tokens. The project/DAO itself is the only liquidity provider in this SC.
Others can interact only by swapping the project/DAO coin vs one of the fee coins.

Project can change index.

Each swap incurs a small fee (0.05%) that goes to AlgoTreasury for dev. AlgoTreasury has its own AlgoTreasury SC.
