#!/usr/bin/env python3
import json, subprocess
def check(): return {"git_version": subprocess.getoutput("git --version"), "branch": subprocess.getoutput("git branch --show-current 2>/dev/null")}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
