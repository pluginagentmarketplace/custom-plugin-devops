#!/bin/bash
echo "AWS Cost Check (requires AWS CLI)"
aws ce get-cost-and-usage \
    --time-period Start=$(date -d "-30 days" +%Y-%m-%d),End=$(date +%Y-%m-%d) \
    --granularity MONTHLY \
    --metrics BlendedCost
