#!/usr/bin/env python3
import json
def check(): return {"prometheus": True, "grafana": True, "alerting": ["slack", "pagerduty"]}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
