<p align="center">
  <img src="icon.png" alt="Icon" width="96" height="96">
</p>

# clean-mac

![Version 1.0.1](https://img.shields.io/badge/Version-1.0.1-blue)
![Compatible with macOS 15](https://img.shields.io/badge/Compability-macOS%2015-yellow)
[![MIT License](https://img.shields.io/badge/License-MIT-orange.svg)](https://choosealicense.com/licenses/mit/)

## 🧹 Bash cleanup script for macOS

A simple script to clean up and maintain your macOS system. It safely removes unnecessary files, clears caches, and optimizes system performance - all in a single command.

## 📚 Table of Contents

- [Getting Started](#🚀-getting-started)
- [Usage](#📦-usage)
- [Features](#🔧-features)
- [Contributing](#✨-contributing)
- [License](#⚖️-license)

## 🚀 Getting Started

### Prerequisites

- macOS 15 (Sequoia) or later
- Administrator privileges
- [Homebrew](https://brew.sh/) (optional, only for Homebrew cache cleanup)

### Installation

1. Clone this repository:

```bash
git clone https://github.com/adamsarba/clean-mac.git
```

2. Move to the project directory:

```bash
cd clean-mac
```

3. Make the script executable:

```bash
chmod +x CleanMac.sh
```

4. Move the script to your local bin:

```bash
sudo mv CleanMac.sh /usr/local/bin/CleanMac
```

### Quick Setup (Optional)

Add this alias to your `.zshrc` or `.bashrc` file for easier access:

```bash
alias clean-mac="sudo CleanMac | tee ~/Desktop/cleanup_log.txt"
```

## 📦 Usage

Run the script with:

```bash
sudo CleanMac
```

Or use the alias if configured:

```bash
clean-mac
```

The script will:

1. Create a backup of important system logs
2. Prompt for optional tasks (memory purge, Spotlight reindex)
3. Show disk space after cleanup

### Safety Measures

- Always creates backups before cleaning
- Asks for confirmation before risky operations
- Can be safely interrupted with Ctrl+C

### Common Issues

- If you get "Permission denied", make sure to run with `sudo`
- If the script isn't found, verify it's in `/usr/local/bin`
- For Homebrew-related errors, ensure Homebrew is installed

## 🔧 Features

- **System Cleanup**

  - Removes system logs and temporary files
  - Clears system and application caches
  - Empties trash on all volumes

- **Application Cleanup**

  - Cleans Adobe cache files
  - Removes old iOS device backups
  - Cleans Xcode derived data and archives
  - Purges Homebrew cache

- **Development Tools**

  - Cleans up Ruby gems
  - Manages Xcode-related files
  - Optimizes Homebrew installations

- **System Optimization**

  - Optional memory purge
  - Spotlight index rebuilding
  - System maintenance tasks

- **Safety Features**
  - Creates backups before cleaning
  - Respects System Integrity Protection
  - Handles errors gracefully

## ✨ Contributing

Contributions are welcome! Before contributing:

- Check existing issues and pull requests
- Test your changes thoroughly
- Follow the existing code style
- Add comments for complex logic

## ⚖️ License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Credits

- Icon design by [©Anmol Grao](https://anmolgrao.com/)
- Maintained by [@Adam Sarba](https://github.com/adamsarba)

### Support

If you find this tool helpful, please consider:

- ⭐ Starring the repository
- 🐛 Reporting issues
- 🔧 Contributing improvements
- 📢 Sharing with others

### Contact

For questions or support:

- Open an issue on GitHub
- Follow [@adamsarba](https://github.com/adamsarba) for updates
