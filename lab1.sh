#!/bin/bash

# Lab 1: Server Health Check

check_server() {
    echo "📊 === Server Health Check ==="
    echo "วันที่: $(date)"
    echo ""

    ### 1️⃣ ตรวจสอบ Disk Space
    echo "💾 ตรวจสอบพื้นที่ Disk (root /):"
    DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

    if [ $DISK_USAGE -gt 80 ]; then
        DISK_STATUS="⚠️ คำเตือน: ใช้ไป $DISK_USAGE%"
    elif [ $DISK_USAGE -gt 60 ]; then
        DISK_STATUS="⚠️ ระวัง: ใช้ไป $DISK_USAGE%"
    else
        DISK_STATUS="✅ ปกติ: ใช้ไป $DISK_USAGE%"
    fi
    echo "  $DISK_STATUS"

    ### 2️⃣ ตรวจสอบ Memory
    echo ""
    echo "🟩 ตรวจสอบ Memory:"
    read MEM_TOTAL MEM_USED MEM_FREE <<< $(free -h | awk '/Mem/ {print $2,$3,$4}')
    echo "  ทั้งหมด: $MEM_TOTAL"
    echo "  ใช้ไป: $MEM_USED"
    echo "  เหลือ: $MEM_FREE"

    ### 3️⃣ ตรวจสอบ Services (ใช้ service command สำหรับ container)
    echo ""
    echo "🔧 ตรวจสอบ Services:"
    SERVICES="nginx mysql"
    for SERVICE in $SERVICES; do
        if service $SERVICE status > /dev/null 2>&1; then
            echo "  ✅ $SERVICE: ทำงานปกติ"
        else
            echo "  ❌ $SERVICE: หยุดทำงาน!"
        fi
    done

    ### 4️⃣ สร้าง Report สรุป
    echo ""
    echo "📑 === สรุปผล ==="
    echo "Disk: $DISK_STATUS"
    echo "Memory ใช้ไป: $MEM_USED / ทั้งหมด: $MEM_TOTAL"
    echo "Services:"
    for SERVICE in $SERVICES; do
        if service $SERVICE status > /dev/null 2>&1; then
            echo "  ✅ $SERVICE"
        else
            echo "  ❌ $SERVICE"
        fi
    done

    echo ""
    echo "========================================="
}

# เรียกใช้ function
check_server
