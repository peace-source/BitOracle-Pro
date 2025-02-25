# BitOracle Pro: Decentralized Bitcoin Prediction Markets

A Stacks L2-powered prediction market protocol for Bitcoin price speculation, featuring non-custodial staking, decentralized price resolution, and provably fair reward distribution.

## Features

### Core Protocol

- **L2 Prediction Markets**  
  Create time-bound markets for BTC/USD price movements with configurable parameters
- **STX Staking System**  
  Minimum 1 STX stake requirement with dynamic pool allocation
- **Decentralized Oracle**  
  Integrated price resolution via designated oracle nodes
- **Automated Payouts**  
  Proportional reward distribution with 2% protocol fee

### Technical Architecture

- **Clarity Smart Contracts**  
  Verifiable contract logic with Bitcoin-final settlement
- **Stacks L2 Optimization**  
  Sub-cent transactions with 10-second block confirmations
- **State Management**  
  Immutable market records with user prediction tracking
- **Fee Structure**  
  Protocol sustainability through automated fee capture

## Contract Specifications

### Technical Stack

- **Stacks Version**: 2.1+
- **Clarity Version**: 2.0.11
- **Contract Address**: `ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.bito-pro`
- **Compliance**: SIP-009 (NFT Standard), SIP-010 (Fungible Token)

## Installation

### Requirements

- Clarinet 1.5.0+
- Node.js 16.x
- Stacks.js 6.x

```bash
git clone https://github.com/yourorg/bitoracle-pro.git
cd bitoracle-pro
clarinet install
```

## Deployment

1. Configure `Clarinet.toml` with network parameters
2. Initialize development environment:

```bash
clarinet console --environment mainnet
```

3. Deploy contract:

```clarity
(contract-publish . contracts/bitoracle-pro.clar)
```

## Contract Functions

### Market Operations

#### Create Prediction Market

```clarity
(create-market u100000 144 288)  ;; $100,000 start price, 24h duration
```

**Parameters**:

- `start-price`: Initial BTC price (USD \* 100)
- `start-block`: Market activation block
- `end-block`: Market resolution block

#### Resolve Market

```clarity
(resolve-market u42 u105000)  ;; Market ID 42, $105,000 closing price
```

**Oracle Requirements**:

- Valid signature from authorized oracle
- Post-resolution 10-block cooldown

### User Operations

#### Place Prediction Stake

```clarity
(make-prediction u42 "up" u5000000)  ;; 5 STX on Bullish prediction
```

**Validation Rules**:

- Minimum 1 STX stake
- Market must be active
- Stake ≤ user balance

#### Claim Winnings

```clarity
(claim-winnings u42)  ;; Claims rewards from Market 42
```

**Payout Formula**:

```
Reward = (User Stake / Winning Pool) * Total Pool * 0.98
```

### Administrative Functions

#### Oracle Management

```clarity
(set-oracle-address 'STNEWORACLEADDRESS)
```

**Security Model**:

- Multi-sig threshold for critical operations
- 24-hour timelock on oracle changes

## Security Model

### Attack Mitigations

1. **Oracle Manipulation**
   Multi-source price verification with deviation checks
2. **Front-Running**
   Block-based resolution with 10-confirmation finality
3. **Sybil Attacks**
   Minimum stake requirements and progressive fee scaling
4. **Reentrancy**
   Clarity's inherent anti-reentrant design
