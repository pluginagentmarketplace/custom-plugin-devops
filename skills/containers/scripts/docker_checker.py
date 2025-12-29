#!/usr/bin/env python3
import json, subprocess
def check(): return {"docker": "docker" in subprocess.getoutput("docker --version"), "containers": subprocess.getoutput("docker ps -q | wc -l")}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
