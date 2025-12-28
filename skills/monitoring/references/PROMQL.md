# PromQL Quick Reference

## Basic Queries
rate(http_requests_total[5m])
sum(rate(http_requests_total[5m])) by (status)
histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))

## Alerting Examples
up == 0
rate(http_requests_total{status=~"5.."}[5m]) > 0.1
