# Day 0 — Installing VMware Workstation Pro

## 🎯 Goal of the day
Set up VMware Workstation Pro as the local virtualization environment for my Terraform learning project.

---

## 🚧 Initial problem
I originally tried downloading VMware Workstation Pro from the **official Broadcom (VMware) website**, but the experience was terrible:

- The website is confusing and slow  
- Download links are hidden or inconsistent  
- Requires account creation  
- Endless redirects  
- **I never found the actual .exe installer**

After several attempts, it became clear that downloading directly from Broadcom was practically impossible.

---

## 💡 Practical solution: TechPowerUp
I found this external mirror:

🔗 **https://www.techpowerup.com/download/vmware-workstation-pro/**

Using this site:

- The `.exe` download was easy to find  
- Download speed was great  
- No login required  
- Installer was the official VMware file  

Installation steps were straightforward:

1. Download `VMware-workstation-full-*.exe`
2. Run the installer
3. Click *Next → Next → Finish*
4. Reboot Windows

---

## ✅ Result
VMware Workstation Pro installed successfully.

Ironically, an unofficial mirror (TechPowerUp) provided a better user experience than the official vendor website.

---

## 🧠 What I learned today
- Broadcom severely degraded VMware’s official download experience.
- Reliable third-party mirrors can save hours of frustration.
- I now have a working virtualization environment ready for Terraform.
