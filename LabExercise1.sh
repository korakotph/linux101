#!/bin/bash

# Lab 1: Server Health Check (ใช้ service command)

check_server() {
    echo "🔍 เริ่มตรวจสอบ server..."
    echo "==============================="

    # 1. ตรวจสอบ disk space (root partition /)
    echo "💽 Disk Usage:"
    df -h / | awk 'NR==2 {print "ใช้ไป: "$3" / เหลือ: "$4" ("$5")"}'
    echo "-------------------------------"

    # 2. ตรวจสอบ memory
    echo "🧠 Memory Usage:"
    free -h | awk 'NR==2 {print "ใช้ไป: "$3" / เหลือ: "$4" / รวม: "$2}'
    echo "-------------------------------"

    # 3. ตรวจสอบ services (nginx, mysql)
    echo "⚙️ Services Status:"
    for svc in nginx mysql; do
        if service $svc status >/dev/null 2>&1; then
            echo "✅ $svc ทำงานอยู่"
        else
            echo "❌ $svc ไม่ทำงาน!"
        fi
    done
    echo "-------------------------------"

    # 4. สร้าง report (เขียนไฟล์เก็บผล)
    BACK_DIR="backup-report"
    mkdir -p "$BACK_DIR"   # ถ้ายังไม่มีโฟลเดอร์ back จะสร้างให้

    REPORT="$BACK_DIR/server_report_$(date +%Y%m%d_%H%M%S).txt"
    {
        echo "📊 Server Health Report"
        echo "วันที่: $(date)"
        echo "==============================="
        echo "Disk:"
        df -h /
        echo "-------------------------------"
        echo "Memory:"
        free -h
        echo "-------------------------------"
        echo "Services:"
        for svc in nginx mysql; do
            service $svc status 2>&1 | head -n 3
            echo "-------------------------------"
        done
    } > "$REPORT"

    echo "📄 รายงานถูกบันทึกไว้ที่: $REPORT"
    echo "==============================="
}

# เรียกใช้ function
check_server
