# 0G Storage Node OneClick Setup 🚀

[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![0G Network](https://img.shields.io/badge/Network-0G-blue.svg)](https://0g.ai/)

> **Automated 0G Storage Node installer with snapshot support for faster sync**

## 🚀 Quick Start

```bash
bash <(curl -s https://raw.githubusercontent.com/TestnetTerminal/og-storage-node-guide/main/setup.sh)
```

**📺 Video Tutorial**: [Watch on X](https://x.com/TestnetTerminal) (comming soon)

## 🎯 What This Does

- **🛠️ Auto Installation**: Installs all dependencies, builds node, creates systemd service
- **📥 Snapshot Support**: Download pre-synced data (block 5,822,656) - saves 4-5 days
- **🔧 Easy Management**: Install, delete, or download snapshot via interactive menu
- **🔒 Secure**: Private key stored locally only, never transmitted anywhere

## 📋 Requirements

- **OS**: Ubuntu 20.04+ / Debian 11+
- **RAM**: 8GB+ (16GB recommended)
- **Storage**: 1 Tb+ free space (SSD recommended)
- **Network**: Stable internet connection
- **Have Ready**: Your wallet private key (without 0x prefix)

## 🎮 Interactive Menu

The script displays a colorful menu interface:

```
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

**Menu Explained:**
- **Option 1**: Full installation with dependencies, build, and setup (20-30 min)
- **Option 2**: Complete node removal with safety confirmation 
- **Option 3**: Download pre-synced data to skip days of syncing (30-60 min)
- **Option 4**: Graceful exit with thank you message

## 🔐 Security

- **🛡️ Private Key**: Hidden input, stored only in local `config.toml`
- **🚫 Never Transmitted**: Your private key NEVER leaves your server
- **📁 Local Only**: No cloud backups, no external API calls with your key
- **🔒 File Permissions**: Automatically set secure permissions

## 🎛️ Management Commands

```bash
# Check status
sudo systemctl status zgs
```
```bash
# View logs
tail -f ~/0g-storage-node/run/log/zgs.log.$(TZ=UTC date +%Y-%m-%d)
```
```bash
# Check sync status
bash <(curl -s https://raw.githubusercontent.com/TestnetTerminal/og-storage-node-guide/main/rpc.sh)
```


## 📥 Snapshot Benefits

- **⚡ Fast Sync**: Start from block 5,611,223 instead of genesis
- **⏰ Time Saving**: Reduces sync from 4-5 days to 30-60 minutes
- **📊 Size**: ~2.30 GB download

## ⚠️ Important Notes

- **💾 Storage**: Database grows over time (1TB+ recommended)
- **🔑 Backup**: Save your `config.toml` file securely
- **🆘 Updates**: Delete old installation, then reinstall for updates

## 🤝 Support

- **💬 Support**: <a href="https://t.me/Amit3701" target="_blank" rel="noopener noreferrer">@Amit3701</a>
- **📱 Community**: <a href="https://t.me/TestnetTerminal" target="_blank" rel="noopener noreferrer">@TestnetTerminal</a>
- **🐦 Twitter/X**: <a href="https://x.com/TestnetTerminal" target="_blank" rel="noopener noreferrer">@TestnetTerminal</a>
- **🤖 Tracker Bot**: <a href="https://t.me/og_tracker_bot" target="_blank" rel="noopener noreferrer">@og_tracker_bot</a>

## 🔍 Alternative RPC

Get other RPC endpoints: <a href="https://astrostake.xyz/networks/0g-labs/endpoints-status" target="_blank" rel="noopener noreferrer">https://astrostake.xyz/networks/0g-labs/endpoints-status</a>

---

<div align="center">

**🚀 Made with ❤️ by [Testnet Terminal](https://github.com/TestnetTerminal) 🚀**

⭐ Star this repo • 🔄 Share with others • 📱 Join our community

</div>
