#!/usr/bin/env python3
import json
def check(): return {"istio": True, "linkerd": False, "sidecar_injection": True}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
