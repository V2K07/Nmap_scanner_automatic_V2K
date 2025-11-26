🚀 Nmap Scanner Automatic — V2K

An automated, interactive, intense Nmap scan tool written in Bash.
Created as part of my self-learning & cybersecurity career development.

🔥 Overview

This project allows you to run intense Nmap scans on any target you own or have permission to scan.
It asks for the target (IP, CIDR, hostname), confirms, and performs a powerful scan using:

-sS (SYN scan)
-sV (Version detection)
-O  (OS detection)
-T5 (Max speed/aggressiveness)


Scans are timestamped, organized, and saved automatically in a structured directory.

🛠 Features

Interactive target input

Validates empty input

Confirmation before executing

Uses SYN + Version + OS detection

Aggressive timing: -T5

Automatically creates output directories

Saves results as:

.nmap

.xml

.gnmap

Includes timestamps for clean history tracking

Works on Kali Linux and any Linux OS with Bash + Nmap

📁 Folder Structure
Nmap_scanner_automatic_V2K
│
├── scan_history_intense/      # Output folder created after first run
│     ├── 192.168.1.10_2025-11-27_12-00-00.nmap
│     ├── 192.168.1.10_2025-11-27_12-00-00.xml
│     └── 192.168.1.10_2025-11-27_12-00-00.gnmap
│
├── intense_nmap.sh            # Main Bash script
└── README.md

⚙️ Installation
Clone the repo:
git clone https://github.com/V2K07/Nmap_scanner_automatic_V2K.git
cd Nmap_scanner_automatic_V2K

Give execute permission:
chmod +x intense_nmap.sh

OPTIONAL — Move to your system's ~/bin/
mkdir -p ~/bin
cp intense_nmap.sh ~/bin/
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc


Now you can run it from anywhere using:

intense_nmap.sh

🧪 Usage

Run the script:

./intense_nmap.sh


Enter the target:

Enter target (IP, CIDR or hostname): 192.168.1.0/24


Confirm:

Type 'yes' to continue:


Scan runs → files saved to:

~/scan_history_intense/

⚠️ Legal Warning

Only scan networks and systems that you own or have explicit written permission to test.
Unauthorized scanning can be illegal and may violate institutional or local laws.

📚 Requirements

Bash

Nmap

sudo privileges for SYN scan and OS detection

💡 Future Improvements (Roadmap)

Add multi-target scanning from a file

Add ping sweep detection

Add service fingerprinting summary

Add cron support for daily scans

Add HTML report generation

Add email or Telegram notifications

👤 Author

Viswa (V2K)
Second-year Computer Science student exploring cybersecurity & automation.
Open to collaboration, suggestions, and improvements.

🤝 Contributing

Pull requests and suggestions are welcome.
