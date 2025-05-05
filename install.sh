#!/bin/bash

# Color variables for styling
CYAN='\033[0;36m'
LIGHTBLUE='\033[1;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
PURPLE='\033[1;35m'
BOLD='\033[1m'
RESET='\033[0m'

# Display logo or banner
curl -s https://raw.githubusercontent.com/ritesh54367/aztec_sequencer-node_AutomationScript/main/logo.sh | bash

sleep 3

# Checking for the installation of curl and git
echo -e "\n${CYAN}${BOLD}---- CHECKING REQUIRED TOOLS ----${RESET}\n"
if ! command -v curl &> /dev/null; then
  echo -e "${RED}${BOLD}curl is not installed. Installing curl...${RESET}"
  sudo apt-get install -y curl
fi

if ! command -v git &> /dev/null; then
  echo -e "${RED}${BOLD}git is not installed. Installing git...${RESET}"
  sudo apt-get install -y git
fi

# Clone the repository to a temporary directory
echo -e "\n${CYAN}${BOLD}---- CLONING AZTEC SEQUENCER SCRIPT REPOSITORY ----${RESET}\n"
git clone https://github.com/ritesh54367/aztec_sequencer-node_AutomationScript.git /tmp/aztec-sequencer-node

# Make the script executable
chmod +x /tmp/aztec-sequencer-node/start_aztec_node.sh

# Run the script
echo -e "\n${CYAN}${BOLD}---- STARTING AZTEC SEQUENCER NODE ----${RESET}\n"
cd /tmp/aztec-sequencer-node
./start_aztec_node.sh

echo -e "${GREEN}${BOLD}Aztec Sequencer Node is now running!${RESET}\n"
