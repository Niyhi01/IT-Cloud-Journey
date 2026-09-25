#!/bin/bash
OUTPUT_FILE="linux_hardware_report.txt"
echo "==========================================" > $OUTPUT_FILE
echo "        LINUX HARDWARE AUDIT REPORT        " >> $OUTPUT_FILE
echo "==========================================" >> $OUTPUT_FILE
echo "Generated on: $(date)" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "--- CPU INFORMATION ---" >> $OUTPUT_FILE
lscpu | grep -E "Model name|Core\(s\) per socket|Socket\(s\)|CPU\(s\):" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "--- MEMORY (RAM) INFORMATION ---" >> $OUTPUT_FILE
free -h >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "--- STORAGE INFORMATION ---" >> $OUTPUT_FILE
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT >> $OUTPUT_FILE
echo "==========================================" >> $OUTPUT_FILE
echo "Audit complete! Saved to $OUTPUT_FILE"

