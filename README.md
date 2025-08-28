# 0G Storage Node OneClick Setup 🚀

[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![0G Network](https://img.shields.io/badge/Network-0G-blue.svg)](https://0g.ai/)

> **Automated installation and management script for 0G Storage Node with snapshot support**

## 🎮 How to Use

### 1. Launch the Script
```bash
bash <(curl -s https://raw.githubusercontent.com/TestnetTerminal/og-storage-node-guide/main/setup.sh)
```

- **📺 Tutorials**: Video guides available on X [Click here to watch](https://x.com/TestnetTerminal)

### 2. Interactive Menu System
The script displaysinteractive menu:

```
████████╗███████╗███████╗████████╗███╗   ██╗███████╗████████╗    ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     
╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝████╗  ██║██╔════╝╚══██╔══╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     
   ██║   █████╗  ███████╗   ██║   ██╔██╗ ██║█████╗     ██║          ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     
   ██║   ██╔══╝  ╚════██║   ██║   ██║╚██╗██║██╔══╝     ██║          ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     
   ██║   ███████╗███████║   ██║   ██║ ╚████║███████╗   ██║          ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗
   ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝   ╚═╝          ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝

╔══════════════════════════════════════════════════════════════════╗
║            🎉 Thank you for using our One-Click Setup! 🎉       ║
╚══════════════════════════════════════════════════════════════════╝

🔗 Our Links:
📱 Telegram: https://t.me/TestnetTerminal
🐙 GitHub: https://github.com/TestnetTerminal
🐦 Twitter/X: https://x.com/TestnetTerminal
🆘 Support: https://t.me/Amit3701

╔══════════════════════════════════════════════════════════════════╗
║             🚀 0G Storage Node OneClick Setup by Amit            ║
╚══════════════════════════════════════════════════════════════════╝

Please select an option:

1. 🛠️  Install 0G Storage Node
2. 🗑️  Stop & Delete 0G Storage Node  
3. 📥 Download Snapshot (Faster Sync)
4. ❌ Exit

Select an option (1-4):
```

### 3. Menu Options Explained

#### Option 1: 🛠️ Install 0G Storage Node
- **What it does**: Complete installation from scratch
- **Process**: Updates system → Installs dependencies → Builds node → Configures everything
- **User input required**: Private key, RPC endpoint choice
- **Time**: 20-30 minutes (+ optional snapshot download)

#### Option 2: 🗑️ Stop & Delete 0G Storage Node  
- **What it does**: Completely removes the node and all data
- **Safety**: Asks for confirmation before deletion
- **What gets deleted**: Service, directory, blockchain data, config files
- **Reversible**: No - complete removal (can reinstall with option 1)

#### Option 3: 📥 Download Snapshot (Faster Sync)
- **What it does**: Downloads pre-synced blockchain data
- **Requirement**: Node must be already installed (option 1)
- **Benefit**: Skip syncing millions of blocks (starts from block 5,611,223)
- **Time**: 30-60 minutes depending on internet speed

#### Option 4: ❌ Exit
- **What it does**: Graceful exit with thank you message
- **Safe**: Preserves all current installations and settings

## 🔧 Installation Process

### What Happens During Installation:

1. **📦 System Update**: Updates packages and installs dependencies
2. **🦀 Rust Installation**: Installs Rust compiler and tools
3. **🐹 Go Installation**: Installs Go programming language  
4. **📁 Repository Clone**: Downloads 0G Storage Node source code
5. **🔨 Build Process**: Compiles the node in release mode
6. **⚙️ Configuration**: Sets up config files with your credentials
7. **🚀 Service Creation**: Creates systemd service for automatic management
8. **📥 Snapshot Option**: Offers snapshot download for faster sync

### Estimated Time:
- **Without Snapshot**: 4-5 days for full sync
- **With Snapshot**: 5-60 minutes (depending on internet speed)

## 📥 Snapshot Feature

### Why Use Snapshot?
- **⚡ Faster Sync**: Start from block 5,611,223 instead of genesis block
- **⏰ Time Saving**: Reduces sync time from days to hours
- **🔄 Recent Data**: Snapshot is regularly updated

### Snapshot Details:
- **Starting Block**: 5,611,223
- **File Size**: ~2.30 GB (split into parts for easier download)
- **Download Source**: GitHub releases
- **Auto-monitoring**: Script monitors sync and auto-stops when snapshot block is reached

## 🎛️ Management Commands

After installation, use these commands to manage your node:

### Service Management
```bash
# Check node status
sudo systemctl status zgs

# Start the node
sudo systemctl start zgs

# Stop the node  
sudo systemctl stop zgs

# Restart the node
sudo systemctl restart zgs

# Enable auto-start on boot
sudo systemctl enable zgs
```

### View Logs
```bash
# View real-time logs (replace date)
tail -f ~/0g-storage-node/run/log/zgs.log.$(TZ=UTC date +%Y-%m-%d)

# View recent logs
journalctl -u zgs -f
```

### Check Sync Status
```bash
# API call to check sync status
curl -X POST http://localhost:5678 \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","method":"zgs_getStatus","params":[],"id":1}'
```

## 🎯 What This Script Does

This OneClick Setup script provides a **complete automated solution** for managing 0G Storage Nodes on your server. It handles everything from initial installation to maintenance and monitoring.

### ✨ Key Features

- **🛠️ Complete Installation**: Automatically installs all dependencies, builds the node, and configures everything
- **📥 Snapshot Support**: Download pre-synced blockchain data (starts from block 5,611,223) for faster setup
- **🔧 Easy Management**: Start, stop, and delete your node with simple menu options  
- **📊 Real-time Monitoring**: Built-in sync monitoring with auto-stop functionality
- **🎨 Beautiful Interface**: Colorful, user-friendly terminal interface with clear status messages
- **🔒 Secure Setup**: Handles private key configuration securely
- **⚙️ Systemd Integration**: Creates proper system services for reliable operation

## 📋 Prerequisites

### System Requirements
- **OS**: Ubuntu 20.04+ or Debian 11+ (recommended)
- **RAM**: Minimum 8GB, recommended 16GB+
- **Storage**: 100GB+ free space (SSD recommended)
- **CPU**: 4+ cores
- **Network**: Stable internet connection

## 🔐 Private Key Security & Handling

### How Private Key is Handled

#### 🔑 **Input Process**
```
🔑 Private Key Configuration
Please enter your wallet's private key:
⚠️ Do NOT include '0x' prefix
💡 Your private key will be securely added to config.toml

Enter Private Key: [HIDDEN INPUT - typing is not visible]
```

#### 🛡️ **Security Measures**
- **Hidden Input**: Your private key is NOT visible while typing (uses `read -s` command)
- **Local Storage Only**: Private key is stored ONLY in your local `config.toml` file
- **No Network Transmission**: Private key is NEVER sent over the internet
- **No Logging**: Private key doesn't appear in any log files
- **Automatic 0x Removal**: Script automatically removes '0x' prefix if accidentally included

#### 📁 **Where Private Key is Stored**
```bash
# File location
~/0g-storage-node/run/config.toml

# How it's stored (example)
[miner]
private_key = "your_private_key_without_0x_prefix"
```

#### 🚫 **What We DON'T Do**
- ❌ **No Internet Transmission**: Private key never leaves your server
- ❌ **No External APIs**: No calls to external services with your key
- ❌ **No Logging**: Private key never written to log files
- ❌ **No Backup to Cloud**: No automatic cloud backups
- ❌ **No Sharing**: Never transmitted to Telegram, GitHub, or any service

#### ✅ **What We DO**
- ✅ **Local File Only**: Store in config.toml on your server only
- ✅ **File Permissions**: Set appropriate Linux file permissions
- ✅ **Validation**: Check if key format is correct
- ✅ **Secure Input**: Hide typing during input process

### 🔒 Data Transmission & Network Activity

#### 📡 **What Gets Transmitted**
The node communicates with the 0G network for legitimate blockchain operations:
- **Blockchain Sync**: Downloading blocks and transactions
- **Peer Discovery**: Finding other nodes to connect with  
- **Transaction Broadcasting**: When you submit transactions (normal blockchain activity)
- **Network Consensus**: Participating in network consensus

#### 🚫 **What is NEVER Transmitted**
- ❌ Your private key
- ❌ Your config.toml contents
- ❌ Your personal server information
- ❌ Data to our Telegram/GitHub/social accounts
- ❌ Any personal identifiable information

#### 🌐 **Network Endpoints**
```bash
# Official 0G Network RPC (default)
blockchain_rpc_endpoint = "https://rpc-testnet.0g.ai"

# Or your custom RPC endpoint
blockchain_rpc_endpoint = "https://your-custom-rpc.com"
```
> get other rpc from https://astrostake.xyz/networks/0g-labs/endpoints-status

#### 🔍 **API Calls Made**
1. **Blockchain RPC**: Communicates with 0G blockchain for sync
2. **GitHub Releases**: Downloads snapshot files (if chosen)
3. **Package Repositories**: Downloads system dependencies (apt packages)
4. **0G Node Repository**: Downloads source code from 0glabs GitHub

#### 🚨 **Security Warnings**
```
⚠️  NEVER share your config.toml file
⚠️  NEVER post your private key anywhere  
⚠️  NEVER send private key via Telegram/Discord/Email
⚠️  Be cautious of phishing attempts asking for your key
```

### ❓ **Frequently Asked Security Questions**

**Q: Can the script creators access my private key?**
A: No. The private key is entered locally and stored only on your server. It never gets transmitted anywhere.

**Q: Is my private key visible in logs?**
A: No. The script specifically avoids logging the private key anywhere.

**Q: What if I want to change my private key later?**
A: Edit the `config.toml` file directly and restart the service:
```bash
nano ~/0g-storage-node/run/config.toml
sudo systemctl restart zgs
```

**Q: Can I run this on a shared server?**
A: Not recommended. Use a dedicated server/VPS for better security.

**Q: What happens if my server gets compromised?**
A: Your private key could be at risk. Always use a dedicated wallet for testnet activities.

## 🔍 Monitoring & Tracking

### Built-in Monitoring
The script includes real-time monitoring that shows:
- **📊 Current Block**: Your node's sync progress
- **👥 Connected Peers**: Number of network connections
- **🔄 Auto-stop**: Automatically stops monitoring at target block

### Telegram Bot (Recommended)
Get real-time notifications for your node:
- **Bot Link**: [@og_tracker_bot](https://t.me/og_tracker_bot)
- **Features**: Transaction alerts, reward notifications.

## 📂 File Locations

```
~/0g-storage-node/                    # Main installation directory
├── target/release/zgs_node           # Compiled binary
├── run/
│   ├── config.toml                   # Configuration file
│   ├── db/                           # Blockchain database
│   └── log/                          # Log files
└── /etc/systemd/system/zgs.service  # Systemd service file
```

## ⚠️ Important Notes

### Security
- **🔐 Private Key**: Your private key is stored ONLY in local `config.toml` - never transmitted anywhere
- **🔒 File Permissions**: Script sets appropriate file permissions automatically  
- **🚫 No Network Exposure**: Node API runs on localhost only by default
- **🛡️ Hidden Input**: Private key input is hidden while typing for security

### Backup Recommendations  
- **💾 Config Backup**: Backup your `config.toml` file
- **📱 Private Key**: Store your private key securely offline
- **📋 Node Info**: Note down your node's public key and other identifiers

### Resource Usage
- **💾 Disk Space**: Node database grows over time (1 TB+ recommended)
- **🌐 Bandwidth**: Continuous internet usage for sync and operation
- **⚡ CPU/RAM**: Moderate usage during normal operation, higher during sync

#### Snapshot Download Fails
- Check internet connection
- Ensure sufficient disk space (300GB+ free)
- Try running the script again - it will resume from where it left off

## 🔄 Updates & Maintenance

### Updating the Node
To update to a newer version:
1. Use option 2 to delete current installation
2. Use option 1 to install the latest version
3. Your private key will need to be re-entered

## 🤝 Support & Community

### Get Help
- **💬 Telegram Support**: [@Amit3701](https://t.me/Amit3701)
- **📱 Main Channel**: [@TestnetTerminal](https://t.me/TestnetTerminal)
- **🐦 Twitter/X**: [@TestnetTerminal](https://x.com/TestnetTerminal)
- **🐙 GitHub**: [TestnetTerminal](https://github.com/TestnetTerminal)

### Community Resources
- **📖 Documentation**: Check 0G Network official docs
- **👥 Discord**: Join 0G Network community
- **📺 Tutorials**: Video guides available on X [Click here to watch](https://x.com/TestnetTerminal)

## ⭐ Show Your Support

If this script helped you, please:
- ⭐ Star this repository
- 🔄 Share with other node operators
- 📱 Join our Telegram community
- 🐦 Follow us on Twitter/X

## 🙏 Acknowledgments

- **0G Labs**: For developing the 0G Storage Node
- **Community**: For testing and feedback
---

<div align="center">

**🚀 Happy Node Running! 🚀**

Made with ❤️ by [Testnet Terminal](https://github.com/TestnetTerminal)

</div>
