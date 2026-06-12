# Sprint 4: Traffic Management

## Goal

Implement Istio traffic management for safe releases and reliability.

## What Was Implemented

- Backend v2 deployment
- DestinationRule with v1 and v2 subsets
- VirtualService with canary traffic splitting
- Header-based routing for beta testers
- Retry policy
- Timeout policy
- Circuit breaker and outlier detection

## Canary Deployment

Canary deployment allows a new version to receive a small portion of production traffic.

Current policy:

```text
90% traffic → backend v1
10% traffic → backend v2