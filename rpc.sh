#!/bin/bash

prev_logSyncHeight=0
prev_time=$(date +%s)

while true; do
    # Local node request
    local_response=$(curl -s -X POST http://localhost:5678 \
        -H "Content-Type: application/json" \
        -d '{"jsonrpc":"2.0","method":"zgs_getStatus","params":[],"id":1}')

    logSyncHeight=$(echo "$local_response" | grep -o '"logSyncHeight":[0-9]*' | cut -d':' -f2)
    connectedPeers=$(echo "$local_response" | grep -o '"connectedPeers":[0-9]*' | cut -d':' -f2)

    # External block number request
    remote_response=$(curl -s https://chainscan-galileo.0g.ai/v1/homeDashboard)
    remote_block=$(echo "$remote_response" | grep -o '"blockNumber":[0-9]*' | cut -d':' -f2)

    # Calculate differences
    diff=$((logSyncHeight - remote_block))
    behind=$((remote_block - logSyncHeight))

    # Time tracking
    current_time=$(date +%s)
    elapsed=$((current_time - prev_time))
    blocks_synced=$((logSyncHeight - prev_logSyncHeight))

    # Prevent divide by zero
    sync_rate=0
    if [ "$elapsed" -gt 0 ]; then
        sync_rate=$(echo "scale=2; $blocks_synced / $elapsed" | bc)
    fi

    eta_display=""

    # Determine status and ETA
    if [ "$diff" -ge 0 ]; then
        status="⚡ Ahead by $diff blocks"
        color="\033[36m"
    elif [ "$behind" -le 15 ]; then
        status="✅ Synced (≤15 blocks behind)"
        color="\033[32m"
    else
        status="⏳ Behind by $behind blocks"
        color="\033[33m"
        if (( $(echo "$sync_rate > 0" | bc -l) )); then
            eta_seconds=$(echo "$behind / $sync_rate" | bc)
            eta_formatted=$(printf "%02d:%02d:%02d" $((eta_seconds/3600)) $(( (eta_seconds%3600)/60 )) $((eta_seconds%60)) )
            eta_display="🕒 ETA: $eta_formatted"
        fi
    fi

    # Print result
    echo -e "🧱 LOGS: \033[32m$logSyncHeight\033[0m | 🌐 CURRENT: \033[35m$remote_block\033[0m | 🤝 PEERS: \033[34m$connectedPeers\033[0m | STATUS: ${color}${status}\033[0m $eta_display"

    # Update previous values
    prev_logSyncHeight=$logSyncHeight
    prev_time=$current_time

    sleep 5
done
