#!/usr/bin/env python3
import json
from pathlib import Path
def check(path="."): p = Path(path); return {"tf_files": len(list(p.glob("*.tf"))), "tfstate": (p/"terraform.tfstate").exists()}
if __name__ == "__main__": import sys; print(json.dumps(check(sys.argv[1] if len(sys.argv)>1 else "."), indent=2))
