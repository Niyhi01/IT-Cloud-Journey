# How to Audit a Workstation's Hardware from the Command Line — Linux and Windows

## 1. Purpose

This SOP provides a repeatable procedure for auditing a workstation's hardware using command-line tools.

The audit is divided into two areas:

1. **Hardware Specifications / Information** — what physical hardware the workstation contains.
2. **Current System Status** — the current state of important system resources.

The procedure is designed for Tier 1 IT support and should be performed before making hardware-related conclusions or changes.

---

## 2. Scope

This procedure covers command-line hardware auditing on:

* Ubuntu/Linux workstations
* Windows workstations using PowerShell

GUI-based hardware tools such as Device Manager are not used in this procedure.

---

# Phase 1 — Hardware Specifications / Information

The purpose of this phase is to establish **what hardware the workstation has**.

## 3. Linux Hardware Audit

### 3.1 Broad Hardware Inventory

Run:

```bash
sudo lshw -short
```

Use this to obtain a broad inventory of the workstation's hardware.

Record important findings such as:

* System/manufacturer and model
* Processor
* Memory
* Major storage devices
* Other significant hardware detected

### 3.2 CPU Information

Run:

```bash
lscpu
```

Record relevant CPU information such as:

* CPU model
* Architecture
* Number of physical cores
* Threads per core
* Number of logical CPUs
* CPU frequency information where relevant

### 3.3 Storage Layout

Run:

```bash
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
```

Record:

* Physical disks
* Disk sizes
* Partitions
* Partition types
* Mount points where applicable

This establishes the workstation's storage layout as seen by Linux.

---

# Phase 2 — Current System Status

The purpose of this phase is to determine **what the system is doing right now**, rather than simply documenting its hardware specifications.

## 4. Linux Memory Status

Run:

```bash
free -h
```

Record:

* Total memory
* Used memory
* Available memory
* Swap usage

Pay particular attention to **available memory** and swap usage when investigating a slow workstation.

High swap usage combined with very low available memory may indicate memory pressure and can contribute to poor system responsiveness.

---

# 5. Windows PowerShell Audit

Perform the Windows portion inside the Windows client VM once the VM is available.

The roadmap specifies the following PowerShell commands:

### 5.1 System Manufacturer and Model

```powershell
Get-ComputerInfo | Select-Object CsManufacturer, CsModel, BiosVersion
```

Record:

* Manufacturer
* Model
* BIOS version

### 5.2 CPU

```powershell
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed
```

Record:

* CPU name/model
* Number of cores
* Maximum clock speed

### 5.3 Physical Memory

```powershell
Get-CimInstance Win32_PhysicalMemory | Select-Object Capacity, Speed, Manufacturer
```

Record:

* Memory capacity
* Memory speed
* Memory manufacturer

### 5.4 Physical Disk

```powershell
Get-CimInstance Win32_DiskDrive | Select-Object Model, Size, InterfaceType
```

Record:

* Disk model
* Disk size
* Interface type

---

# 6. Recording the Results

Record the audit results in a consistent format.

### Hardware Specifications

| Category             | Information to record                                             |
| -------------------- | ----------------------------------------------------------------- |
| Manufacturer / Model | Workstation manufacturer and model                                |
| CPU                  | Model, cores, threads / relevant CPU details                      |
| RAM                  | Installed capacity and relevant specifications                    |
| Storage              | Disk model, capacity, type/interface, partitions where applicable |
| Other Hardware       | Significant hardware identified during the broad inventory        |

### Current System Status

| Category              | Information to record                    |
| --------------------- | ---------------------------------------- |
| Memory                | Total, used, available                   |
| Swap                  | Total and currently used                 |
| Other observed status | Relevant findings from the investigation |

---

# 7. Interpretation

Do not treat command output as the conclusion.

First determine:

1. **What information am I looking at?**
2. **Which values matter to the user's problem?**
3. **Does anything look unusual?**
4. **What conclusion does the evidence actually support?**

For example:

> Low available memory combined with significant swap usage provides evidence of memory pressure.

It does **not** automatically prove that RAM is defective.

Likewise:

> A high CPU utilization reading would indicate CPU workload.

It would not automatically prove that the CPU itself is faulty.

---

# 8. Procedure Summary

Follow this workflow when performing a Linux hardware audit:

```text
Start audit
    ↓
Phase 1 — Hardware Specifications
    ↓
sudo lshw -short
    ↓
lscpu
    ↓
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
    ↓
Phase 2 — Current System Status
    ↓
free -h
    ↓
Record important findings
    ↓
Interpret evidence
    ↓
Document conclusion
```

For Windows, perform the equivalent hardware audit using the specified PowerShell commands once the Windows client VM is available.

---

## 9. Important Technician Principle

**Diagnose before changing anything.**

The purpose of this audit is to gather evidence about the workstation before deciding what action, if any, is required.

Do not assume that unusual output means hardware failure. Compare the evidence with the user's symptoms and investigate further when necessary.

---

## 10. Expected Outcome

After completing this SOP, the technician should have a documented picture of:

* What hardware the workstation contains
* CPU configuration
* Installed memory
* Storage configuration
* Current memory/resource state
* Any findings that require further investigation

The procedure should be repeatable by another technician without needing to ask how the audit was performed.



## Windows Client VM — Audit Results

### System
- Manufacturer: innotek GmbH
- Model: VirtualBox
- Windows Product: Windows 10 Enterprise Evaluation
- Windows Version: 2009

### CPU
- Name: Intel Core i7-6600U CPU @ 2.60GHz
- Cores: 2
- Max Clock Speed: 2808 MHz

### Memory
- Total Physical Memory: 4,274,917,376 bytes (~4.0 GiB)
- Note: `Win32_PhysicalMemory` returned no data in this VM. A second query using `Win32_ComputerSystem` successfully confirmed the installed memory.

### Storage
- Model: VBOX HARDDISK
- Size: 64,420,392,960 bytes (~60 GB)
- Interface Type: IDE

### Interpretation
The Windows client VM successfully exposes the expected virtual CPU, approximately 4 GiB of RAM, and approximately 60 GB of virtual storage. The empty `Win32_PhysicalMemory` result was not interpreted as missing RAM; additional evidence was gathered using `Win32_ComputerSystem`.
