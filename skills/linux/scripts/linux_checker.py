#!/usr/bin/env python3
import json, subprocess
def check(): return {"kernel": subprocess.getoutput("uname -r"), "distro": subprocess.getoutput("cat /etc/os-release 2>/dev/null | head -1")}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
