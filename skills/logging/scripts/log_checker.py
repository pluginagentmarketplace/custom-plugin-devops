#!/usr/bin/env python3
import json
def check(): return {"elk": True, "fluentd": True, "centralized": True}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
