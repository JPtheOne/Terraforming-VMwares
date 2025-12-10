# Day 1 — Installing Terraform on Windows

## 🎯 Goal of the day
Install Terraform on Windows so I can start automating VMware using Infrastructure as Code.

---

## 🚧 The struggle: I thought Terraform had an installer
Terraform downloads as a file like: exe


Naturally, I assumed this was an installer (like VMware’s EXE), but:

- Double-clicking it did nothing  
- It didn’t open a UI  
- It didn’t install anything  
- PowerShell said: “command not recognized”  
- CMD also didn’t detect it  

For a while, I genuinely believed the file was broken.

---

## ⚠️ The truth: Terraform is **not** an installer
Terraform is a **portable executable**:

- No installer
- No wizard
- No setup UI

You simply place `terraform.exe` somewhere in your PATH.

If it stays inside `Downloads`, Windows cannot find it.

---

## 💥 The fix: rename + move to System32

### These PowerShell commands solved everything:

```powershell
Set-Location "$HOME\Downloads"

# Rename the downloaded file to terraform.exe
Rename-Item -Path (Get-ChildItem terraform*.exe).Name -NewName "terraform.exe"

# Copy it to System32 so Windows treats it as a global command
Copy-Item -Path "$HOME\Downloads\terraform.exe" -Destination "C:\Windows\System32" -Force


