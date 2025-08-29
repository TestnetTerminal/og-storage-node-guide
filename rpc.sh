#!/bin/bash

while true; do
    # Local node request
    local_response=$(curl -s -X POST http://localhost:5678 \
        -H "Content-Type: application/json" \
        -d '{"jsonrpc":"2.0","method":"zgs_getStatus","params":[],"id":1}')

    # Extract values manually
    logSyncHeight=$(echo "$local_response" | grep -o '"logSyncHeight":[0-9]*' | cut -d':' -f2)
    connectedPeers=$(echo "$local_response" | grep -o '"connectedPeers":[0-9]*' | cut -d':' -f2)

    # External block number request
    remote_response=$(curl -s https://chainscan-galileo.0g.ai/v1/homeDashboard)
    remote_block=$(echo "$remote_response" | grep -o '"blockNumber":[0-9]*' | cut -d':' -f2)

    # Calculate difference
    diff=$((logSyncHeight - remote_block))
    behind=$((remote_block - logSyncHeight))

    # Determine status
    if [ "$diff" -ge 0 ]; then
        status="⚡ Ahead by $diff blocks"
        color="\033[36m"
    elif [ "$behind" -le 15 ]; then
        status="✅ Synced (≤15 blocks behind)"
        color="\033[32m"
    else
        status="⏳ Behind by $behind blocks"
        color="\033[33m"
    fi

    # Print the result
    echo -e "🧱 LOGS: \033[32m$logSyncHeight\033[0m | 🌐 CURRENT: \033[35m$remote_block\033[0m | 🤝 PEERS: \033[34m$connectedPeers\033[0m | STATUS: ${color}${status}\033[0m"

    sleep 5
done
