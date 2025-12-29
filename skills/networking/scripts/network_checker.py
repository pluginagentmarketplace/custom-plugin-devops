#!/usr/bin/env python3
import json, socket
def check(host="8.8.8.8", port=53): 
    try: s = socket.socket(); s.settimeout(3); s.connect((host, port)); s.close(); return {"internet": True}
    except: return {"internet": False}
if __name__ == "__main__": print(json.dumps(check(), indent=2))
