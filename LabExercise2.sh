#!/bin/bash

# Lab 2: Log Analysis

analyze_log() {
    LOG_FILE="access.log"

    if [ ! -f "$LOG_FILE" ]; then
        echo "❌ ไม่พบไฟล์ $LOG_FILE"
        return 1
    fi

    echo "📊 วิเคราะห์ Log File: $LOG_FILE"
    echo "==============================="

    # 1. นับจำนวน ERROR
    ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
    echo "❗ จำนวน ERROR ทั้งหมด: $ERROR_COUNT"
    echo "-------------------------------"

    # 2. หา IP ที่เข้ามามากที่สุด
    TOP_IP=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1)
    echo "🌐 IP ที่เข้ามามากที่สุด:"
    echo "$TOP_IP"
    echo "-------------------------------"

    # 3. สร้างสรุปรายงาน
    BACK_DIR="backup_log"
    mkdir -p "$BACK_DIR"

    REPORT="$BACK_DIR/log_report_$(date +%Y%m%d_%H%M%S).txt"
    {
        echo "📊 Log Analysis Report"
        echo "ไฟล์: $LOG_FILE"
        echo "วันที่: $(date)"
        echo "==============================="
        echo "จำนวน ERROR: $ERROR_COUNT"
        echo "-------------------------------"
        echo "Top IP:"
        echo "$TOP_IP"
    } > "$REPORT"

    echo "📄 รายงานถูกบันทึกไว้ที่: $REPORT"
    echo "==============================="
}

# เรียกใช้ function
analyze_log
