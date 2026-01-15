# 🌀 fixtouch.sh — Touchpad Resurrection Protocol

A lightweight Linux utility to **reset and restore touchpad drivers without rebooting**.

Crafted with ❤️ by **devmoseslabs**

---

## ✨ Features

* 🖱️ Restores unresponsive touchpads instantly
* 🔄 Supports **PS/2** and **I2C HID** touchpads
* ⏳ Animated loaders for clear feedback
* 🎲 Random success messages
* 🧱 ASCII banner + versioning
* 🐧 Auto-detects Linux distribution (display-only)
* 🚀 No reboot required

---

## ⚡ One‑liner Install (curl | bash)

> This installs `fixtouch` system‑wide so you can run it from anywhere.

```bash
curl -fsSL https://raw.githubusercontent.com/devmoseslabs/fixtouch/main/fixtouch.sh | sudo tee /usr/local/bin/fixtouch > /dev/null && sudo chmod +x /usr/local/bin/fixtouch
```

Run it with:

```bash
sudo fixtouch
```

---

## 🛠 Manual Installation

### 1️⃣ Download the script

```bash
git clone https://github.com/devmoseslabs/fixtouch.git
cd fixtouch
```

Or download directly:

```bash
curl -O https://raw.githubusercontent.com/devmoseslabs/fixtouch/main/fixtouch.sh
```

---

### 2️⃣ Make it executable

```bash
chmod +x fixtouch.sh
```

---

### 3️⃣ Run it

```bash
sudo ./fixtouch.sh
```

---

### 4️⃣ (Optional) Install system‑wide

```bash
sudo mv fixtouch.sh /usr/local/bin/fixtouch
```

Then run it anytime:

```bash
sudo fixtouch
```

---

## 📦 What it does (brief)

* Detects touchpad type
* Reloads relevant kernel drivers:

  * `psmouse` for PS/2 devices
  * `i2c_hid`, `i2c_hid_acpi`, `hid_multitouch` for I2C devices
* Refreshes input without restarting the system

---

## 🔐 Requirements

* Linux system
* `bash`
* `modprobe`
* Root privileges (`sudo`)

---

## ⚠️ Notes

* Safe to run multiple times
* Does **not** modify firmware or BIOS
* If your touchpad is disabled in BIOS/UEFI, this will not fix it

---

## 🧠 Tested on

* Kali Linux
* Ubuntu / Debian-based distros
* Arch-based systems

(Should work on most modern Linux distributions)

---

## 📜 License

MIT License — use it, fork it, improve it.

---

## ⭐ Support

If this helped you:

* ⭐ Star the repo
* 🐛 Open an issue
* 🔧 Submit a PR

**Built to save reboots.**
