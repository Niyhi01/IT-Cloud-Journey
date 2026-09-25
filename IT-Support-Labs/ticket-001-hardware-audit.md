## Problem reported
The asset management database is missing internal specifications for user workstation deployment node 'ubuntu-server'. Technical support must provide an automated execution capture of the hardware structure for tracking compliance.

## Initial observations
The system is accessible remotely over SSH on `192.168.195.86`. The host machine is executing Ubuntu 22.04.5 LTS headless server profile under an Oracle VirtualBox virtualization engine layer.

## Possible causes considered
1. Manual lookup via standard GUI configuration utilities (Not possible due to standard headless shell environment).
2. Command-line individual parameter querying via raw `lscpu` and `free` logs (Functional, but inefficient for scaled inventory deployments).
3. Monolithic automation layout scripting using structural Bash streams (Most efficient option for standardized auditing).

## Tests performed
Created an inventory evaluation utility runtime at `~/IT-Cloud-Journey/IT-Support-Labs/hardware_audit.sh` leveraging native infrastructure flags (`lscpu`, `free`, `lsblk`). Added runtime permissions using `chmod +x` and executed the logic flow directly from the user terminal layer.

## Root cause
Infrastructure parameters were uncollected due to a lack of generalized telemetry scripts deployed to the targeted endpoints.

## Fix applied
Deployed a tailored parsing execution script configuration to capture core processing properties:

```bash
#!/bin/bash
echo "=== LINUX HARDWARE AUDIT ==="
echo "--- CPU Summary ---"
lscpu | grep -E "Model name|Core\(s\) per socket|Socket\(s\)"
echo ""
echo "--- RAM Capacity ---"
free -h
echo ""
echo "--- Storage Disks ---"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
```

## Verification
The hardware payload script parsed system profiles with 100% operational success. Captured log output metrics:

```text
=== LINUX HARDWARE AUDIT ===
--- CPU Summary ---
Model name:                              Intel(R) Core(TM) i7-6600U CPU @ 2.60GHz
Core(s) per socket:                      2
Socket(s):                               1

--- RAM Capacity ---
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       190Mi       1.3Gi       1.0Mi       392Mi       1.6Gi
Swap:          2.0Gi          0B       2.0Gi

--- Storage Disks ---
NAME                       SIZE TYPE MOUNTPOINT
sda                         25G disk 
├─sda1                       1M part 
├─sda2                       2G part /boot
└─sda3                      23G part 
  └─ubuntu--vg-ubuntu--lv 11.5G lvm  /
```

## Prevention / lesson learned
Manual hardware parameter verification takes too long and introduces formatting errors. Storing systemic audit script solutions in public version control branches provides support teams with rapid infrastructure visibility tools on newly provisioned machines.
