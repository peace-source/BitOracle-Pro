;; Title: BitOracle Pro: Bitcoin Prediction Markets on Stacks L2
;; 
;; Summary: A decentralized, non-custodial prediction market protocol enabling secure BTC price speculation
;; using Stacks L2 for Bitcoin-settled contracts with minimized trust and maximized transparency.
;;
;; Description:
;; BitOracle Pro revolutionizes Bitcoin price prediction markets through Clarity smart contracts
;; on Stacks L2. As the premier platform for BTC price speculation, we offer:
;;
;; - Bitcoin-native design: Native integration with Bitcoin price oracles and sBTC settlement
;; - Layer-2 efficiency: Sub-cent transaction costs with 10-second block times
;; - Institutional-grade security: Inherits Bitcoin's proof-of-work security through Stacks L2
;; - Fair market dynamics: Anti-sybil stake weighting and manipulation-resistant oracle feeds
;; - Transparent economics: Real-time reward calculations with on-chain verification
;; - Protocol sustainability: Automated fee structure ensuring long-term viability
;;
;; Technical Highlights:
;; - Clarity smart contracts enable verifiable market logic
;; - Bitcoin-anchored price resolution via decentralized oracles
;; - Dynamic reward distribution using provably fair ratios
;; - Non-custodial staking with direct user control
;; - Gas-optimized operations through Stacks L2 architecture
;;
;; Security Architecture:
;; 1. Multi-layered access controls with contract owner oversight
;; 2. Stake-weighted participation thresholds
;; 3. Time-locked market resolution phases
;; 4. Double-claim protection through state tracking
;; 5. Fee safeties with owner withdrawal limits
;;
;; Compliance Features:
;; - Bitcoin-compatible settlement finality
;; - STX-denominated operations
;; - On-chain audit trails
;; - Regulatory-ready participant verification
;; - Non-custodial asset management

;; Constants

;; Administrative
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))

;; Error codes
(define-constant err-not-found (err u101))
(define-constant err-invalid-prediction (err u102))
(define-constant err-market-closed (err u103))
(define-constant err-already-claimed (err u104))
(define-constant err-insufficient-balance (err u105))
(define-constant err-invalid-parameter (err u106))

;; State Variables

;; Platform configuration
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum stake
(define-data-var fee-percentage uint u2) ;; 2% platform fee
(define-data-var market-counter uint u0)

;; Data Maps

;; Market data structure
(define-map markets
    uint
    {
        start-price: uint,
        end-price: uint,
        total-up-stake: uint,
        total-down-stake: uint,
        start-block: uint,
        end-block: uint,
        resolved: bool
    }
)