#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Halve Image Dimensions
# @raycast.mode compact
# @raycast.argument1 {"type": "text", "placeholder": "<img src=... width=... height=...>"}

result=$(echo "$1" | python3 -c "
import sys, re
text = sys.stdin.read()
text = re.sub(r'width=\"(\d+)\"', lambda m: f'width=\"{int(m.group(1))//2}\"', text)
text = re.sub(r'height=\"(\d+)\"', lambda m: f'height=\"{int(m.group(1))//2}\"', text)
print(text, end='')
")

echo -n "$result" | pbcopy
echo "Copied $result"  # this shows in the toast
