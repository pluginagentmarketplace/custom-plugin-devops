#!/usr/bin/env python3
import json, subprocess
def check(): return {"aws_cli": "aws" in subprocess.getoutput("which aws 2>/dev/null")}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
