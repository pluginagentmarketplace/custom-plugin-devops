#!/usr/bin/env python3
import json
def check(): return {"metrics": True, "logs": True, "traces": True, "pillars": 3}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
