#!/usr/bin/env python3
import sys
import time
from datetime import datetime, timezone

def convert_epoch(epoch_str):
    epoch = int(epoch_str)
    length = len(epoch_str)

    # Auto-detect precision
    if length <= 10:
        seconds = epoch
        precision = "seconds"
    elif length <= 13:
        seconds = epoch / 1000
        precision = "milliseconds"
    elif length <= 16:
        seconds = epoch / 1_000_000
        precision = "microseconds"
    else:
        seconds = epoch / 1_000_000_000
        precision = "nanoseconds"

    utc_time = datetime.fromtimestamp(seconds, tz=timezone.utc)
    local_time = datetime.fromtimestamp(seconds)

    print(f"Input:     {epoch} ({precision})")
    print(f"UTC:       {utc_time.strftime('%Y-%m-%d %H:%M:%S.%f')}")
    print(f"Local:     {local_time.strftime('%Y-%m-%d %H:%M:%S.%f %Z')}")

def show_current():
    now = time.time()
    utc_time = datetime.fromtimestamp(now, tz=timezone.utc)
    local_time = datetime.fromtimestamp(now)

    print(f"Epoch (s):  {int(now)}")
    print(f"Epoch (ms): {int(now * 1000)}")
    print(f"Epoch (ns): {int(now * 1_000_000_000)}")
    print(f"UTC:        {utc_time.strftime('%Y-%m-%d %H:%M:%S.%f')}")
    print(f"Local:      {local_time.strftime('%Y-%m-%d %H:%M:%S.%f %Z')}")

if __name__ == "__main__":
    if len(sys.argv) == 1:
        show_current()
    else:
        convert_epoch(sys.argv[1])
