#!/bin/bash
# Author : Devmoses
# GitHub : https://github.com/devmoseslabs
# Version: v1.2.0

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
PURPLE="\033[1;35m"
RESET="\033[0m"

# Spinner animation
spinner() {
  local pid=$!
  local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
  local i=0
  while kill -0 $pid 2>/dev/null; do
    i=$(( (i+1) %10 ))
    printf "\r${CYAN}⏳ %s ${RESET}" "${spin:$i:1}"
    sleep 0.1
  done
  printf "\r"
}

# Random success messages
SUCCESS_MSGS=(
  "Input matrix stabilized 🧠"
  "Human–machine interface restored 🤝"
  "Touchpad back online 🚀"
  "Cursor freedom achieved 🖱️"
  "Control successfully reclaimed ⚡"
)
RANDOM_SUCCESS="${SUCCESS_MSGS[$RANDOM % ${#SUCCESS_MSGS[@]}]}"

# Detect distro (display only)
if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRO="$NAME"
else
  DISTRO="Unknown Linux"
fi

clear
echo -e "${CYAN}"
cat <<'ASCII'
██████╗ ███████╗██╗   ██╗███╗   ███╗ ██████╗ ███████╗███████╗██╗      █████╗ ██████╗ ███████╗
██╔══██╗██╔════╝██║   ██║████╗ ████║██╔═══██╗██╔════╝██╔════╝██║     ██╔══██╗██╔══██╗██╔════╝
██║  ██║█████╗  ██║   ██║██╔████╔██║██║   ██║███████╗█████╗  ██║     ███████║██████╔╝███████╗
██║  ██║██╔══╝  ╚██╗ ██╔╝██║╚██╔╝██║██║   ██║╚════██║██╔══╝  ██║     ██╔══██║██╔══██╗╚════██║
██████╔╝███████╗ ╚████╔╝ ██║ ╚═╝ ██║╚██████╔╝███████║███████╗███████╗██║  ██║██████╔╝███████║
╚═════╝ ╚══════╝  ╚═══╝  ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝
ASCII
echo -e "${RESET}"

echo -e "${PURPLE}🌀 Touchpad Resurrection Protocol v1.2.0${RESET}"
echo -e "${PURPLE}⚡ DEVMOSESLABS | https://github.com/devmoseslabs${RESET}"
echo -e "${PURPLE}🐧 Distro: ${DISTRO}${RESET}"
echo

sleep 0.4
echo -e "${YELLOW}[~] Scanning for touchpad type...${RESET}"
sleep 1

if lsmod | grep -q psmouse; then
  echo -e "${CYAN}🎯 [*] Target acquired: PS/2 interface detected.${RESET}"

  echo -ne "${YELLOW}🧹 [~] Purging old driver instance...${RESET}"
  (sudo modprobe -r psmouse && sleep 1) & spinner

  echo -ne "${YELLOW}🧬 [~] Injecting fresh driver modules...${RESET}"
  (sudo modprobe psmouse && sleep 0.5) & spinner

  echo -e "${GREEN}✅ [✓] ${RANDOM_SUCCESS}${RESET}"
  echo -e "${CYAN}═══════════════════════════════════════════════════════${RESET}"
  exit 0
else
  echo -e "${RED}⚠️  [!] PS/2 interface not found.${RESET}"
  echo -e "${CYAN}🔁 Deploying I2C recovery protocol...${RESET}"

  (sudo modprobe -r i2c_hid i2c_hid_acpi hid_multitouch 2>/dev/null && sleep 0.5) & spinner
  (sudo modprobe i2c_hid_acpi && sudo modprobe hid_multitouch && sudo modprobe i2c_hid) & spinner

  echo -e "${GREEN}✅ [✓] ${RANDOM_SUCCESS}${RESET}"
  echo -e "${CYAN}═══════════════════════════════════════════════════════${RESET}"
fi
